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

class ControllerEventCompatibility extends Controller
{
    public function controller(&$route)
    {
        $route = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route);
        
        // Compatibility code for old extension folders
        $part = explode('/', $route);
                
        if (!is_file(SR_APPLICATION . 'controller/' . $route . '.php') && is_file(SR_APPLICATION . 'controller/' . $part[1] . '/' . $part[2] . '.php')) {
            $route = $part[1] . '/' . $part[2];
        }
    }
    
    public function language(&$route)
    {
        $route = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route);
        
        // Compatibility code for old extension folders
        $part = explode('/', $route);
        
        if (!is_file(SR_LANGUAGE . $this->config->get('config_language') . '/' . $route . '.php') && is_file(SR_LANGUAGE . $this->config->get('config_language') . '/' . $part[1] . '/' . $part[2] . '.php')) {
            $route = $part[1] . '/' . $part[2];
        }
    }
    
    public function view(&$route, &$data)
    {
        $part = explode('/', $route);
            
        if (isset($part[0]) && isset($data['back'])) {
            $data['back'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=' . $part[0], true);
        }
    }
}
