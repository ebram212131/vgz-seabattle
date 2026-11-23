<?php
/**
 * VGZ Sea Battle server configuration.
 *
 * Deploy: copy this whole folder to a PHP 7.4+ host (Apache or Nginx+FPM).
 * The game client tries https first and falls back to http, so enable TLS
 * (Let's Encrypt is free) and enter e.g. "your-domain.com/sea_battle/server"
 * in the game Settings screen - with or without the scheme.
 *
 * CHANGE admin_token before going public! It protects admin.php.
 */

return [
    // SQLite database file (created automatically, WAL mode).
    'db_path' => __DIR__ . '/data/seabattle.sqlite3',

    // Server side log (protocol + errors), also visible for debugging.
    'log_file' => __DIR__ . '/data/server.log',

    // Token for admin.php actions (list users, set password, delete user).
    // Use a long random string. NEVER keep the default in production.
    'admin_token' => 'CHANGE-ME-to-a-long-random-string',

    // The five activities the client may be redirected to.
    // Index 0 is the registration redirect (register.php flow),
    // 1..4 are the menu buttons (get_next_page.php flow), matching the
    // decompiled k.java decode indices.
    'actions' => [
        'com.mygames.vgzseabattle.ActivityMenu',
        'com.mygames.vgzseabattle.ActivityGameScreen',
        'com.mygames.vgzseabattle.ActivityLearnSounds',
        'com.mygames.vgzseabattle.ActivityLearnScreen',
        'com.mygames.vgzseabattle.ActivityViewTop',
    ],

    // Where users without a saved registration are sent (unregistered.php).
    // The response is the raw action plus a "***" marker (decompiled q.java).
    'unregistered_action' => 'com.mygames.vgzseabattle.RegisterApp',

    // Maximum login length accepted by the server (the game client asks for
    // 1..10 chars of A-Z a-z 0-9, exactly like the decompiled RegisterApp).
    'max_login_length' => 10,
];
