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
define( 'DB_USER', 'wordpress' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

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
define('AUTH_KEY',         'e.P+H~t`z7 vkxJ3_kXzAr|(FJEvPPy2PJZ6A:.26-%>iJK[8[^P1T3s|>~x:=7|');
define('SECURE_AUTH_KEY',  '7Rze`[b6<t#_%D:H*JZUDvaW%3w>(2@fdjCH!|6BLB-a=!WF/n;Ed1Z`>B6}`Qo6');
define('LOGGED_IN_KEY',    '@rd^B%5Yi/yg&va:F< @0Tt%5LO8?[`2Nri,bPRj(z:* c,9xY{8xg]i)^>UL]Vj');
define('NONCE_KEY',        ')l:F&x>r/9FdGr]qo1RyV<ob%i3!@~`BC8~7_MoajA>vpUg3i+j4mntv6$Ilj8<x');
define('AUTH_SALT',        'c[! .}GdTGpbFBQYdoM.?-|^rx>)4ZWtGj_:,`UWASN+MyFYT[cc 0]r!$ZN65bg');
define('SECURE_AUTH_SALT', '-V`A+n3 Fgw4N!FJ0NB.onr_Tum]b*(Nq8T]ZpBu#^-Ahx07vg*p T~MFoeF=s!s');
define('LOGGED_IN_SALT',   '0kxLq@aBmwbvhA|RSblzxx-oT-RWDpJWVHB`#eWqi*h*Z_-jLRRD>89=2,dpISba');
define('NONCE_SALT',       'iK]-&+Z%N*<[ZuVq6rSO)oM:(w0`kkaS4H:a ohY!(A21${ye@iNJe#*Ccjiry0<');
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
