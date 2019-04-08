<?php
// Version
define('VERSION', '1.0.0');

// Configuration
require('config/db.php');
require('config/debug.php');
require('config/defines.php');
require('config/domain.php');

// Startup
require(SR_SYSTEM . 'startup.php');

start('admin');
