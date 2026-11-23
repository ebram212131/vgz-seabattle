package com.mygames.vgzseabattle.core

/**
 * Faithful Kotlin port of the original VGZ Sea Battle game engine
 * (ActivityGameScreen + handler a.java from com.mygames.vgzseabattle).
 *
 * Evidence source: REA decompilation of com.mygames.vgzseabattle.ActivityGameScreen
 * (work/rea-evidence/ActivityGameScreen.java.txt), verified byte-for-byte against jadx output.
 *
 * Grid cell states (exact original constants):
 *  0 = unknown water, 1 = ship, 3 = destroyed ship, 4 = known empty.
 *
 * Original quirks are preserved on purpose:
 *  - placement coordinates are drawn from nextInt(10 - shipSize) for BOTH axes,
 *    so long ships are never placed in the last (size-1) rows/columns;
 *  - the AI fallback scan checks n[u][v] instead of n[i][j] (original bug);
 *  - a sunk "you hit" plays the quiet lose1 sound (d(1));
 *  - score is floored at 0 only when the final score is announced.
 */
class SeaBattleEngine(private val random: java.util.Random = java.util.Random()) {

    companion object {
        const val WATER_UNKNOWN = 0
        const val SHIP = 1
        const val DESTROYED = 3
        const val EMPTY_KNOWN = 4

        /** Fleet exactly as placed by the original f()/g(): 1x4, 2x3, 3x2, 4x1. */
        val FLEET = intArrayOf(4, 3, 3, 2, 2, 2, 1, 1, 1, 1)
        const val FLEET_CELLS = 20
        const val SIZE = 10

        const val SCREEN_MY = 0
        const val SCREEN_OPPONENT = 1

        // Sound ids exactly as loaded by the original b(): index into sound resource table.
        const val SND_BGRN = 0
        const val SND_MENU = 1
        const val SND_SHIP = 2
        const val SND_EMPTY = 3
        const val SND_GUN = 4
        const val SND_LOSE1 = 5
        const val SND_LOSE2 = 6
        const val SND_SUCCESS = 7
        const val SND_DESTROY = 8
        const val SND_KILLED = 9
        const val SND_YOU_SHOOT = 10
        const val SND_OPPONENT_SHOOTS = 11

        // f(int) event codes from the original switch:
        const val EV_SHIP = 1
        const val EV_KILLED = 3
        const val EV_EMPTY = 4
        const val EV_DESTROY = 5
        const val EV_YOU_SHOOT = 10
        const val EV_OPPONENT_SHOOTS = 11
    }

    /** Listener receiving the original engine's observable effects, in original order. */
    interface Listener {
        /** One-shot event sound f(int) / explore sounds. */
        fun onEventSound(event: Int)
        /** Gun fired: [volumeFactor] is 1.0 for the player, 0.7 for the AI. */
        fun onGun(volumeFactor: Float)
        /** lose1 sound: [volumeFactor] 1.0 or 0.7 (d(1)). */
        fun onLose1(volumeFactor: Float)
        /** lose2/lose1 with random stereo pan (e(int)); [sound] is SND_LOSE1 or SND_LOSE2. */
        fun onPannedLose(sound: Int)
        /** Screen switched (b(int)): [screen] SCREEN_MY or SCREEN_OPPONENT. */
        fun onScreenChanged(screen: Int)
        /** Board refresh requested (h()/a(boolean) after state change); [showYouShoot] adds f(10). */
        fun onRefreshMyScreen(playOpponentShoots: Boolean)
        fun onRefreshOpponentScreen(playYouShoot: Boolean)
        /** Game over reached (A()). */
        fun onGameOver(finalScore: Int)
    }

    private var listener: Listener? = null
    fun setListener(l: Listener?) {
        listener = l
    }

    // Original field names kept as comments for traceability.
    val myGrid = Array(SIZE) { IntArray(SIZE) }        // n
    val opponentGrid = Array(SIZE) { IntArray(SIZE) }  // o
    var cursorRow = 0                                   // u
    var cursorCol = 0                                   // v
    var score = 0                                       // w
        private set
    var screen = SCREEN_MY                              // q
        private set
    var shotLocked = false                              // r (gun fired, awaiting resolution)
    var resultLocked = false                            // s (result sound playing)
    var switchLocked = false                            // t (screen switch pending)
    var gameOver = false                                // A
    var aiTurn = false                                  // x
    private var aiContinues = false                     // y

