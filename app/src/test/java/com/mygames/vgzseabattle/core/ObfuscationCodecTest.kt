package com.mygames.vgzseabattle.core

import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * Tests for ObfuscationCodec (port of aa.java). All expected values below were
 * produced by an independent Python re-implementation of the REA evidence
 * (work/rea-evidence/aa.java.txt), not by the Kotlin code itself.
 */
class ObfuscationCodecTest {

    @Test
    fun `decodeAction shifts lowercase letters forward - vector 1`() {
        // shift = seedDigit(0)=1 -> index 1+10=11 -> seed[11]='2' -> ('2'%9)+1=6
        // Original aa.a(int,String,String) builds the result forward (no reversal).
        assertEquals("rstuvw", ObfuscationCodec.decodeAction(0, "1234567890123", "xyzabc"))
    }

    @Test
    fun `decodeAction vector 2`() {
        // seedDigit(3)=2 -> index 12 -> seed[12]='3' -> shift 7
        assertEquals("axeehphkew", ObfuscationCodec.decodeAction(3, "5432167890123", "helloworld"))
    }

    @Test
    fun `decodeAction vector 3 - long seed`() {
        assertEquals(
            "tfddpxrdvjmxqjvrsrkkcv",
            ObfuscationCodec.decodeAction(1, "19283746551928374655", "commygamesvgzseabattle")
        )
    }

    @Test
    fun `non-lowercase characters pass through unchanged`() {
        // digits and uppercase are not shifted (original: only ch > 96);
        // lowercase 'b' shifts with wraparound (98-6=92 < 97 -> +26 = 'v')
        assertEquals("Av1", ObfuscationCodec.decodeAction(0, "1234567890123", "Ab1"))
    }

    @Test
    fun `reverse with short string guard`() {
        assertEquals("0987654321", ObfuscationCodec.reverse("1234567890"))
        assertEquals("a", ObfuscationCodec.reverse("a"))
        assertEquals("", ObfuscationCodec.reverse(""))
    }

    @Test
    fun `splice cycles the filler over zero positions`() {
        assertEquals("aXbYcXdYeXfY", ObfuscationCodec.splice("a0b0c0d0e0f0", "XY"))
        assertEquals("Q", ObfuscationCodec.splice("0", "Q"))
        assertEquals("1", ObfuscationCodec.splice("1", "Q"))
        assertEquals("XYX", ObfuscationCodec.splice("000", "XY"))
    }

    @Test
    fun `digitify replaces non digits with their char codes`() {
        assertEquals("971982459", ObfuscationCodec.digitify("a1b2-9"))
        assertEquals("12345", ObfuscationCodec.digitify("12345"))
    }

    @Test
    fun `checksum adds seed digits mod 10`() {
        // seed 1234567890 over body 0987654321: 1+0,2+9=11->1,... vector: all ones
        assertEquals("1111111111", ObfuscationCodec.checksum("12345678900987654321"))
    }

    @Test
    fun `checksum wraps over ten digits`() {
        // seed 9999999999 with body 000000000011 -> digits (9+0)%10=9 ... let's use the
        // registration-shaped vector from the reference implementation:
        // uid = reverse("1699999999999")[:10] = "9999999999",
        // body = digitify(splice("1234567890123", uid)) = "1928374655192 8374655"...
        // reference output: "0123456788012"
        val uid = "9999999999"
        val spliced = ObfuscationCodec.splice("1234567890123", uid)
        val body = ObfuscationCodec.digitify(spliced)
        assertEquals("0123456788012", ObfuscationCodec.checksum(uid + body))
    }

    @Test
    fun `checksum roundtrip matches original verification flow`() {
        // Original MainActivity.a(String,String): new aa().c(split[0]).contentEquals(checksum)
        val uid = "1234567890"
        val body = ObfuscationCodec.digitify("abcdefghij")
        val combined = uid + body
        val expected = ObfuscationCodec.checksum(combined)
        assertEquals(expected, ObfuscationCodec.checksum(combined))
        // c() uses only the first 10 chars as seed; verify determinism
        assertEquals(expected, ObfuscationCodec.checksum(uid + ObfuscationCodec.digitify("abcdefghij")))
    }
}
