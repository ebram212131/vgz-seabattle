package com.mygames.vgzseabattle.core

/**
 * Faithful port of RegisterApp.a(String) login validation.
 * Evidence: work/rea-evidence/RegisterApp.java.txt.
 *
 * Original rule: 1..10 characters of [0-9A-Za-z]. The original dialog texts are kept
 * exactly (including their wording, which mentions 10 characters although the real
 * limit is 1..10).
 */
object LoginValidator {

    const val MSG_EMPTY_TITLE = "Login error!"
    const val MSG_EMPTY_BODY = "Please fill in Login text field"
    const val MSG_LENGTH_TITLE = "Wrong Login length!"
    const val MSG_LENGTH_BODY = "Your Login must have at least 10 characters"
    const val MSG_CHAR_TITLE = "Wrong character!"
    const val MSG_CHAR_BODY = "Your Login must have at least 10 characters and limited to A - Z, 0 - 9"

    sealed class Result {
        object Valid : Result()
        data class Invalid(val title: String, val body: String) : Result()
    }

    fun validate(login: String): Result {
        if (login.isEmpty()) {
            return Result.Invalid(MSG_EMPTY_TITLE, MSG_EMPTY_BODY)
        }
        if (login.length > 10) {
            return Result.Invalid(MSG_LENGTH_TITLE, MSG_LENGTH_BODY)
        }
        for (ch in login) {
            val ok = (ch in '0'..'9') || (ch in 'A'..'Z') || (ch in 'a'..'z')
            if (!ok) {
                return Result.Invalid(MSG_CHAR_TITLE, MSG_CHAR_BODY)
            }
        }
        return Result.Valid
    }
}
