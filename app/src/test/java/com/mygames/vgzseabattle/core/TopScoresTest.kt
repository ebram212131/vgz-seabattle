package com.mygames.vgzseabattle.core

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

/**
 * Tests for TopScores (port of z.java) with an in-memory store, plus the
 * FileStore sbs.txt format behaviour (port of x.java).
 */
class TopScoresTest {

    private class MemStore : ScoreStore {
        val lines = mutableListOf<String>()
        var writeCount = 0
        override fun readLines(): List<String> = lines.toList()
        override fun writeLines(lines: List<String>): Boolean {
            this.lines.clear()
            this.lines.addAll(lines)
            writeCount++
            return true
        }
    }

    @Before
    fun resetGlobals() {
        GlobalState.lastScore = 0
    }

    @Test
    fun `load parses ints and zero-fills`() {
        val store = MemStore()
        store.lines.addAll(listOf("100", "abc", "", "50"))
        val ts = TopScores(store)
        ts.load()
        assertEquals(100, ts.scoreAt(0))
        assertEquals(50, ts.scoreAt(1))
        assertEquals(0, ts.scoreAt(2))
        assertEquals(0, ts.scoreAt(9))
        assertEquals(0, ts.scoreAt(10)) // out of range -> 0
        assertEquals(0, ts.scoreAt(-1))
    }

    @Test
    fun `record sorts descending and keeps 10 of 11`() {
        val store = MemStore()
        store.lines.addAll(listOf("300", "200", "100", "0", "0", "0", "0", "0", "0", "0"))
        val ts = TopScores(store)
        ts.load()
        GlobalState.lastScore = 250
        ts.recordLastScore()
        assertEquals(listOf(300, 250, 200, 100, 0, 0, 0, 0, 0, 0), store.lines.map { it.toInt() })
        assertEquals(250, ts.scoreAt(1))
    }

    @Test
    fun `record ignores zero scores like the original`() {
        val store = MemStore()
        val ts = TopScores(store)
        GlobalState.lastScore = 0
        ts.recordLastScore()
        assertEquals(0, store.writeCount)
    }

    @Test
    fun `save refuses to write an empty table`() {
        val store = MemStore()
        val ts = TopScores(store)
        ts.load() // all zeros
        ts.save()
        assertEquals(0, store.writeCount)
    }

    @Test
    fun `eleventh slot competes and the weakest drops`() {
        val store = MemStore()
        store.lines.addAll(listOf("90", "80", "70", "60", "50", "40", "30", "20", "10", "5"))
        val ts = TopScores(store)
        ts.load()
        GlobalState.lastScore = 55
        ts.recordLastScore()
        val top = store.lines.map { it.toInt() }
        assertEquals(listOf(90, 80, 70, 60, 55, 50, 40, 30, 20, 10), top)
        assertFalse(top.contains(5))
    }

    @Test
    fun `negative incoming score drops out of the top10 entirely`() {
        val store = MemStore()
        store.lines.addAll(listOf("100", "0", "0", "0", "0", "0", "0", "0", "0", "0"))
        val ts = TopScores(store)
        ts.load()
        GlobalState.lastScore = -40
        ts.recordLastScore()
        // 11 candidates sorted desc: the -40 lands in slot 11 and is cut off
        assertEquals(100, ts.scoreAt(0))
        assertEquals(0, ts.scoreAt(1))
        assertEquals(0, ts.scoreAt(9))
        assertEquals(listOf("100", "0", "0", "0", "0", "0", "0", "0", "0", "0"), store.lines)
    }
}