    /** Original e(): builds both fleets. */
    fun newGame() {
        placeFleet(myGrid)
        placeFleet(opponentGrid)
        resetRound()
    }

    /** Original e() minus placement: resets the playing state between games. */
    fun resetRound() {
        screen = SCREEN_MY
        shotLocked = false
        resultLocked = false
        switchLocked = false
        gameOver = false
        aiTurn = false
        aiContinues = false
        score = 0
        cursorRow = 0
        cursorCol = 0
    }

    /** Original f()/g() fleet placement (shared for both grids). */
    fun placeFleet(grid: Array<IntArray>) {
        for (r in 0 until SIZE) for (c in 0 until SIZE) grid[r][c] = 0
        for (size in FLEET) placeOneShip(grid, size)
    }

    /** Original a(int[][], int): up to 100 random attempts; unchanged board on failure. */
    fun placeOneShip(grid: Array<IntArray>, size: Int): Boolean {
        for (attempt in 0 until 100) {
            val a = random.nextInt(10 - size)
            val b = random.nextInt(10 - size)
            if (random.nextInt(2) == 0) {
                if (canPlaceHorizontal(grid, a, b, size)) {
                    placeHorizontal(grid, a, b, size)
                    return true
                }
            } else if (canPlaceVertical(grid, a, b, size)) {
                placeVertical(grid, a, b, size)
                return true
            }
        }
        return false
    }

    /** Original a(int[][], int, int, int): horizontal fit with all 8 neighbours empty. */
    fun canPlaceHorizontal(grid: Array<IntArray>, row: Int, col: Int, size: Int): Boolean {
        val end = col + size
        var c = col
        while (c < SIZE && c < end) {
            if (grid[row][c] != 0) return false
            if (row > 0 && c > 0 && grid[row - 1][c - 1] != 0) return false
            if (c > 0 && grid[row][c - 1] != 0) return false
            if (row < 9 && c > 0 && grid[row + 1][c - 1] != 0) return false
            if (row > 0 && grid[row - 1][c] != 0) return false
            if (row > 0 && c < 9 && grid[row - 1][c + 1] != 0) return false
            if (c < 9 && grid[row][c + 1] != 0) return false
            if (row < 9 && grid[row + 1][c] != 0) return false
            if (row < 9 && c < 9 && grid[row + 1][c + 1] != 0) return false
            c++
        }
        return true
    }

    /** Original c(int[][], int, int, int): vertical fit with all 8 neighbours empty. */
    fun canPlaceVertical(grid: Array<IntArray>, row: Int, col: Int, size: Int): Boolean {
        val end = row + size
        var r = row
        while (r < SIZE && r < end) {
            if (grid[r][col] != 0) return false
            if (r > 0 && col > 0 && grid[r - 1][col - 1] != 0) return false
            if (col > 0 && grid[r][col - 1] != 0) return false
            if (r < 9 && col > 0 && grid[r + 1][col - 1] != 0) return false
            if (r > 0 && grid[r - 1][col] != 0) return false
            if (r > 0 && col < 9 && grid[r - 1][col + 1] != 0) return false
            if (col < 9 && grid[r][col + 1] != 0) return false
            if (r < 9 && grid[r + 1][col] != 0) return false
            if (r < 9 && col < 9 && grid[r + 1][col + 1] != 0) return false
            r++
        }
        return true
    }

    /** Original b(int[][], int, int, int). */
    private fun placeHorizontal(grid: Array<IntArray>, row: Int, col: Int, size: Int) {
        val end = col + size
        var c = col
        while (c < SIZE && c < end) {
            grid[row][c] = SHIP
            c++
        }
    }

    /** Original d(int[][], int, int, int). */
    private fun placeVertical(grid: Array<IntArray>, row: Int, col: Int, size: Int) {
        val end = row + size
        var r = row
        while (r < SIZE && r < end) {
            grid[r][col] = SHIP
            r++
        }
    }

    /** Original b(int): switch screen; returns refreshed UI instructions to the listener. */
    fun showScreen(which: Int) {
        screen = which
        cursorRow = 0
        cursorCol = 0
        listener?.onScreenChanged(which)
        when (which) {
            SCREEN_MY -> listener?.onRefreshMyScreen(playOpponentShoots = aiTurn)
            SCREEN_OPPONENT -> listener?.onRefreshOpponentScreen(playYouShoot = true)
        }
    }

