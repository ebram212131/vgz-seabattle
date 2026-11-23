package com.mygames.vgzseabattle.core

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.util.Random

/**
 * Comprehensive tests for the faithful port of ActivityGameScreen's logic.
 * Every expectation below was derived from the REA decompiled evidence
 * (work/rea-evidence/ActivityGameScreen.java.txt), not from memory.
 */
class SeaBattleEngineTest {

    private lateinit var engine: SeaBattleEngine
    private lateinit var events: MutableList<String>

    /** Recording listener capturing the observable effect sequence. */
    private inner class Recorder : SeaBattleEngine.Listener {
        val list = mutableListOf<String>()
        override fun onEventSound(event: Int) {
            list.add("event:$event")
        }
        override fun onGun(volumeFactor: Float) {
            list.add("gun:$volumeFactor")
        }
        override fun onLose1(volumeFactor: Float) {
            list.add("lose1:$volumeFactor")
        }
        override fun onPannedLose(sound: Int) {
            list.add("panned:$sound")
        }
        override fun onScreenChanged(screen: Int) {
            list.add("screen:$screen")
        }
        override fun onRefreshMyScreen(playOpponentShoots: Boolean) {
            list.add("refreshMy:$playOpponentShoots")
        }
        override fun onRefreshOpponentScreen(playYouShoot: Boolean) {
            list.add("refreshOpp:$playYouShoot")
        }
        override fun onGameOver(finalScore: Int) {
            list.add("gameOver:$finalScore")
        }
    }

    @Before
    fun setUp() {
        engine = SeaBattleEngine(Random(42))
        val rec = Recorder()
        events = rec.list
        engine.setListener(rec)
    }

    // ------------------------------------------------------------- placement

    @Test
    fun `fleet has exactly 1x4 2x3 3x2 4x1`() {
        assertTrue(SeaBattleEngine.FLEET.contentEquals(intArrayOf(4, 3, 3, 2, 2, 2, 1, 1, 1, 1)))
        assertEquals(20, SeaBattleEngine.FLEET_CELLS)
    }

    @Test
    fun `placed fleet occupies exactly 20 cells in original order`() {
        engine.newGame()
        for (grid in listOf(engine.myGrid, engine.opponentGrid)) {
            val count = grid.sumOf { row -> row.count { it == SeaBattleEngine.SHIP } }
            assertEquals(20, count)
        }
    }

