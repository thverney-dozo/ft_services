<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '!^|ClT1kq8E~5EP@aw`!%Bhy?PJ=wOQ[th,uMH_O):BNMf`B}J9>/26y])FRA?Vd' );
define( 'SECURE_AUTH_KEY',  '8z7?B#ZQ# .rEZx2 P!zPQ2G/S,YdsCIQIHHnu$:q<j5UWvaAwnk^}z5!^U!+~T@' );
define( 'LOGGED_IN_KEY',    'F0$/jHN%M9~7olHz.fBuAV#J^GoQNntt=Y-0)rXU]&@[bS-N=1Y72eIVdI&h>hU,' );
define( 'NONCE_KEY',        'WO{(6@0+Uey.?B~Ap{`ax<%U/l-k%%RGwe?Nm}oT?6;y,E3)74,d6[4sGQemYKm[' );
define( 'AUTH_SALT',        '^EUQ2!TvwIaR=c3%s,vq2b0Fd.Oa<y1T^_y[4hopdy/[ti*K;E1:8r;DM!nNMSpc' );
define( 'SECURE_AUTH_SALT', '&m#Z|Yp9G;-|B*@&<Wr}XzPMqTBKevzDB%-9kM53dbK+<fzxBMGCRBm 6dQD(+[t' );
define( 'LOGGED_IN_SALT',   'I*bT}s%^Zx<0s5Rq>?-ZKZ+80M{t]}4m+, IWi9]}dwm3bI6axwk,%/d8;S:*LCi' );
define( 'NONCE_SALT',       'W(0VM58TZ}7${< D~9PAHqgxMQBW8SVi9Gd4CobQ)9C}4UF*^P`qlCsJ`c$[.x%&' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );