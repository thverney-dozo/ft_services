<?php
/**
 * List of env variables
 */
$vars = array(
    'DB_NAME',
	'DB_USER',
	'DB_PASSWORD',
	'DB_HOST'
);

/**
 * Stock env variables in tab
 */
foreach ($vars as $var) {
    $env = getenv($var);
    if (!isset($_ENV[$var]) && $env !== false) {
        $_ENV[$var] = $env;
    }
}

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

define('WP_HOME', 'http://AAAIPAAA:5050' );
define('WP_SITEURL', 'http://AAAIPAAA:5050' );

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'xTnP0@p&bj,rU(2`_>:TsJ|N7S2@X^rJ<zv#t9Gdi3q3,.<J!+|2hR7ul1[e@][+');
define('SECURE_AUTH_KEY',  '0tw71by|es&u05C)z%;>y|8A|;P[3Z7bMj=-+^d})2ji7w[Y1E3/yA@z@eK`o/EI');
define('LOGGED_IN_KEY',    'tbbYQ8X`Uz>z@UXH?S&]<qxv%[bV?j3AM=zjCfP(aow`(s |*qn`-h[)Cxk>cxSw');
define('NONCE_KEY',        '~|biU<[<hY}+A].(ETpIta4aOLK,*XikuO$.|5 <xepny#[+9AF K>v]pD,@6fMO');
define('AUTH_SALT',        'pbn!Y$X(I*ma$=] @^v;A[Blr/;=[g^X-/_}u?#dSbd%B4HD PGFw{V;W:9b]sE|');
define('SECURE_AUTH_SALT', 'a^< xY{ZFRiDpwpr16Jn+F[~%>O?+>81ypOSK?s,Sf|&?L-%:9O2Y!G`m8CA]U~l');
define('LOGGED_IN_SALT',   '^oFC&(>*naPi=F@toQd(I8b43D!~FjX=f^)G2<&(3LzfuDKQm9G#j+y&Beh=EDbi');
define('NONCE_SALT',       'FW#Ik IhkHA1B`468;n(#AOFs~laFid]Fm{I{}*Z~r;:L; v;T^XIn|cVgtyv`>j');

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
