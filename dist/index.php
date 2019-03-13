<?php
// Version
define('VERSION', '0.1a');

// Configuration
require('catalog/config/db.php');
require('catalog/config/debug.php');
require('catalog/config/directory.php');
require('catalog/config/domain.php');

// Startup
require(DIR_SYSTEM . 'startup.php');

start('catalog');
