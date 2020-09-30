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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'ft_server_db' );

/** MySQL database username */
define( 'DB_USER', 'fermelin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'fermelin_passw42' );

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

define('AUTH_KEY',         'wo}>sgXK+s;;O36)TTVNobkln|nP;,$[#`q=,Pv[<++l/6<;`rI7O#,LqH8tLhCr');
define('SECURE_AUTH_KEY',  'ZLsyt@7;g!1gYhC9;0fU|Qm{Us|A`,>]Y)GOlO8EK<cu/D=?G~V5_(tr]quE7`U/');
define('LOGGED_IN_KEY',    ']]gYCQQlP22ITP7lgyzb7PD0KBVU=izR[=08X45Tezyz%(T#:0G!l[q(hrr/bc!T');
define('NONCE_KEY',        ']vjk|57E-mk7)JrW%UJ-3nwfSq`$rU%,^.y$7#6&yO+I[5K8i)EfRg0,kf],$ gy');
define('AUTH_SALT',        'ie0y~P?`>_/`V?f_KoHf9+#B(g$1/X<e48(J(tfs(&2+<J~=AF#i4|1fZEf?;2Hz');
define('SECURE_AUTH_SALT', '9mMp(bwdtXN|e26Up8zRiY;G;|?d2:ya2nKLp#nl*v{K+_8F 986l2!Pw9!S4lEK');
define('LOGGED_IN_SALT',   'AZhwwlp_`UO5ms.?[(gmtH]6;3Xs>iHUn$OB^47tV1!9b+naL/$IzFD4eJIVV#-h');
define('NONCE_SALT',       'LZ56LA^H<#U&e^ W41-g* L[TQRDUC~${?z_*sPo|!MVJVA,=jq/7(D^l88lla[k');

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
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
