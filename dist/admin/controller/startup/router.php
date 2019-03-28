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

class ControllerStartupRouter extends Controller
{
    public function index()
    {
        // Route
        if (isset($this->request->get['route']) && $this->request->get['route'] != 'startup/router') {
            $route = $this->request->get['route'];
        } else {
            $route = $this->config->get('action_default');
        }
        
        $data = array();
        
        // Sanitize the call
        $route = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route);
        
        // Trigger the pre events
        $result = $this->event->trigger('controller/' . $route . '/before', array(&$route, &$data));
        
        if (!is_null($result)) {
            return $result;
        }
        
        $action = new Action($route);
        
        // Any output needs to be another Action object.
        $output = $action->execute($this->registry, $data);
        
        // Trigger the post events
        $result = $this->event->trigger('controller/' . $route . '/after', array(&$route, &$output));
        
        if (!is_null($result)) {
            return $result;
        }
        
        return $output;
    }
}
