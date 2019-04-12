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

// Registry
$registry = new Registry();

// Config
$config = new Config();
$config->load('default');
$config->load($application_config);
$registry->set('config', $config);

// Event
$event = new Event($registry);
$registry->set('event', $event);

// Event Register
if ($config->has('action_event')) {
    foreach ($config->get('action_event') as $key => $value) {
        $event->register($key, new Action($value));
    }
}

// Loader
$loader = new Loader($registry);
$registry->set('load', $loader);

// Request
$registry->set('request', new Request());

// Response
$response = new Response();
$response->addHeader('Content-Type: text/html; charset=utf-8');
$registry->set('response', $response);

// Database
if ($config->get('db_autostart')) {
    $registry->set('db', new DB(
        $config->get('db_type'),
        $config->get('db_hostname'),
        $config->get('db_username'),
        $config->get('db_password'),
        $config->get('db_database'),
        $config->get('db_port')
    ));
}

// Session
$session = new Session();
if ($config->get('session_autostart')) {
    $session->start();
}
$registry->set('session', $session);

// Cache
$registry->set('cache', new Cache(
    $config->get('cache_type'),
    $config->get('cache_expire')
));

// Url
if ($config->get('url_autostart')) {
    $registry->set('url', new Url(
        $config->get('site_base'),
        $config->get('site_ssl')
    ));
}

// Language
$language = new Language(
    $config->get('language_default')
);
$language->load(
    $config->get('language_default')
);
$registry->set('language', $language);

// Document
$registry->set('document', new Document());

// Config Autoload
if ($config->has('config_autoload')) {
    foreach ($config->get('config_autoload') as $value) {
        $loader->config($value);
    }
}

// Language Autoload
if ($config->has('language_autoload')) {
    foreach ($config->get('language_autoload') as $value) {
        $loader->language($value);
    }
}

// Library Autoload
if ($config->has('library_autoload')) {
    foreach ($config->get('library_autoload') as $value) {
        $loader->library($value);
    }
}

// Model Autoload
if ($config->has('model_autoload')) {
    foreach ($config->get('model_autoload') as $value) {
        $loader->model($value);
    }
}

// Front Controller
$controller = new Front($registry);

// Pre Actions
if ($config->has('action_pre_action')) {
    foreach ($config->get('action_pre_action') as $value) {
        $controller->addPreAction(new Action($value));
    }
}

// Dispatch
$controller->dispatch(
    new Action($config->get('action_router')),
    new Action($config->get('action_error'))
);

// Output
$response->output();
