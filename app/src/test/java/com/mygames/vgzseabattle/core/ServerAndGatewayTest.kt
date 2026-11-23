package com.mygames.vgzseabattle.core

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Tests for the https-first server address resolution (product request:
 * "use https when available").
 */
class ServerUrlsTest {

    @Test
    fun `scheme-less address defaults to https`() {
        assertEquals("https://myhost.com/vgz", ServerUrls.normalize("myhost.com/vgz"))
        assertEquals("https://myhost.com/vgz", ServerUrls.normalize(" myhost.com/vgz/ "))
    }

    @Test
    fun `explicit schemes are kept`() {
        assertEquals("http://myhost.com/vgz", ServerUrls.normalize("http://myhost.com/vgz"))
        assertEquals("https://myhost.com/vgz", ServerUrls.normalize("HTTPS://myhost.com/vgz"))
    }

    @Test
    fun `trailing slash is stripped`() {
        assertEquals("https://a.b/c", ServerUrls.normalize("a.b/c/"))
        assertEquals("http://a.b/c", ServerUrls.normalize("http://a.b/c///"))
    }

    @Test
    fun `explicit scheme yields exactly one candidate`() {
        assertEquals(
            listOf("https://host/path"),
            ServerUrls.candidates("https://host/path")
        )
        assertEquals(
            listOf("http://host/path"),
            ServerUrls.candidates("http://host/path", "https")
        )
    }

    @Test
    fun `scheme-less addresses try https first then http`() {
        assertEquals(
            listOf("https://host:8080/battle", "http://host:8080/battle"),
            ServerUrls.candidates("host:8080/battle")
        )
    }

    @Test
    fun `preferred scheme is tried first`() {
        assertEquals(
            listOf("http://host/b", "https://host/b"),
            ServerUrls.candidates("host/b", "http")
        )
        assertEquals(
            listOf("https://host/b", "http://host/b"),
            ServerUrls.candidates("host/b", "https")
        )
    }

    @Test
    fun `scheme rewriting keeps host and path`() {
        assertEquals("http://host/vgz", ServerUrls.withScheme("https://host/vgz", "http"))
        assertEquals("https://host/vgz", ServerUrls.withScheme("host/vgz", "https"))
    }

    @Test
    fun `explicit scheme detection`() {
        assertTrue(ServerUrls.hasExplicitScheme("http://a.b"))
        assertTrue(ServerUrls.hasExplicitScheme("https://a.b"))
        assertFalse(ServerUrls.hasExplicitScheme("a.b/c"))
        assertFalse(ServerUrls.hasExplicitScheme("ftp://a.b"))
        assertFalse(ServerUrls.hasExplicitScheme(""))
    }
}

/**
 * Tests for OnlineGateway: https-first failover, scheme memory and error
 * reporting through HttpResult (the "Server is not reachable" data source).
 */
class OnlineGatewayTest {

    /** Transport with a per-scheme failure switch. */
    private class SchemeTransport(
        private val failingSchemes: MutableSet<String>,
        private val bodies: Map<String, String> = emptyMap()
    ) : HttpTransport {
        val attempts = mutableListOf<String>()

        override fun post(url: String, params: List<Pair<String, String>>): String =
            postDetailed(url, params).body

        override fun postDetailed(url: String, params: List<Pair<String, String>>): HttpResult {
            attempts.add(url)
            val scheme = url.substringBefore("://")
            return if (scheme in failingSchemes) {
                HttpResult.failure("Simulated " + scheme + " outage")
            } else {
                HttpResult.success(bodies[url] ?: "1000*KEY*payload")
            }
        }
    }

    @Test
    fun `https failure falls back to http and returns the body`() {
        val t = SchemeTransport(mutableSetOf("https"))
        val gw = OnlineGateway(t, "myhost.com/vgz") { }
        val result = gw.register("UID", "player")
        assertTrue(result.ok)
        assertEquals("1000*KEY*payload", result.body)
        assertEquals("http", gw.resolvedScheme)
        assertEquals(2, t.attempts.size)
        assertTrue(t.attempts[0].startsWith("https://"))
        assertTrue(t.attempts[1].startsWith("http://"))
        assertTrue(t.attempts[0].endsWith("/register.php"))
    }

    @Test
    fun `explicit http address is used as-is`() {
        val t = SchemeTransport(mutableSetOf("https"))
        val gw = OnlineGateway(t, "http://myhost.com/vgz") { }
        val result = gw.getNextPage("UID")
        assertTrue(result.ok)
        assertEquals(1, t.attempts.size)
        assertTrue(t.attempts[0].startsWith("http://"))
    }

    @Test
    fun `remembered scheme is tried first`() {
        val t = SchemeTransport(mutableSetOf("https"))
        val gw = OnlineGateway(t, "myhost.com/vgz", "http") { }
        gw.unregistered()
        assertTrue(t.attempts[0].startsWith("http://"))
        assertEquals(1, t.attempts.size)
    }

    @Test
    fun `total outage reports the error instead of crashing`() {
        val t = SchemeTransport(mutableSetOf("https", "http"))
        var logged = 0
        val gw = OnlineGateway(t, "myhost.com/vgz") { logged++ }
        val result = gw.submitScore("ID", "500")
        assertFalse(result.ok)
        assertEquals("", result.body)
        assertTrue(result.error.contains("outage"))
        assertEquals(2, t.attempts.size)
        assertTrue(logged >= 3) // one log line per failed attempt + the give-up line
    }

    @Test
    fun `all four original endpoints are wired`() {
        val t = SchemeTransport(mutableSetOf())
        val gw = OnlineGateway(t, "myhost.com/vgz") { }
        gw.register("U", "L")
        gw.getNextPage("U")
        gw.submitScore("I", "S")
        gw.unregistered()
        assertTrue(t.attempts[0].endsWith("/register.php"))
        assertTrue(t.attempts[1].endsWith("/get_next_page.php"))
        assertTrue(t.attempts[2].endsWith("/top1.php"))
        assertTrue(t.attempts[3].endsWith("/unregistered.php"))
    }
}
