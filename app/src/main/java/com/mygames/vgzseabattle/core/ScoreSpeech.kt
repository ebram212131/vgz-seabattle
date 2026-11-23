package com.mygames.vgzseabattle.core

/**
 * Faithful port of l.java (ScoreSpeaker) number decomposition into sound tokens.
 *
 * Token space (MediaPlayer resource selectors in the Android layer):
 *   0..19        units and teens  (sound_score_0..sound_score_19)
 *   20..90/10    tens            (sound_score_20..sound_score_90)
 *   100, 1000, 1000000           magnitudes
 *   1000001      "final score"   (sound_say_final_score)
 *   1000002      "points"        (sound_say_points)
 *
 * Evidence: work/rea-evidence/l.java.txt (b(boolean) + c()).
 */
object ScoreSpeech {

    const val SAY_FINAL_SCORE = 1000001
    const val SAY_POINTS = 1000002

    /**
     * Original b(boolean z): [finalScore] adds the "final score" prefix.
     * Returns the exact play sequence, e.g. 1234 -> [1, 100, 200, 30, 4, 1000, 1000002].
     */
    fun plan(score: Int, finalScore: Boolean): List<Int> {
        val d = IntArray(20) { -1 }
        var i11 = 1
        var rest = score
        if (rest == 0) {
            if (finalScore) {
                d[0] = SAY_FINAL_SCORE
            } else {
                i11 = 0
            }
            d[i11] = 0
            d[i11 + 1] = SAY_POINTS
            return d.takeWhile { it != -1 }
        }
        if (finalScore) {
            d[0] = SAY_FINAL_SCORE
        } else {
            i11 = 0
        }

        // millions group
        val millions = rest / 1000000
        if (millions > 0) {
            rest -= millions * 1000000
            var idx = i11
            val hundredsOfMillions = millions / 100
            var remainder: Int
            if (hundredsOfMillions > 0) {
                remainder = millions - hundredsOfMillions * 100
                d[idx] = hundredsOfMillions
                d[idx + 1] = 100
                idx += 2
            } else {
                remainder = millions
            }
            val tens = remainder / 10
            var units: Int
            if (tens > 0) {
                units = remainder - tens * 10
                d[idx] = tens * 10
                idx++
            } else {
                units = remainder
            }
            if (units in 1..19) {
                d[idx] = units
                idx++
            }
            d[idx] = 1000000
            i11 = idx + 1
        }

        // thousands group
        val thousands = rest / 1000
        if (thousands > 0) {
            rest -= thousands * 1000
            var idx = i11
            val hundreds = thousands / 100
            var remainder: Int
            if (hundreds > 0) {
                d[idx] = hundreds
                d[idx + 1] = 100
                idx += 2
                remainder = thousands - hundreds * 100
            } else {
                remainder = thousands
            }
            val tens = remainder / 10
            var units: Int
            if (tens > 0) {
                units = remainder - tens * 10
                d[idx] = tens * 10
                idx++
            } else {
                units = remainder
            }
            if (units in 1..19) {
                d[idx] = units
                idx++
            }
            d[idx] = 1000
            i11 = idx + 1
        }

        // hundreds
        val hundreds = rest / 100
        if (hundreds > 0) {
            rest -= hundreds * 100
            d[i11] = hundreds
            d[i11 + 1] = 100
            i11 += 2
        }

        // tens + units (teens 1..19 spoken as one token)
        if (rest <= 0 || rest >= 20) {
            val tens = rest / 10
            if (tens > 0) {
                rest -= tens * 10
                d[i11] = tens * 10
                i11++
            }
            d[i11] = rest
            i11++
        } else {
            d[i11] = rest
            i11++
        }
        d[i11] = SAY_POINTS
        return d.takeWhile { it != -1 }
    }
}
