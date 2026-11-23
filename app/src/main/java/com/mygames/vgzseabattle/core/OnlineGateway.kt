package com.mygames.vgzseabattle.core

/**
 * NEW (crash fix + "Server is not reachable" report): the transport result now
 * carries the failure reason, so activities can tell "server answered with an
 * error code" apart from "server could not be reached at all" and can log it.
 */
class HttpResult private constructor(
    val ok: Boolean,
    val body: String,
    val error: String
) {
    companion object {
        fun success(body: String): HttpResult = HttpResult(true, body, "")
        fun failure(error: String): HttpResult = HttpResult(false, "", error)
    }
}

/**
 * NEW (product request: "use https when available" + crash fix): an endpoint
 * gateway that tries every candidate base URL (https first) and remembers the
 * scheme that worked. Every attempt is reported through [log] so FileLogger can
 * write it into Android/data/<package>/files/logs.
 *
 * The protocol itself is unchanged - faithful port of y.java endpoints.
 */
class OnlineGateway(
    private val transport: HttpTransport,
    private val baseUrl: String,
    private val preferredScheme: String? = null,
    private val log: (String) -> Unit = {}
) {
    /** Scheme ("https"/"http") of the base URL that answered last, null = unknown. */
    @Volatile
    var resolvedScheme: String? = null
        private set

    /** Test seam: lets a caller pin the scheme after a successful probe. */
    fun markScheme(scheme: String) {
        resolvedScheme = scheme
    }

    private fun postEndpoint(path: String, params: List<Pair<String, String>>): HttpResult {
        val candidates = ServerUrls.candidates(baseUrl, preferredScheme ?: resolvedScheme)
        var lastError = "no server address"
        for (url in candidates) {
            val result = transport.postDetailed("$url/$path", params)
            if (result.ok) {
                resolvedScheme = url.substringBefore("://")
                log("POST $url/$path ok (${result.body.length} bytes)")
                return result
            }
            lastError = result.error
            log("POST $url/$path failed: $lastError")
        }
        log("POST $path gave up after ${candidates.size} attempt(s): $lastError")
        return HttpResult.failure(lastError)
    }

    /** y.b(): register.php with UID + login. */
    fun register(uid: String, login: String): HttpResult =
        postEndpoint("register.php", listOf("UID" to uid, "login" to login))

    /** y.a(String): get_next_page.php with UID. */
    fun getNextPage(uid: String): HttpResult =
        postEndpoint("get_next_page.php", listOf("UID" to uid))

    /** y.a(String, String): top1.php with ID + Score. */
    fun submitScore(id: String, score: String): HttpResult =
        postEndpoint("top1.php", listOf("ID" to id, "Score" to score))

    /** y.a(): unregistered.php with Unregistered=1. */
    fun unregistered(): HttpResult =
        postEndpoint("unregistered.php", listOf("Unregistered" to "1"))

    companion object {
        const val RESP_OK = "1000"
    }
}
