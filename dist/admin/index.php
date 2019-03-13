<?php
// Version
define('VERSION', '0.1a');

// Configuration
require('config/db.php');
require('config/defines.php');
require('config/domain.php');

// Startup
require(DIR_SYSTEM . 'startup.php');

start('admin');
