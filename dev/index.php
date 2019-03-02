<?php
// Version
define('VERSION', '0.1a');

// Configuration
require_once('config.php');

// Startup
require_once(DIR_SYSTEM . 'startup.php');

start('catalog');

// Debug
require_once('debug.php');
