<?php


// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

// Site
$_['site_base']         = HTTP_SERVER;
$_['site_ssl']          = HTTPS_SERVER;

// Database
$_['db_autostart']      = true;
$_['db_type']           = DB_DRIVER; // /library/db/mysqli.php
$_['db_hostname']       = DB_HOSTNAME;
$_['db_username']       = DB_USERNAME;
$_['db_password']       = DB_PASSWORD;
$_['db_database']       = DB_DATABASE;
$_['db_port']           = DB_PORT;

// Session
$_['session_autostart'] = true;

// Actions
$_['action_pre_action'] = array(
	'startup/startup',
	'startup/error',
	'startup/event',
	'startup/login',
	'startup/permission'
);

// Actions
$_['action_default'] = 'common/dashboard';

// Action Events
$_['action_event'] = array(
    'view/*/before'                           => 'event/theme',
	'controller/extension/captcha/*/before'   => 'event/compatibility/controller',
	'controller/extension/feed/*/before'      => 'event/compatibility/controller',
	'controller/extension/module/*/before'    => 'event/compatibility/controller',
	'controller/extension/payment/*/before'   => 'event/compatibility/controller',
	'controller/extension/shipping/*/before'  => 'event/compatibility/controller',
	'controller/extension/theme/*/before'     => 'event/compatibility/controller',
	'controller/extension/total/*/before'     => 'event/compatibility/controller',
	'view/captcha/*/before'                   => 'event/compatibility/view',
	'view/feed/*/before'                      => 'event/compatibility/view',
	'view/module/*/before'                    => 'event/compatibility/view',
	'view/payment/*/before'                   => 'event/compatibility/view',
	'view/shipping/*/before'                  => 'event/compatibility/view',
	'view/theme/*/before'                     => 'event/compatibility/view',
	'view/total/*/before'                     => 'event/compatibility/view',
	'language/extension/captcha/*/before'     => 'event/compatibility/language',
	'language/extension/feed/*/before'        => 'event/compatibility/language',
	'language/extension/module/*/before'      => 'event/compatibility/language',
	'language/extension/payment/*/before'     => 'event/compatibility/language',
	'language/extension/shipping/*/before'    => 'event/compatibility/language',
	'language/extension/theme/*/before'       => 'event/compatibility/language',
	'language/extension/total/*/before'       => 'event/compatibility/language'
);
