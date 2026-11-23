package com.mygames.vgzseabattle

import com.mygames.vgzseabattle.core.TopScores

/**
 * Holder for the global top-scores instance (original p.e) built on FileStore.
 */
object TopScoresHolder {
    @Volatile var instance: TopScores? = null
        private set

    /** Original "if (p.e == null) { p.e = new z(); p.e.a(); }". */
    fun obtain(files: FileStore): TopScores {
        if (instance == null) {
            val ts = TopScores(files)
            ts.load()
            instance = ts
        }
        return instance!!
    }
}
