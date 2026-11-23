package com.mygames.vgzseabattle.core

/**
 * Faithful port of z.java (top-10 score storage) and x.java score file format.
 *
 * Evidence: work/rea-evidence/z.java.txt.
 */
class TopScores(private val store: ScoreStore) {

    /** 11 slots: 10 stored + 1 incoming, exactly like the original a[11]. */
    private val scores = IntArray(11)

    /** Original a(): load 10 lines, parse (bad/empty -> 0), then selection sort descending. */
    fun load() {
        for (i in 0 until 11) scores[i] = 0
        val lines = store.readLines()
        for (i in lines.indices) {
            scores[i] = if (lines[i].isEmpty()) 0 else (lines[i].toIntOrNull() ?: 0)
        }
        sortDescending()
    }

    /** Original a(int): rank lookup, 0-based; out of range -> 0. */
    fun scoreAt(rank: Int): Int = if (rank in 0..9) scores[rank] else 0

    /** Original b(): persist top 10 when the list is non-empty. */
    fun save() {
        if (scores[0] == 0) return
        store.writeLines((0 until 10).map { scores[it].toString() })
    }

    /** Original c(): record GlobalState.lastScore (ignored when 0), sort, save. */
    fun recordLastScore() {
        val incoming = GlobalState.lastScore
        if (incoming == 0) return
        scores[10] = incoming
        sortDescending()
        save()
    }

    /** Original d(): selection sort, descending, over all 11 slots. */
    private fun sortDescending() {
        for (i in 0 until 10) {
            for (j in i + 1 until 11) {
                if (scores[i] < scores[j]) {
                    val t = scores[i]
                    scores[i] = scores[j]
                    scores[j] = t
                }
            }
        }
    }
}

/** Storage abstraction backed by x.java (sbs.txt) on Android. */
interface ScoreStore {
    fun readLines(): List<String>
    fun writeLines(lines: List<String>): Boolean
}