    /**
     * Original a(int, int): explore tap on MY grid (screen==0): announces the cell content.
     */
    fun exploreMyCell(row: Int, col: Int) {
        when (myGrid[row][col]) {
            WATER_UNKNOWN -> listener?.onEventSound(EV_EMPTY)
            SHIP -> listener?.onEventSound(EV_SHIP)
            DESTROYED -> listener?.onEventSound(EV_KILLED)
            EMPTY_KNOWN -> listener?.onEventSound(EV_EMPTY)
        }
    }

    /** Original b(int, int): tap on OPPONENT grid (screen==1). */
    fun tapOpponentCell(row: Int, col: Int) {
        when (opponentGrid[row][col]) {
            DESTROYED -> listener?.onEventSound(EV_KILLED)
            EMPTY_KNOWN -> listener?.onEventSound(EV_EMPTY)
            else -> {
                cursorRow = row
                cursorCol = col
                fireGun(playerShot = true)
            }
        }
    }

    /** Original c(int): gun sound + lock; [playerShot]=true for the player, false for the AI. */
    private fun fireGun(playerShot: Boolean) {
        val volume = if (!playerShot) 0.7f else 1.0f
        listener?.onGun(volume)
        shotLocked = true
    }

    /**
     * Original q() + r() + s() + p(): resolves the player's shot at the stored cursor.
     * Must be called after the original 1000 ms delay; the caller keeps the timing.
     */
    fun resolvePlayerShot() {
        shotLocked = false
        if (opponentGrid[cursorRow][cursorCol] == SHIP) {
            opponentGrid[cursorRow][cursorCol] = DESTROYED
            score += 20
            checkOpponentShipSunk()
            refreshOpponentScreen(playYouShoot = true)
        } else {
            opponentGrid[cursorRow][cursorCol] = EMPTY_KNOWN
            refreshOpponentScreen(playYouShoot = false)
        }
        afterPlayerShot()
    }

    /** Original p(): post-shot result sound. */
    private fun afterPlayerShot() {
        if (opponentGrid[cursorRow][cursorCol] == DESTROYED) {
            // d(1): quiet lose1, resultLocked then unlocked by the Activity.
            listener?.onLose1(0.7f)
            resultLocked = true
        } else {
            // e(1): panned lose2; afterwards the Activity switches to my screen (AI turn).
            listener?.onPannedLose(SND_LOSE2)
            switchLocked = true
        }
    }

    /** Original r(): sink detection + s() surroundings + score + game end. */
    private fun checkOpponentShipSunk() {
        if (hasLiveShipAround(opponentGrid, cursorRow, cursorCol)) return
        markSunkShipArea(opponentGrid, cursorRow, cursorCol)
        score += 100
        listener?.onEventSound(EV_DESTROY)
        if (opponentGrid.any { row -> row.any { it == SHIP } }) return
        announceGameOver()
    }

    /** Original w(): sink detection on MY grid. */
    private fun checkMyShipSunk() {
        if (hasLiveShipAround(myGrid, cursorRow, cursorCol)) return
        markSunkShipArea(myGrid, cursorRow, cursorCol)
        score -= 50
        listener?.onEventSound(EV_DESTROY)
        if (myGrid.any { row -> row.any { it == SHIP } }) return
        score = 0
        announceGameOver()
    }

    /**
     * Original r()/w() four-direction scan: a live ship cell (1) before a boundary (0/4)
     * means the ship is not fully destroyed yet.
     */
    private fun hasLiveShipAround(grid: Array<IntArray>, row: Int, col: Int): Boolean {
        for (r in row until SIZE) {
            if (grid[r][col] == SHIP) return true
            if (grid[r][col] == WATER_UNKNOWN || grid[r][col] == EMPTY_KNOWN) break
        }
        for (r in row downTo 0) {
            if (grid[r][col] == SHIP) return true
            if (grid[r][col] == WATER_UNKNOWN || grid[r][col] == EMPTY_KNOWN) break
        }
        for (c in col until SIZE) {
            if (grid[row][c] == SHIP) return true
            if (grid[row][c] == WATER_UNKNOWN || grid[row][c] == EMPTY_KNOWN) break
        }
        for (c in col downTo 0) {
            if (grid[row][c] == SHIP) return true
            if (grid[row][c] == WATER_UNKNOWN || grid[row][c] == EMPTY_KNOWN) break
        }
        return false
    }

