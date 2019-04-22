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

// Check if SSL
if ((isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) || $_SERVER['SERVER_PORT'] == 443) {
    $_SERVER['HTTPS'] = true;
} elseif (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' || !empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on') {
    $_SERVER['HTTPS'] = true;
} else {
    $_SERVER['HTTPS'] = false;
}

// Engine
require('system/engine/action.php');
require('system/engine/controller.php');
require('system/engine/event.php');
require('system/engine/front.php');
require('system/engine/loader.php');
require('system/engine/model.php');
require('system/engine/registry.php');
require('system/engine/proxy.php');

// Helpers
require('system/helper/general.php');
require('system/helper/utf8.php');
require('system/helper/json.php');

// Libraries (autoload, including subfolders)
function library($class)
{
    $file = 'system/library/' . str_replace('\\', '/', strtolower($class)) . '.php';

    include_once($file);
}

spl_autoload_register('library');
spl_autoload_extensions('.php');

// Mobile Detect (global)
require('system/library/Mobile_Detect.php');
$detect = new Mobile_Detect();
define('isMobile', $detect->isMobile(), false);
define('isTablet', $detect->isTablet(), false);

// User-defined function: start('...') in index.php
function start($application_config)
{
    require('system/framework.php');
}
