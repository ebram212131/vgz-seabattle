<?php
/** VGZ Sea Battle - unregistered.php (splash redirect for new users). */
require_once __DIR__ . '/lib.php';
sb_respond(sb_handle_unregistered($_POST));