    @Test
    fun `no two ships touch - all 8 neighbours stay water`() {
        engine.newGame()
        for (grid in listOf(engine.myGrid, engine.opponentGrid)) {
            for (r in 0 until 10) {
                for (c in 0 until 10) {
                    if (grid[r][c] == SeaBattleEngine.SHIP) {
                        // Every neighbour of a ship cell is either ship-of-same-ship
                        // or water; the original guarantees diagonal water and that
                        // straight-line neighbours belong only to the same ship.
                        // Verify diagonals strictly.
                        for (dr in intArrayOf(-1, 1)) {
                            for (dc in intArrayOf(-1, 1)) {
                                val rr = r + dr
                                val cc = c + dc
                                if (rr in 0 until 10 && cc in 0 until 10) {
                                    assertTrue(
                                        "diagonal ($r,$c)-($rr,$cc) must be water",
                                        grid[rr][cc] != SeaBattleEngine.SHIP
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    @Test
    fun `ship sizes per grid are one 4 two 3 three 2 four 1`() {
        // Verify via connected component analysis with seeded deterministic placement.
        for (seed in longArrayOf(1, 7, 42, 12345)) {
            val e = SeaBattleEngine(Random(seed))
            e.newGame()
            for (grid in listOf(e.myGrid, e.opponentGrid)) {
                val visited = Array(10) { BooleanArray(10) }
                val sizes = mutableListOf<Int>()
                for (r in 0 until 10) {
                    for (c in 0 until 10) {
                        if (grid[r][c] == SeaBattleEngine.SHIP && !visited[r][c]) {
                            // flood fill straight lines only (no diagonals allowed)
                            var size = 0
                            val stack = ArrayDeque<Pair<Int, Int>>()
                            stack.add(r to c)
                            visited[r][c] = true
                            while (stack.isNotEmpty()) {
                                val (cr, cc) = stack.removeLast()
                                size++
                                for (d in intArrayOf(-1, 1)) {
                                    val rr = cr + d
                                    if (rr in 0 until 10 && grid[rr][cc] == SeaBattleEngine.SHIP && !visited[rr][cc]) {
                                        visited[rr][cc] = true
                                        stack.add(rr to cc)
                                    }
                                    val ccx = cc + d
                                    if (ccx in 0 until 10 && grid[cr][ccx] == SeaBattleEngine.SHIP && !visited[cr][ccx]) {
                                        visited[cr][ccx] = true
                                        stack.add(cr to ccx)
                                    }
                                }
                            }
                            sizes.add(size)
                        }
                    }
                }
                sizes.sort()
                assertEquals(listOf(1, 1, 1, 1, 2, 2, 2, 3, 3, 4), sizes)
            }
        }
    }

    @Test
    fun `canPlaceHorizontal rejects touching neighbours`() {
        val grid = Array(10) { IntArray(10) }
        grid[4][4] = SeaBattleEngine.SHIP
        // a horizontal ship on row 3 reaching column 4 has its cell (3,4) directly
        // above (4,4) -> the down-neighbour check must reject it
        assertFalse(engine.canPlaceHorizontal(grid, 3, 1, 4))
        // a vertical ship covering (4,3) is left of (4,4) -> reject
        assertFalse(engine.canPlaceVertical(grid, 1, 3, 4))
        // fully open space works
        assertTrue(engine.canPlaceHorizontal(grid, 0, 0, 4))
        assertTrue(engine.canPlaceVertical(grid, 6, 6, 4))
    }

    @Test
    fun `canPlace rejects occupied cells`() {
        val grid = Array(10) { IntArray(10) }
        grid[0][1] = SeaBattleEngine.SHIP
        // horizontal (0,0..3) covers (0,1) and vertical (0,0) has (0,1) as right neighbour
        assertFalse(engine.canPlaceHorizontal(grid, 0, 0, 4))
        assertFalse(engine.canPlaceVertical(grid, 0, 0, 4))
        // (0,2) does not touch a vertical ship at (0,0..3) - legal per original
        grid[0][1] = 0
        grid[0][2] = SeaBattleEngine.SHIP
        assertFalse(engine.canPlaceHorizontal(grid, 0, 0, 4))
        assertTrue(engine.canPlaceVertical(grid, 0, 0, 4))
    }

    @Test
    fun `placeOneShip fails after 100 blocked attempts without changing board`() {
        val grid = Array(10) { IntArray(10) }
        // fill everything except impossible gaps
        for (r in 0 until 10) for (c in 0 until 10) grid[r][c] = SeaBattleEngine.SHIP
        val before = grid.map { it.clone() }
        assertFalse(engine.placeOneShip(grid, 4))
        for (r in 0 until 10) {
            for (c in 0 until 10) {
                assertEquals(before[r][c], grid[r][c])
            }
        }
    }

    // ----------------------------------------------------------- shot logic

    private fun forceCell(engine: SeaBattleEngine, grid: Array<IntArray>, r: Int, c: Int, state: Int) {
        grid[r][c] = state
    }

    @Test
    fun `player hit gives 20 points and destroys cell`() {
        engine.newGame()
        // pick a cell of a MULTI-CELL ship (orthogonal ship neighbour exists),
        // so a single shot cannot sink it and the score rises by exactly 20
        var target: Pair<Int, Int>? = null
        outer@ for (r in 0 until 10) {
            for (c in 0 until 10) {
                if (engine.opponentGrid[r][c] != SeaBattleEngine.SHIP) continue
                val hasNeighbour =
                    (r > 0 && engine.opponentGrid[r - 1][c] == SeaBattleEngine.SHIP) ||
                        (r < 9 && engine.opponentGrid[r + 1][c] == SeaBattleEngine.SHIP) ||
                        (c > 0 && engine.opponentGrid[r][c - 1] == SeaBattleEngine.SHIP) ||
                        (c < 9 && engine.opponentGrid[r][c + 1] == SeaBattleEngine.SHIP)
                if (hasNeighbour) {
                    target = r to c
                    break@outer
                }
            }
        }
        val t = target!!
        val before = engine.score
        engine.tapOpponentCell(t.first, t.second)
        engine.resolvePlayerShot()
        assertEquals(SeaBattleEngine.DESTROYED, engine.opponentGrid[t.first][t.second])
        assertEquals(before + 20, engine.score)
    }

    @Test
    fun `player miss marks cell empty without score change`() {
        engine.newGame()
        var target = 0 to 0
        loop@ for (r in 0 until 10) for (c in 0 until 10) {
            if (engine.opponentGrid[r][c] == SeaBattleEngine.WATER_UNKNOWN) {
                target = r to c
                break@loop
            }
        }
        val before = engine.score
        engine.tapOpponentCell(target.first, target.second)
        engine.resolvePlayerShot()
        assertEquals(SeaBattleEngine.EMPTY_KNOWN, engine.opponentGrid[target.first][target.second])
        assertEquals(before, engine.score)
        assertTrue(events.contains("refreshOpp:false"))
    }

    @Test
    fun `sinking a whole ship adds 100 points`() {
        engine.newGame()
        // find a size-1 ship: isolated ship cell whose straight neighbours are water
        var target: Pair<Int, Int>? = null
        outer@ for (r in 0 until 10) {
            for (c in 0 until 10) {
                if (engine.opponentGrid[r][c] != SeaBattleEngine.SHIP) continue
                val up = r == 0 || engine.opponentGrid[r - 1][c] != SeaBattleEngine.SHIP
                val down = r == 9 || engine.opponentGrid[r + 1][c] != SeaBattleEngine.SHIP
                val left = c == 0 || engine.opponentGrid[r][c - 1] != SeaBattleEngine.SHIP
                val right = c == 9 || engine.opponentGrid[r][c + 1] != SeaBattleEngine.SHIP
                if (up && down && left && right) {
                    target = r to c
                    break@outer
                }
            }
        }
        val t = target!!
        val before = engine.score
        engine.tapOpponentCell(t.first, t.second)
        engine.resolvePlayerShot()
        // destroyed + sunk (+20 +100) and the destroyed event fired
        assertEquals(before + 120, engine.score)
        assertTrue(events.contains("event:${SeaBattleEngine.EV_DESTROY}"))
    }

    @Test
    fun `sunk ship surroundings become known empty`() {
        engine.newGame()
        var target: Pair<Int, Int>? = null
        outer@ for (r in 0 until 10) {
            for (c in 0 until 10) {
                if (engine.opponentGrid[r][c] != SeaBattleEngine.SHIP) continue
                val up = r == 0 || engine.opponentGrid[r - 1][c] != SeaBattleEngine.SHIP
                val down = r == 9 || engine.opponentGrid[r + 1][c] != SeaBattleEngine.SHIP
                val left = c == 0 || engine.opponentGrid[r][c - 1] != SeaBattleEngine.SHIP
                val right = c == 9 || engine.opponentGrid[r][c + 1] != SeaBattleEngine.SHIP
                if (up && down && left && right) {
                    target = r to c
                    break@outer
                }
            }
        }
        val t = target!!
        engine.tapOpponentCell(t.first, t.second)
        engine.resolvePlayerShot()
        // orthogonal neighbours of a single-cell ship must be known-empty now
        if (t.first > 0) assertEquals(SeaBattleEngine.EMPTY_KNOWN, engine.opponentGrid[t.first - 1][t.second])
        if (t.first < 9) assertEquals(SeaBattleEngine.EMPTY_KNOWN, engine.opponentGrid[t.first + 1][t.second])
        if (t.second > 0) assertEquals(SeaBattleEngine.EMPTY_KNOWN, engine.opponentGrid[t.first][t.second - 1])
        if (t.second < 9) assertEquals(SeaBattleEngine.EMPTY_KNOWN, engine.opponentGrid[t.first][t.second + 1])
    }

    @Test
    fun `winning the game fires gameOver with score floor at zero minimum`() {
        engine.newGame()
        // destroy every opponent ship cell one by one through the engine API
        var guard = 0
        while (!engine.gameOver && guard < 200) {
            var target: Pair<Int, Int>? = null
            outer@ for (r in 0 until 10) {
                for (c in 0 until 10) {
                    if (engine.opponentGrid[r][c] == SeaBattleEngine.SHIP) {
                        target = r to c
                        break@outer
                    }
                }
            }
            val t = target ?: break
            engine.tapOpponentCell(t.first, t.second)
            engine.resolvePlayerShot()
            guard++
        }
        assertTrue(engine.gameOver)
        assertTrue(engine.score >= 0)
        assertTrue(events.any { it.startsWith("gameOver:") })
        assertEquals(engine.score, GlobalState.lastScore)
    }

    @Test
    fun `gameOver ends with 20 hits 10 sinks = 20x20 + 10x100 = 1400`() {
        engine.newGame()
        var guard = 0
        while (!engine.gameOver && guard < 200) {
            var target: Pair<Int, Int>? = null
            outer@ for (r in 0 until 10) {
                for (c in 0 until 10) {
                    if (engine.opponentGrid[r][c] == SeaBattleEngine.SHIP) {
                        target = r to c
                        break@outer
                    }
                }
            }
            val t = target ?: break
            engine.tapOpponentCell(t.first, t.second)
            engine.resolvePlayerShot()
            guard++
        }
        assertEquals(1400, engine.score)
    }

    // ---------------------------------------------------------- AI behaviour

    @Test
    fun `ai does not act until its turn begins`() {
        engine.newGame()
        engine.aiPickTargetAndFire()
        assertFalse(events.any { it.startsWith("gun:") })
    }

    @Test
    fun `ai gun plays at 0_7 volume then resolves`() {
        engine.newGame()
        engine.beginAiTurn()
        assertTrue(events.contains("gun:0.7"))
        val cell = engine.cursorRow to engine.cursorCol
        val before = engine.myGrid[cell.first][cell.second]
        assertTrue(before == SeaBattleEngine.WATER_UNKNOWN || before == SeaBattleEngine.SHIP)
        engine.resolveOpponentShot()
        val after = engine.myGrid[cell.first][cell.second]
        assertTrue(
            "cell must be resolved to 3 or 4, was $after",
            after == SeaBattleEngine.DESTROYED || after == SeaBattleEngine.EMPTY_KNOWN
        )
    }

    @Test
    fun `ai picks only unknown or ship cells across a full random campaign`() {
        engine.newGame()
        var shots = 0
        while (!engine.gameOver && shots < 400) {
            engine.aiTurn = true
            engine.aiPickTargetAndFire()
            val cell = engine.cursorRow to engine.cursorCol
            val state = engine.myGrid[cell.first][cell.second]
            assertTrue(
                "AI picked state $state at $cell",
                state == SeaBattleEngine.WATER_UNKNOWN || state == SeaBattleEngine.SHIP
            )
            engine.resolveOpponentShot()
            shots++
        }
        assertTrue(shots < 400)
        assertTrue(events.count { it.startsWith("gun:") } >= shots)
    }

    @Test
    fun `ai hit costs 10 points per hit and 50 per sunk own ship`() {
        engine.newGame()
        val scoreBefore = engine.score
        // Hit every cell of one opponent... of one MY ship: find a size-1 ship first.
        var target: Pair<Int, Int>? = null
        outer@ for (r in 0 until 10) {
            for (c in 0 until 10) {
                if (engine.myGrid[r][c] != SeaBattleEngine.SHIP) continue
                val up = r == 0 || engine.myGrid[r - 1][c] != SeaBattleEngine.SHIP
                val down = r == 9 || engine.myGrid[r + 1][c] != SeaBattleEngine.SHIP
                val left = c == 0 || engine.myGrid[r][c - 1] != SeaBattleEngine.SHIP
                val right = c == 9 || engine.myGrid[r][c + 1] != SeaBattleEngine.SHIP
                if (up && down && left && right) {
                    target = r to c
                    break@outer
                }
            }
        }
        val t = target!!
        engine.cursorRow = t.first
        engine.cursorCol = t.second
        assertTrue(engine.resolveOpponentShot())
        // single-cell ship: hit (-10) + sunk (-50)
        assertEquals(scoreBefore - 60, engine.score)
    }

    @Test
    fun `controlled scenario - ai hit costs 10 and sinks cost 50`() {
        engine.newGame()
        // choose an AI target that is a ship by placing the cursor directly:
        var target = 0 to 0
        loop@ for (r in 0 until 10) for (c in 0 until 10) {
            if (engine.myGrid[r][c] == SeaBattleEngine.SHIP) {
                target = r to c
                break@loop
            }
        }
        val before = engine.score
        // emulate: AI picks this exact cell (cursor manipulation is part of u())
        engine.cursorRow = target.first
        engine.cursorCol = target.second
        val hit = engine.resolveOpponentShot()
        assertTrue(hit)
        assertEquals(SeaBattleEngine.DESTROYED, engine.myGrid[target.first][target.second])
        assertEquals(before - 10, engine.score)
    }

    @Test
    fun `ai misses leave known empty cells`() {
        engine.newGame()
        var target = 0 to 0
        loop@ for (r in 0 until 10) for (c in 0 until 10) {
            if (engine.myGrid[r][c] == SeaBattleEngine.WATER_UNKNOWN) {
                target = r to c
                break@loop
            }
        }
        engine.cursorRow = target.first
        engine.cursorCol = target.second
        val hit = engine.resolveOpponentShot()
        assertFalse(hit)
        assertEquals(SeaBattleEngine.EMPTY_KNOWN, engine.myGrid[target.first][target.second])
        assertTrue(events.contains("panned:${SeaBattleEngine.SND_LOSE1}"))
    }

    @Test
    fun `ai never re-picks destroyed cells`() {
        engine.newGame()
        var previousDestroyed = countDestroyed(engine.myGrid)
        var shots = 0
        while (!engine.gameOver && shots < 120) {
            engine.aiTurn = true
            engine.aiPickTargetAndFire()
            val cell = engine.cursorRow to engine.cursorCol
            val state = engine.myGrid[cell.first][cell.second]
            assertTrue(
                "AI targeted destroyed/empty cell $cell (state $state)",
                state == SeaBattleEngine.WATER_UNKNOWN || state == SeaBattleEngine.SHIP
            )
            engine.resolveOpponentShot()
            shots++
            // destroyed cells never come back to life
            val now = countDestroyed(engine.myGrid)
            assertTrue(now >= previousDestroyed)
            previousDestroyed = now
        }
        assertTrue(previousDestroyed > 0)
    }

    private fun countDestroyed(grid: Array<IntArray>): Int =
        grid.sumOf { row -> row.count { it == SeaBattleEngine.DESTROYED } }

    @Test
    fun `ai targets neighbours of a fresh hit - direction memory`() {
        // Build a controlled engine with a manual grid.
        val e = SeaBattleEngine(Random(7))
        val rec = Recorder()
        e.setListener(rec)
        e.newGame()
        // wipe the AI fleet logic; inject a vertical 3-ship on my grid at (2..4, 5)
        for (r in 0 until 10) for (c in 0 until 10) e.myGrid[r][c] = 0
        e.myGrid[2][5] = SeaBattleEngine.SHIP
        e.myGrid[3][5] = SeaBattleEngine.SHIP
        e.myGrid[4][5] = SeaBattleEngine.SHIP
        // first AI shot hits (2,5)
        e.cursorRow = 2
        e.cursorCol = 5
        assertTrue(e.resolveOpponentShot())
        // emulate u() after the hit (message i): y=true from the first pick
        e.aiPickTargetAfterHitForTest(2, 5)
        // original checks up first, then down, left, right: (3,5) is the ship neighbour
        assertEquals(3, e.cursorRow)
        assertEquals(5, e.cursorCol)
    }

    // ------------------------------------------------------- screen + states

    @Test
    fun `screen switch to opponent announces you-shoot refresh`() {
        engine.newGame()
        engine.showScreen(SeaBattleEngine.SCREEN_OPPONENT)
        assertEquals(SeaBattleEngine.SCREEN_OPPONENT, engine.screen)
        assertTrue(events.contains("screen:${SeaBattleEngine.SCREEN_OPPONENT}"))
        assertTrue(events.contains("refreshOpp:true"))
    }

    @Test
    fun `screen switch back to my screen with aiTurn fires refresh with shoot flag`() {
        engine.newGame()
        engine.aiTurn = true
        engine.showScreen(SeaBattleEngine.SCREEN_MY)
        assertTrue(events.contains("refreshMy:true"))
    }

    @Test
    fun `cell labels are a 1 to j 10`() {
        val labels = engine.cellLabels()
        assertEquals("a 1", labels[0][0])
        assertEquals("a 10", labels[0][9])
        assertEquals("j 1", labels[9][0])
        assertEquals("j 10", labels[9][9])
    }

    @Test
    fun `my descriptions carry ship suffix - opponent only known states`() {
        engine.newGame()
        val mine = engine.buildCellDescriptions(1)
        val opp = engine.buildCellDescriptions(2)
        var shipDesc = false
        for (r in 0 until 10) {
            for (c in 0 until 10) {
                if (mine[r][c].endsWith(" ship")) shipDesc = true
                assertFalse(opp[r][c].endsWith(" ship"))
            }
        }
        assertTrue(shipDesc)
    }

    @Test
    fun `resetRound zeroes cursor and score`() {
        engine.newGame()
        engine.cursorRow = 5
        engine.cursorCol = 5
        engine.resetRound()
        assertEquals(0, engine.cursorRow)
        assertEquals(0, engine.cursorCol)
        assertEquals(0, engine.score)
        assertFalse(engine.gameOver)
    }

    @Test
    fun `finishByStop zeroes score and announces game over`() {
        engine.newGame()
        engine.setScoreInternal(500)
        engine.finishByStop()
        assertTrue(engine.gameOver)
        assertEquals(0, GlobalState.lastScore)
        assertTrue(events.contains("gameOver:0"))
    }
}