    /** Original s()/x(): mark the sunk ship and its surroundings as known empty. */
    private fun markSunkShipArea(grid: Array<IntArray>, row: Int, col: Int) {
        markAround(grid, row, col)
        for (r in row until SIZE) {
            if (grid[r][col] == WATER_UNKNOWN || grid[r][col] == EMPTY_KNOWN) break
            markAround(grid, r, col)
        }
        for (r in row downTo 0) {
            if (grid[r][col] == WATER_UNKNOWN || grid[r][col] == EMPTY_KNOWN) break
            markAround(grid, r, col)
        }
        for (c in col until SIZE) {
            if (grid[row][c] == WATER_UNKNOWN || grid[row][c] == EMPTY_KNOWN) break
            markAround(grid, row, c)
        }
        for (c in col downTo 0) {
            if (grid[row][c] == WATER_UNKNOWN || grid[row][c] == EMPTY_KNOWN) break
            markAround(grid, row, c)
        }
    }

    /** Original c(int, int)/d(int, int): set the 8 neighbours of (row,col) to 4 if they are 0. */
    private fun markAround(grid: Array<IntArray>, row: Int, col: Int) {
        if (col > 0 && grid[row][col - 1] == 0) grid[row][col - 1] = EMPTY_KNOWN
        if (row > 0 && col > 0 && grid[row - 1][col - 1] == 0) grid[row - 1][col - 1] = EMPTY_KNOWN
        if (row > 0 && grid[row - 1][col] == 0) grid[row - 1][col] = EMPTY_KNOWN
        if (row > 0 && col < 9 && grid[row - 1][col + 1] == 0) grid[row - 1][col + 1] = EMPTY_KNOWN
        if (col < 9 && grid[row][col + 1] == 0) grid[row][col + 1] = EMPTY_KNOWN
        if (row < 9 && col < 9 && grid[row + 1][col + 1] == 0) grid[row + 1][col + 1] = EMPTY_KNOWN
        if (row < 9 && grid[row + 1][col] == 0) grid[row + 1][col] = EMPTY_KNOWN
        if (row < 9 && col > 0 && grid[row + 1][col - 1] == 0) grid[row + 1][col - 1] = EMPTY_KNOWN
    }

    /** Original A(): stop sounds, floor score, publish it and finish the game. */
    private fun announceGameOver() {
        if (score < 0) score = 0
        GlobalState.lastScore = score
        gameOver = true
        listener?.onGameOver(score)
    }

    /**
     * Menu "Stop game" (original handlers c/e case 3: `w = 0; A();`):
     * zero the score, then run the exact game-over path.
     */
    fun finishByStop() {
        score = 0
        announceGameOver()
    }

    // ------------------------------------------------------------------ AI

    /**
     * Original u(): the opponent AI target selection. Call only when [aiTurn] is true
     * (the Activity sets it through [beginAiTurn]).
     */
    fun aiPickTargetAndFire() {
        if (!aiTurn) return
        if (aiContinues && myGrid[cursorRow][cursorCol] == DESTROYED) {
            aiContinues = false
            if (cursorRow > 0 && myGrid[cursorRow - 1][cursorCol] == SHIP) {
                cursorRow--
                fireGun(playerShot = false)
                return
            }
            if (cursorRow < 9 && myGrid[cursorRow + 1][cursorCol] == SHIP) {
                cursorRow++
                fireGun(playerShot = false)
                return
            }
            if (cursorCol > 0 && myGrid[cursorRow][cursorCol - 1] == SHIP) {
                cursorCol--
                fireGun(playerShot = false)
                return
            }
            if (cursorCol < 9 && myGrid[cursorRow][cursorCol + 1] == SHIP) {
                cursorCol++
                fireGun(playerShot = false)
                return
            }
        } else {
            aiContinues = true
        }
        for (i in 0 until 100) {
            cursorRow = random.nextInt(10)
            cursorCol = random.nextInt(10)
            val st = myGrid[cursorRow][cursorCol]
            if (st == WATER_UNKNOWN || st == SHIP) {
                fireGun(playerShot = false)
                return
            }
        }
        // Original fallback (bug kept): scans i2/i3 but re-checks myGrid[u][v] == SHIP.
        for (r in 0 until SIZE) {
            for (c in 0 until SIZE) {
                if (myGrid[r][c] == WATER_UNKNOWN || myGrid[cursorRow][cursorCol] == SHIP) {
                    cursorRow = r
                    cursorCol = c
                    fireGun(playerShot = false)
                    return
                }
            }
        }
    }

