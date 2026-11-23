package com.mygames.vgzseabattle.core

/**
 * NEW (product request: "use https when available"): small helper that turns a
 * user-entered server address into an ordered list of candidate base URLs.
 *
 * Rules:
 *  - An address without an explicit scheme gets https first, then http.
 *  - An address WITH an explicit scheme (http:// or https://) is used as-is,
 *    the user explicitly pinned the protocol.
 *  - A remembered "preferred scheme" (the one that worked last time) is tried
 *    first so a host with broken TLS does not slow every request down.
 */
object ServerUrls {

    private const val DEFAULT_SCHEME = "https"

    /** Trims the address, removes a trailing '/' and adds a lowercase scheme when missing. */
    fun normalize(url: String): String {
        var u = url.trim().trimEnd('/')
        if (!hasExplicitScheme(u)) {
            u = "$DEFAULT_SCHEME://$u"
        } else {
            val scheme = u.substringBefore("://").lowercase()
            u = "$scheme://" + u.substringAfter("://")
        }
        return u
    }

    /** True when the address already starts with http:// or https://. */
    fun hasExplicitScheme(url: String): Boolean {
        val trimmed = url.trim()
        if (!trimmed.contains("://")) return false
        return trimmed.substringBefore("://").lowercase() == "http" ||
            trimmed.substringBefore("://").lowercase() == "https"
    }

    /** Rewrites the scheme of a normalized address (keeps host + path). */
    fun withScheme(url: String, scheme: String): String {
        val n = normalize(url)
        return "$scheme://" + n.substringAfter("://")
    }

    /** Ordered candidate base URLs to try, first entry = most preferred. */
    fun candidates(url: String, preferredScheme: String? = null): List<String> {
        val trimmed = url.trim()
        if (hasExplicitScheme(trimmed)) {
            return listOf(normalize(trimmed))
        }
        val hostPart = normalize(trimmed).substringAfter("://")
        val https = "https://$hostPart"
        val http = "http://$hostPart"
        return when (preferredScheme) {
            "http" -> listOf(http, https)
            "https" -> listOf(https, http)
            else -> listOf(https, http)
        }
    }
}
