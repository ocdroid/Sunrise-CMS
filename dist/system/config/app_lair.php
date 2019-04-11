<?php

/* 	Sunrise CMS - Open source CMS for widespread use.
    Copyright (c) 2019 Mykola Burakov (burakov.work@gmail.com)

    See SOURCE.txt for other and additional information.

    This file is part of Sunrise CMS.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program. If not, see <http://www.gnu.org/licenses/>. */

// Site
$_['site_base']        = '/app_lair/';
$_['site_ssl']         = '/app_lair/';

// Database
$_['db_autostart']     = true;
$_['db_type']          = DB_DRIVER; // /library/db/mysqli.php
$_['db_hostname']      = DB_HOSTNAME;
$_['db_username']      = DB_USERNAME;
$_['db_password']      = DB_PASSWORD;
$_['db_database']      = DB_DATABASE;
$_['db_port']          = DB_PORT;

// Cache
$_['cache_type']       = SR_ADMIN_CACHE_TYPE;
$_['cache_expire']     = SR_ADMIN_CACHE_EXPIRE;

// Session
$_['session_autostart'] = true;

// Actions
$_['action_default'] = 'common/dashboard';

// Actions
$_['action_pre_action'] = array(
    'startup/startup',
    'startup/error',
    'startup/event',
    'startup/login',
    'startup/permission'
);

// Action Events
$_['action_event'] = array(
    'view/*/before'                           => 'event/theme',
    'controller/extension/feed/*/before'      => 'event/compatibility/controller',
    'controller/extension/module/*/before'    => 'event/compatibility/controller',
    'controller/extension/payment/*/before'   => 'event/compatibility/controller',
    'controller/extension/shipping/*/before'  => 'event/compatibility/controller',
    'controller/extension/theme/*/before'     => 'event/compatibility/controller',
    'controller/extension/total/*/before'     => 'event/compatibility/controller',
    'view/feed/*/before'                      => 'event/compatibility/view',
    'view/module/*/before'                    => 'event/compatibility/view',
    'view/payment/*/before'                   => 'event/compatibility/view',
    'view/shipping/*/before'                  => 'event/compatibility/view',
    'view/theme/*/before'                     => 'event/compatibility/view',
    'view/total/*/before'                     => 'event/compatibility/view',
    'language/extension/feed/*/before'        => 'event/compatibility/language',
    'language/extension/module/*/before'      => 'event/compatibility/language',
    'language/extension/payment/*/before'     => 'event/compatibility/language',
    'language/extension/shipping/*/before'    => 'event/compatibility/language',
    'language/extension/theme/*/before'       => 'event/compatibility/language',
    'language/extension/total/*/before'       => 'event/compatibility/language'
);
