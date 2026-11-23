package com.mygames.vgzseabattle.core

import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * Tests for ScoreSpeech (port of l.java b(boolean)) with expectations produced by
 * an independent Python re-implementation of the REA evidence (l.java.txt):
 *
 *   0  false -> [0, 1000002]
 *   7  false -> [7, 1000002]
 *  15  false -> [15, 1000002]
 *  20  false -> [20, 0, 1000002]      (original trailing zero quirk)
 *  23  false -> [20, 3, 1000002]
 * 100  false -> [1, 100, 0, 1000002]
 * 205  false -> [2, 100, 5, 1000002]
 * 1000 false -> [1, 1000, 0, 1000002]
 * 1400 false -> [1, 1000, 4, 100, 0, 1000002]
 * 1234567 -> [1, 1000000, 2, 100, 30, 4, 1000, 5, 100, 60, 7, 1000002]
 */
class ScoreSpeechTest {

    @Test
    fun `zero without final prefix`() {
        assertEquals(listOf(0, ScoreSpeech.SAY_POINTS), ScoreSpeech.plan(0, false))
    }

    @Test
    fun `zero with final prefix`() {
        assertEquals(
            listOf(ScoreSpeech.SAY_FINAL_SCORE, 0, ScoreSpeech.SAY_POINTS),
            ScoreSpeech.plan(0, true)
        )
    }

    @Test
    fun `single digit`() {
        assertEquals(listOf(7, ScoreSpeech.SAY_POINTS), ScoreSpeech.plan(7, false))
    }

    @Test
    fun `teen spoken as one token`() {
        assertEquals(listOf(15, ScoreSpeech.SAY_POINTS), ScoreSpeech.plan(15, false))
        assertEquals(listOf(19, ScoreSpeech.SAY_POINTS), ScoreSpeech.plan(19, false))
    }

    @Test
    fun `round tens keep original trailing zero token`() {
        assertEquals(listOf(20, 0, ScoreSpeech.SAY_POINTS), ScoreSpeech.plan(20, false))
        assertEquals(listOf(90, 0, ScoreSpeech.SAY_POINTS), ScoreSpeech.plan(90, false))
    }

    @Test
    fun `mixed tens and units`() {
        assertEquals(listOf(20, 3, ScoreSpeech.SAY_POINTS), ScoreSpeech.plan(23, false))
    }

    @Test
    fun `hundreds carry trailing zero like the original`() {
        assertEquals(listOf(1, 100, 0, ScoreSpeech.SAY_POINTS), ScoreSpeech.plan(100, false))
        assertEquals(
            listOf(1, 100, 20, 0, ScoreSpeech.SAY_POINTS),
            ScoreSpeech.plan(120, false)
        )
        assertEquals(listOf(2, 100, 5, ScoreSpeech.SAY_POINTS), ScoreSpeech.plan(205, false))
    }

    @Test
    fun `thousands group`() {
        assertEquals(
            listOf(1, 1000, 0, ScoreSpeech.SAY_POINTS),
            ScoreSpeech.plan(1000, false)
        )
        assertEquals(
            listOf(1, 1000, 1, 100, 20, 0, ScoreSpeech.SAY_POINTS),
            ScoreSpeech.plan(1120, false)
        )
        assertEquals(
            listOf(1, 1000, 40, 0, ScoreSpeech.SAY_POINTS),
            ScoreSpeech.plan(1040, false)
        )
    }

    @Test
    fun `game-typical score 1400`() {
        assertEquals(
            listOf(1, 1000, 4, 100, 0, ScoreSpeech.SAY_POINTS),
            ScoreSpeech.plan(1400, false)
        )
    }

    @Test
    fun `millions group ends with 1000000 token`() {
        assertEquals(
            listOf(1, 1000000, 0, ScoreSpeech.SAY_POINTS),
            ScoreSpeech.plan(1000000, false)
        )
        assertEquals(
            listOf(2, 1000000, 5, 100, 1000, 0, ScoreSpeech.SAY_POINTS),
            ScoreSpeech.plan(2500000, false)
        )
        assertEquals(
            listOf(1, 1000000, 2, 100, 30, 4, 1000, 5, 100, 60, 7, ScoreSpeech.SAY_POINTS),
            ScoreSpeech.plan(1234567, false)
        )
    }

    @Test
    fun `final score prefix`() {
        assertEquals(
            listOf(ScoreSpeech.SAY_FINAL_SCORE, 20, 0, ScoreSpeech.SAY_POINTS),
            ScoreSpeech.plan(20, true)
        )
        assertEquals(
            listOf(ScoreSpeech.SAY_FINAL_SCORE, 5, ScoreSpeech.SAY_POINTS),
            ScoreSpeech.plan(5, true)
        )
    }

    @Test
    fun `documented original quirk - twenty is spoken with a trailing zero`() {
        // sound_score_20 exists as a resource and the tens slot emits it,
        // but the units slot always follows - even with 0.
        val plan = ScoreSpeech.plan(20, true)
        assertEquals(ScoreSpeech.SAY_FINAL_SCORE, plan[0])
        assertEquals(20, plan[1])
        assertEquals(0, plan[2])
    }
}
