<?php
// Version
define('VERSION', '1.0.0');

// Configuration
require('config/db.php');
require('config/debug.php');
require('config/defines.php');
require('config/domain.php');

// Startup
require('system/startup.php');

start('app_lair');
