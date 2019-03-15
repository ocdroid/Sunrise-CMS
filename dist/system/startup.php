<?php
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

// Error Reporting
error_reporting(E_ALL);

// Check if SSL
if ((isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) || $_SERVER['SERVER_PORT'] == 443) {
    $_SERVER['HTTPS'] = true;
} elseif (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' || !empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on') {
    $_SERVER['HTTPS'] = true;
} else {
    $_SERVER['HTTPS'] = false;
}

// Engine
require(DIR_SYSTEM . 'engine/action.php');
require(DIR_SYSTEM . 'engine/controller.php');
require(DIR_SYSTEM . 'engine/event.php');
require(DIR_SYSTEM . 'engine/front.php');
require(DIR_SYSTEM . 'engine/loader.php');
require(DIR_SYSTEM . 'engine/model.php');
require(DIR_SYSTEM . 'engine/registry.php');
require(DIR_SYSTEM . 'engine/proxy.php');

// Helpers
require(DIR_SYSTEM . 'helper/general.php');
require(DIR_SYSTEM . 'helper/utf8.php');
require(DIR_SYSTEM . 'helper/json.php');

// Libraries
spl_autoload_register('library');
spl_autoload_extensions('.php');

function library($class)
{
    $file = DIR_SYSTEM . 'library/' . str_replace('\\', '/', strtolower($class)) . '.php';

    if (is_file($file)) {
        include_once(($file));

        return true;
    } else {
        return false;
    }
}

// Mobile Detect - http://mobiledetect.net/
require(DIR_SYSTEM . 'library/Mobile_Detect.php');
$detect = new Mobile_Detect();
define('isMobile', $detect->isMobile(), false);
define('isTablet', $detect->isTablet(), false);

// start
function start($application_config)
{
    require(DIR_SYSTEM . 'framework.php');
}