    /** Activity-side entry for message i (2001): x=true, then u(). */
    fun beginAiTurn() {
        aiTurn = true
        aiPickTargetAndFire()
    }

    /**
     * Test hook mirroring the post-hit path: a previous pick already happened
     * (aiContinues/y == true), the cursor sits on a freshly destroyed cell.
     */
    internal fun aiPickTargetAfterHitForTest(row: Int, col: Int) {
        aiTurn = true
        aiContinues = true
        cursorRow = row
        cursorCol = col
        aiPickTargetAndFire()
    }

    /**
     * Original v(): resolves the AI shot at the cursor on MY grid.
     * Returns true when the AI hit a ship (and therefore shoots again).
     */
    fun resolveOpponentShot(): Boolean {
        aiTurn = false
        return if (myGrid[cursorRow][cursorCol] != SHIP) {
            myGrid[cursorRow][cursorCol] = EMPTY_KNOWN
            refreshMyScreen(playOpponentShoots = false)
            // e(0): panned lose1, then the Activity shows the opponent screen (player turn).
            listener?.onPannedLose(SND_LOSE1)
            switchLocked = true
            false
        } else {
            myGrid[cursorRow][cursorCol] = DESTROYED
            score -= 10
            checkMyShipSunk()
            refreshMyScreen(playOpponentShoots = false)
            // d(0): full-volume lose1; the AI keeps the turn.
            listener?.onLose1(1.0f)
            resultLocked = true
            true
        }
    }

    private fun refreshMyScreen(playOpponentShoots: Boolean) {
        listener?.onRefreshMyScreen(playOpponentShoots)
    }

    private fun refreshOpponentScreen(playYouShoot: Boolean) {
        listener?.onRefreshOpponentScreen(playYouShoot)
    }

    /** Test hook: expose the private score mutation for scenario construction. */
    internal fun setScoreInternal(value: Int) {
        score = value
    }

    // ----------------------------------------------------- accessibility data

    /**
     * Original a(int): content description updates for one grid.
     * [which] 1 = my grid (n) with "ship"/"destroyed"/"empty" suffixes,
     *         2 = opponent grid (o) with "destroyed"/"empty" suffixes only.
     */
    fun buildCellDescriptions(which: Int): Array<Array<String>> {
        val grid = if (which == 1) myGrid else opponentGrid
        val labels = cellLabels()
        val out = Array(SIZE) { Array(SIZE) { "" } }
        for (r in 0 until SIZE) {
            for (c in 0 until SIZE) {
                out[r][c] = when (which) {
                    1 -> when (grid[r][c]) {
                        SHIP -> labels[r][c] + " ship"
                        DESTROYED -> labels[r][c] + " destroyed"
                        EMPTY_KNOWN -> labels[r][c] + " empty"
                        else -> labels[r][c]
                    }
                    else -> when (grid[r][c]) {
                        DESTROYED -> labels[r][c] + " destroyed"
                        EMPTY_KNOWN -> labels[r][c] + " empty"
                        else -> labels[r][c]
                    }
                }
            }
        }
        return out
    }

    /** Original d(): labels "a 1".."j 10". */
    fun cellLabels(): Array<Array<String>> {
        val out = Array(SIZE) { Array(SIZE) { "" } }
        var letter = 'a'
        for (r in 0 until SIZE) {
            for (c in 0 until SIZE) {
                out[r][c] = "$letter ${c + 1}"
            }
            letter++
        }
        return out
    }
}

/**
 * Faithful port of p.java: cross-activity global state.
 */
object GlobalState {
    /** p.a: 1 == quit requested. */
    @Volatile var quitRequested: Int = 0
    /** p.b: last finished game score. */
    @Volatile var lastScore: Int = 0
    /** p.c: final-score speech in progress. */
    @Volatile var speaking: Boolean = false
    /** p.d: activities must finish immediately. */
    @Volatile var exitFlag: Boolean = false
    /** p.f: application data directory (set by MainActivity). */
    @Volatile var dataDir: String = ""
    /** p.g: menu phase marker used by the registration flow. */
    @Volatile var menuPhase: Int = 0
    /** p.h: splash tick counter enabled. */
    @Volatile var splashTicking: Boolean = false
}
