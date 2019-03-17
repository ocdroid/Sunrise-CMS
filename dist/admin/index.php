<?php
// Version
define('VERSION', '1.0.0');

// Configuration
require('config/db.php');
require('config/defines.php');
require('config/domain.php');

// Startup
require(DIR_SYSTEM . 'startup.php');

start('admin');
