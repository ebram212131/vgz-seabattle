package com.mygames.vgzseabattle

import android.content.Context
import com.mygames.vgzseabattle.core.GlobalState
import com.mygames.vgzseabattle.core.ScoreStore
import java.io.File

/**
 * Faithful port of x.java (file storage) — the original read/wrote data0.txt,
 * data1.txt and sbs.txt inside the application data directory (p.f =
 * applicationInfo.dataDir). Modern scoped-storage equivalent: context.filesDir.
 */
class FileStore(private val filesDir: File) : ScoreStore {

    constructor(context: Context) : this(context.getApplicationContext().filesDir)

    private fun file(name: String): File = File(filesDir, name)

    /** Original a(String): read the whole file, joining lines without separators. */
    fun readAll(name: String): String {
        return try {
            val f = file(name)
            if (!f.exists()) return ""
            f.readLines().joinToString("")
        } catch (e: Exception) {
            ""
        }
    }

    /** Original b(String): same as a(String) but tolerant of missing files (returns ""). */
    fun readIfExists(name: String): String = readAll(name)

    /** Original a(String, String): write text. */
    fun writeAll(name: String, content: String): Boolean {
        return try {
            filesDir.mkdirs()
            file(name).writeText(content)
            true
        } catch (e: Exception) {
            false
        }
    }

    /** Original a(String[]): write up to 10 non-empty score lines into sbs.txt. */
    fun writeScoreLines(lines: Array<String>): Boolean {
        var hasAny = false
        for (i in lines.indices) {
            if (i > 9) break
            if (lines[i].isNotEmpty()) hasAny = true
        }
        if (!hasAny) return false
        return try {
            val f = file("sbs.txt")
            f.printWriter().use { out ->
                for (i in lines.indices) {
                    out.println(lines[i])
                    if (lines[i].isEmpty() || i > 9) {
                        break
                    }
                }
            }
            true
        } catch (e: Exception) {
            false
        }
    }

    /** Original a(): read sbs.txt into a fixed 10-slot array. */
    fun readScoreLines(): Array<String> {
        val out = Array(10) { "" }
        return try {
            val f = file("sbs.txt")
            if (!f.exists()) return out
            var i = 0
            f.useLines { seq ->
                for (line in seq) {
                    if (i >= 10) break
                    out[i] = line
                    i++
                }
            }
            out
        } catch (e: Exception) {
            out
        }
    }

    // ScoreStore bridge for the pure-Kotlin TopScores class.
    override fun readLines(): List<String> = readScoreLines().toList()

    override fun writeLines(lines: List<String>): Boolean {
        val arr = Array(10) { i -> lines.getOrElse(i) { "" } }
        return writeScoreLines(arr)
    }

    /** v.java: publish the data directory into the original p.f global. */
    fun publishDataDir() {
        GlobalState.dataDir = filesDir.absolutePath
    }
}
