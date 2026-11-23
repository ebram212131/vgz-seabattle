package com.mygames.vgzseabattle.core

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * v2.2.2: the Settings online checkbox gates the Register screen
 * (owner report: "registration misbehaves depending on the online checkbox").
 */
class RegistrationGateTest {

    @Test
    fun `allows registration when online mode is on`() {
        assertTrue(RegistrationGate.allows(true))
    }

    @Test
    fun `blocks registration when online mode is off`() {
        assertFalse(RegistrationGate.allows(false))
    }

    @Test
    fun `offline guidance has non-empty title and body`() {
        assertTrue(RegistrationGate.OFFLINE_TITLE.isNotBlank())
        assertTrue(RegistrationGate.OFFLINE_BODY.length > 40)
        assertTrue(RegistrationGate.OFFLINE_BODY.contains("Settings"))
    }
}
