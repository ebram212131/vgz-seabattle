package com.mygames.vgzseabattle.core

/**
 * Faithful port of aa.java — the registration/response obfuscation codec.
 * Evidence: work/rea-evidence/aa.java.txt (all 8 members).
 */
object ObfuscationCodec {

    /** Original private a(int, String): seed digit at [index]. */
    private fun seedDigit(index: Int, seed: String): Int = seed[index] - '0'

    /** Original private b(int, String): (seed[i] % 9) + 1 — '\t' is 9. */
    private fun shiftAmount(index: Int, seed: String): Int = (seed[index].code % 9) + 1

    /**
     * Original a(int, String, String): Caesar-shift lowercase letters of [payload]
     * by shiftAmount(seedDigit(seedIndex, seed) + 10, seed). The original builds the
     * result in forward order — no reversal happens here.
     */
    fun decodeAction(seedIndex: Int, seed: String, payload: String): String {
        val shift = shiftAmount(seedDigit(seedIndex, seed) + 10, seed)
        val sb = StringBuilder()
        for (ch in payload) {
            var code = ch.code
            if (code > 96) {
                code -= shift
                if (code < 97) code += 26
            }
            sb.append(code.toChar())
        }
        return sb.toString()
    }

    /** Original a(String): reverse with the length < 2 guard. */
    fun reverse(value: String): String {
        if (value.length < 2 || value.length - 1 < 1) return value
        return value.reversed()
    }

    /**
     * Original a(String, String): splice [filler] characters into every '0' of [pattern],
     * cycling the filler. An empty filler leaves the pattern unchanged (safety guard;
     * the original could only hit this with an empty device seed, which it avoided
     * by using "nullnull" as the IMEI string).
     */
    fun splice(pattern: String, filler: String): String {
        if (filler.isEmpty()) return pattern
        val sb = StringBuilder()
        var i = 0
        for (ch in pattern) {
            if (ch == '0') {
                sb.append(filler[i])
                i++
                if (i >= filler.length) i = 0
            } else {
                sb.append(ch)
            }
        }
        return sb.toString()
    }

    /**
     * Original b(String): keep digits, replace every other character with its char code
     * rendered in decimal.
     */
    fun digitify(value: String): String {
        val sb = StringBuilder()
        for (ch in value) {
            if (ch < '0' || ch > '9') {
                sb.append(ch.code)
            } else {
                sb.append(ch)
            }
        }
        return sb.toString()
    }

    /**
     * Original c(String): first 10 characters are the seed digits; every remaining digit
     * becomes (seed[i % 10] + digit) mod 10.
     */
    fun checksum(value: String): String {
        val seed = value.substring(0, 10)
        val body = value.substring(10)
        val sb = StringBuilder()
        var i = 0
        for (ch in body) {
            var v = (seed[i] - '0') + (ch - '0')
            if (v > 9) v -= 10
            sb.append(v)
            i++
            if (i > 9) i = 0
        }
        return sb.toString()
    }
}
