<?php


// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

// Site
$_['site_base']        = HTTP_SERVER;
$_['site_ssl']         = HTTPS_SERVER;

// Url
$_['url_autostart']    = false;

// Database
$_['db_autostart']     = true;
$_['db_type']          = DB_DRIVER; // /library/db/mysqli.php
$_['db_hostname']      = DB_HOSTNAME;
$_['db_username']      = DB_USERNAME;
$_['db_password']      = DB_PASSWORD;
$_['db_database']      = DB_DATABASE;
$_['db_port']          = DB_PORT;

// Session
$_['session_autostart'] = false;

// Autoload Libraries
$_['library_autoload'] = array(
    // ...
);

// Actions
$_['action_pre_action'] = array(
    'startup/session',
    'startup/startup',
    'startup/error',
    'startup/event',
    'startup/maintenance',
    'startup/seo_pro'
);

// Action Events
$_['action_event'] = array(
    'view/*/before'                         => 'event/theme',
    
    'model/extension/credit_card/*/before'  => 'event/compatibility/beforeModel',
    'model/extension/feed/*/before'         => 'event/compatibility/beforeModel',
    'model/extension/module/*/before'       => 'event/compatibility/beforeModel',
    'model/extension/payment/*/before'      => 'event/compatibility/beforeModel',
    'model/extension/shipping/*/before'     => 'event/compatibility/beforeModel',
    'model/extension/theme/*/before'        => 'event/compatibility/beforeModel',
    'model/extension/total/*/before'        => 'event/compatibility/beforeModel',
        
    'model/credit_card/*/after'             => 'event/compatibility/afterModel',
    'model/feed/*/after'                    => 'event/compatibility/afterModel',
    'model/module/*/after'                  => 'event/compatibility/afterModel',
    'model/payment/*/after'                 => 'event/compatibility/afterModel',
    'model/shipping/*/after'                => 'event/compatibility/afterModel',
    'model/theme/*/after'                   => 'event/compatibility/afterModel',
    'model/total/*/after'                   => 'event/compatibility/afterModel',
    
    'language/extension/feed/*/before'      => 'event/compatibility/language',
    'language/extension/module/*/before'    => 'event/compatibility/language',
    'language/extension/payment/*/before'   => 'event/compatibility/language',
    'language/extension/shipping/*/before'  => 'event/compatibility/language',
    'language/extension/theme/*/before'     => 'event/compatibility/language',
    'language/extension/total/*/before'     => 'event/compatibility/language'

);
