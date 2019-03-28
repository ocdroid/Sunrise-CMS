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

/*
* Event System Userguide
*
* https://github.com/opencart/opencart/wiki/Events-(script-notifications)-2.2.x.x
*/
class Event
{
    protected $registry;
    protected $data = array();

    public function __construct($registry)
    {
        $this->registry = $registry;
    }

    public function register($trigger, Action $action)
    {
        $this->data[$trigger][] = $action;
    }
    
    public function trigger($event, array $args = array())
    {
        foreach ($this->data as $trigger => $actions) {
            if (preg_match('/^' . str_replace(array('\*', '\?'), array('.*', '.'), preg_quote($trigger, '/')) . '/', $event)) {
                foreach ($actions as $action) {
                    $result = $action->execute($this->registry, $args);

                    if (!is_null($result) && !($result instanceof Exception)) {
                        return $result;
                    }
                }
            }
        }
    }

    public function unregister($trigger, $route = '')
    {
        if ($route) {
            foreach ($this->data[$trigger] as $key => $action) {
                if ($action->getId() == $route) {
                    unset($this->data[$trigger][$key]);
                }
            }
        } else {
            unset($this->data[$trigger]);
        }
    }

    public function removeAction($trigger, $route)
    {
        foreach ($this->data[$trigger] as $key => $action) {
            if ($action->getId() == $route) {
                unset($this->data[$trigger][$key]);
            }
        }
    }
}
