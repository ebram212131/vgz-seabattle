package com.mygames.vgzseabattle.core

import com.mygames.vgzseabattle.FileStore
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

/**
 * Tests for FileStore (port of x.java): data0.txt / data1.txt / sbs.txt handling.
 * The File-based constructor is pure JVM, so no Android device is required.
 */
class FileStoreTest {

    @get:Rule
    val tmp = TemporaryFolder()

    @Test
    fun `write and read roundtrip joins lines`() {
        val fs = FileStore(tmp.root)
        assertTrue(fs.writeAll("data0.txt", "1234567890"))
        assertEquals("1234567890", fs.readAll("data0.txt"))
    }

    @Test
    fun `readAll on missing file returns empty string`() {
        val fs = FileStore(tmp.root)
        assertEquals("", fs.readAll("data1.txt"))
    }

    @Test
    fun `readIfExists tolerates missing files`() {
        val fs = FileStore(tmp.root)
        assertEquals("", fs.readIfExists("nope.txt"))
    }

    @Test
    fun `multi-line content joins without separator`() {
        val fs = FileStore(tmp.root)
        File(tmp.root, "multi.txt").writeText("ab\ncd\nef\n")
        assertEquals("abcdef", fs.readAll("multi.txt"))
    }

    @Test
    fun `score lines roundtrip keeps order`() {
        val fs = FileStore(tmp.root)
        val lines = arrayOf("1400", "900", "250", "", "0", "", "", "", "", "")
        assertTrue(fs.writeScoreLines(lines))
        val back = fs.readScoreLines()
        assertEquals("1400", back[0])
        assertEquals("900", back[1])
        assertEquals("250", back[2])
        // original loop writes the empty line, then breaks - everything after it
        // (including the "0") is dropped, exactly like the source
        assertEquals("", back[3])
        assertEquals("", back[4])
        assertEquals(10, back.size)
    }

    @Test
    fun `score write refuses when all lines are empty`() {
        val fs = FileStore(tmp.root)
        val lines = Array(10) { "" }
        assertFalse(fs.writeScoreLines(lines))
        assertFalse(File(tmp.root, "sbs.txt").exists())
    }

    @Test
    fun `score write stops after the first empty line like the original`() {
        val fs = FileStore(tmp.root)
        val lines = arrayOf("100", "90", "", "70", "60")
        assertTrue(fs.writeScoreLines(lines))
        // original loop: appends until an empty line or index > 9 -> only 2 lines written
        val text = File(tmp.root, "sbs.txt").readText()
        val out = text.trim().lines()
        assertEquals(listOf("100", "90"), out)
    }

    @Test
    fun `ScoreStore bridge feeds TopScores`() {
        val fs = FileStore(tmp.root)
        fs.writeAll("sbs.txt", "500\n400\n300\n")
        val ts = TopScores(fs)
        ts.load()
        assertEquals(500, ts.scoreAt(0))
        assertEquals(400, ts.scoreAt(1))
        assertEquals(300, ts.scoreAt(2))
    }

    @Test
    fun `publishDataDir mirrors original p dot f`() {
        GlobalState.dataDir = ""
        val fs = FileStore(tmp.root)
        fs.publishDataDir()
        assertEquals(tmp.root.absolutePath, GlobalState.dataDir)
    }
}
