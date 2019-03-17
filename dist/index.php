<?php
// Version
define('VERSION', '1.0.0');

// Configuration
require('catalog/config/db.php');
require('catalog/config/debug.php');
require('catalog/config/defines.php');
require('catalog/config/domain.php');

// Startup
require(DIR_SYSTEM . 'startup.php');

start('catalog');
