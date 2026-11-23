<?php
/** VGZ Sea Battle - register.php (original protocol, SQLite3 + hashed passwords). */
require_once __DIR__ . '/lib.php';
sb_respond(sb_handle_register($_POST));
