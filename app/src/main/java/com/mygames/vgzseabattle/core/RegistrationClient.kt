package com.mygames.vgzseabattle.core

/**
 * Faithful port of y.java (the four vipgameszone endpoints) with two documented
 * extensions requested by the product owner:
 *   1. the base URL is configurable so the account system stays optional and
 *      can point at a custom server (see OnlineGateway for https-first failover);
 *   2. transports can report WHY a request failed (HttpResult), so the UI can
 *      show "Server is not reachable" instead of crashing on a dead server.
 *
 * Evidence: work/rea-evidence/y.java.txt.
 *
 * Original endpoints (base http://android.vipgameszone.com/sea_battle):
 *   unregistered.php  POST Unregistered=1            -> splash redirect payload
 *   get_next_page.php POST UID=...                   -> menu redirect payload
 *   top1.php          POST ID=... Score=...          -> submit score (rank 1..10 or 0)
 *   register.php      POST UID=... login=...         -> registration
 */
interface HttpTransport {
    /** Executes one POST and returns the response body, or "" on any failure. */
    fun post(url: String, params: List<Pair<String, String>>): String

    /** Same call, but keeps the failure reason for logging / user dialogs. */
    fun postDetailed(url: String, params: List<Pair<String, String>>): HttpResult =
        HttpResult.success(post(url, params))
}

object RegistrationClient {

    const val DEFAULT_BASE_URL = "http://android.vipgameszone.com/sea_battle"

    // Response markers kept from the original protocol.
    const val RESP_OK = "1000"
    const val ERR_LOGIN_EXPECTED = "1"
    const val ERR_USER_ID_EXPECTED = "2"
    const val ERR_LOGIN_TAKEN = "3"

    fun unregistered(transport: HttpTransport, baseUrl: String = DEFAULT_BASE_URL): String =
        transport.post("$baseUrl/unregistered.php", listOf("Unregistered" to "1"))

    fun getNextPage(transport: HttpTransport, uid: String, baseUrl: String = DEFAULT_BASE_URL): String =
        transport.post("$baseUrl/get_next_page.php", listOf("UID" to uid))

    fun submitScore(transport: HttpTransport, id: String, score: String, baseUrl: String = DEFAULT_BASE_URL): String =
        transport.post("$baseUrl/top1.php", listOf("ID" to id, "Score" to score))

    fun register(transport: HttpTransport, uid: String, login: String, baseUrl: String = DEFAULT_BASE_URL): String =
        transport.post("$baseUrl/register.php", listOf("UID" to uid, "login" to login))
}

/** java.net.HttpURLConnection based transport, mirroring the original DefaultHttpClient calls. */
class HttpURLConnectionTransport : HttpTransport {

    override fun post(url: String, params: List<Pair<String, String>>): String =
        postDetailed(url, params).body

    override fun postDetailed(url: String, params: List<Pair<String, String>>): HttpResult {
        return try {
            val conn = java.net.URL(url).openConnection() as java.net.HttpURLConnection
            conn.requestMethod = "POST"
            conn.doOutput = true
            conn.connectTimeout = 5000
            conn.readTimeout = 10000
            val body = params.joinToString("&") { (k, v) ->
                java.net.URLEncoder.encode(k, "UTF-8") + "=" + java.net.URLEncoder.encode(v, "UTF-8")
            }
            conn.getOutputStream().use { it.write(body.toByteArray(Charsets.UTF_8)) }
            val code = conn.responseCode
            if (code != 200) {
                return HttpResult.failure("HTTP $code")
            }
            HttpResult.success(conn.inputStream.bufferedReader().use { it.readText() }.trim())
        } catch (e: Exception) {
            HttpResult.failure(e.javaClass.simpleName + ": " + (e.message ?: "connection failed"))
        }
    }
}
