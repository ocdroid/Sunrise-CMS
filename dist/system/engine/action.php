<?php

/* 	Sunrise CMS - Open source CMS for widespread use.
	Copyright (C) 2019 Mykola Burakov (burakov.work@gmail.com)

	See SOURCE.txt for other and additional information.

	This file is part of Sunrise CMS.

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. */

class Action
{
    private $id;
    private $route;
    private $method = 'index';

    public function __construct($route)
    {
        $this->id = $route;
        
        $parts = explode('/', preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route));

        // Break apart the route
        while ($parts) {
            $file = DIR_APPLICATION . 'controller/' . implode('/', $parts) . '.php';

            if (is_file($file)) {
                $this->route = implode('/', $parts);
                
                break;
            } else {
                $this->method = array_pop($parts);
            }
        }
    }
    
    public function getId()
    {
        return $this->id;
    }
    
    public function execute($registry, array $args = array())
    {
        // Stop any magical methods being called
        if (substr($this->method, 0, 2) == '__') {
            return new \Exception('Error: Calls to magic methods are not allowed!');
        }

        $file = DIR_APPLICATION . 'controller/' . $this->route . '.php';
        $class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $this->route);
        
        // Initialize the class
        if (is_file($file)) {
            include_once($file);
        
            $controller = new $class($registry);
        } else {
            return new \Exception('Error: Could not call ' . $this->route . '/' . $this->method . '!');
        }
        
        $reflection = new ReflectionClass($class);
        
        if ($reflection->hasMethod($this->method) && $reflection->getMethod($this->method)->getNumberOfRequiredParameters() <= count($args)) {
            // debuger
            if (defined("IS_DEBUG") && IS_DEBUG) {
                global $debugControllerActions;

                $time = microtime(true);

                $call_func = call_user_func_array(array($controller, $this->method), $args);

                $debugControllerActions[] = [
                    'class' => get_class($controller),
                    'method' => $this->method,
                    'time' => microtime(true) - $time,
                ];

                return $call_func;
            } else {
                // default
                return call_user_func_array(array($controller, $this->method), $args);
                //
            }
            //
        } else {
            return new \Exception('Error: Could not call ' . $this->route . '/' . $this->method . '!');
        }
    }
}
