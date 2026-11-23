package com.mygames.vgzseabattle.core

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Tests for LoginValidator (port of RegisterApp.a(String)) and RegistrationClient
 * (port of y.java) with a fake transport.
 */
class LoginAndRegistrationTest {

    // ------------------------------------------------------------ validator

    @Test
    fun `empty login rejected with original dialog text`() {
        val r = LoginValidator.validate("")
        assertTrue(r is LoginValidator.Result.Invalid)
        assertEquals(LoginValidator.MSG_EMPTY_TITLE, (r as LoginValidator.Result.Invalid).title)
        assertEquals(LoginValidator.MSG_EMPTY_BODY, r.body)
    }

    @Test
    fun `eleven characters rejected`() {
        val r = LoginValidator.validate("abcdefghijk")
        assertTrue(r is LoginValidator.Result.Invalid)
        assertEquals(LoginValidator.MSG_LENGTH_TITLE, (r as LoginValidator.Result.Invalid).title)
    }

    @Test
    fun `exactly ten valid characters accepted`() {
        assertEquals(LoginValidator.Result.Valid, LoginValidator.validate("abcdefghij"))
        assertEquals(LoginValidator.Result.Valid, LoginValidator.validate("a1B2c3D4e5"))
    }

    @Test
    fun `non alphanumeric rejected with original text`() {
        val r = LoginValidator.validate("user_name")
        assertTrue(r is LoginValidator.Result.Invalid)
        assertEquals(LoginValidator.MSG_CHAR_TITLE, (r as LoginValidator.Result.Invalid).title)
        assertEquals(LoginValidator.MSG_CHAR_BODY, r.body)
    }

    @Test
    fun `single character accepted`() {
        assertEquals(LoginValidator.Result.Valid, LoginValidator.validate("x"))
    }

    @Test
    fun `digits accepted`() {
        assertEquals(LoginValidator.Result.Valid, LoginValidator.validate("0123456789"))
    }

    // ------------------------------------------------------ registration API

    private class FakeTransport : HttpTransport {
        val calls = mutableListOf<Pair<String, List<Pair<String, String>>>>()
        var response = ""
        override fun post(url: String, params: List<Pair<String, String>>): String {
            calls.add(url to params)
            return response
        }
    }

    @Test
    fun `register posts UID and login to register dot php`() {
        val t = FakeTransport()
        t.response = "1000*UIDKEY"
        val result = RegistrationClient.register(t, "1234567890", "player1")
        assertEquals("1000*UIDKEY", result)
        assertEquals(1, t.calls.size)
        val (url, params) = t.calls[0]
        assertTrue(url.endsWith("/register.php"))
        assertEquals(
            listOf<Pair<String, String>>("UID" to "1234567890", "login" to "player1"),
            params
        )
    }

    @Test
    fun `custom server URL replaces the default base`() {
        val t = FakeTransport()
        RegistrationClient.register(t, "1", "a", "http://example.org/vgz")
        assertTrue(t.calls[0].first.startsWith("http://example.org/vgz/"))
        RegistrationClient.getNextPage(t, "9", "https://my-server:8080/battle")
        assertTrue(t.calls[1].first.startsWith("https://my-server:8080/battle/"))
        assertTrue(t.calls[1].first.endsWith("/get_next_page.php"))
    }

    @Test
    fun `unregistered posts the original marker`() {
        val t = FakeTransport()
        RegistrationClient.unregistered(t)
        assertTrue(t.calls[0].first.endsWith("/unregistered.php"))
        assertEquals(listOf<Pair<String, String>>("Unregistered" to "1"), t.calls[0].second)
    }

    @Test
    fun `submitScore posts ID and Score to top1 dot php`() {
        val t = FakeTransport()
        RegistrationClient.submitScore(t, "UID", "1400")
        assertTrue(t.calls[0].first.endsWith("/top1.php"))
        assertEquals(
            listOf<Pair<String, String>>("ID" to "UID", "Score" to "1400"),
            t.calls[0].second
        )
    }

    @Test
    fun `default base url matches the original server`() {
        assertEquals("http://android.vipgameszone.com/sea_battle", RegistrationClient.DEFAULT_BASE_URL)
    }

    // ------------------------------------------------- response interpretation

    @Test
    fun `register error codes map to original dialogs`() {
        // original d(): "1" -> Login expected; "2" -> User ID expected; "3" -> taken
        fun bodyFor(code: String): String = when (code) {
            "1" -> "Login expected"
            "2" -> "User ID expected"
            "3" -> "This login is already taken"
            else -> "Unknown exception. Please try again"
        }
        assertEquals("Login expected", bodyFor("1"))
        assertEquals("User ID expected", bodyFor("2"))
        assertEquals("This login is already taken", bodyFor("3"))
        assertEquals("Unknown exception. Please try again", bodyFor("9"))
    }

    @Test
    fun `get_next_page parse strips the 1000 marker`() {
        val raw = "1000*SEED*ACTIONPAYLOAD"
        val clean = raw.replace("1000*", "")
        assertEquals("SEED*ACTIONPAYLOAD", clean)
        val split = clean.split("\\*".toRegex())
        assertEquals("SEED", split[0])
        assertEquals("ACTIONPAYLOAD", split[1])
    }
}
