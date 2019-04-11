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
    //
    /*
    The below code will old extensions compatible with the extension page move

    Compatiblity for:

    feed
    module
    payment
    shipping
    theme
    total
    */
    public function controller(&$route)
    {
        $route = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route);
        
        $part = explode('/', $route);
        
        if (!is_file(SR_APPLICATION . 'controller/' . $route . '.php') && is_file(SR_APPLICATION . 'controller/' . $part[1] . '/' . $part[2] . '.php')) {
            $route = $part[1] . '/' . $part[2];
        }
    }
    
    public function beforeModel(&$route)
    {
        $route = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route);
        
        $part = explode('/', $route);

        if (!is_file(SR_APPLICATION . 'model/' . $route . '.php') && is_file(SR_APPLICATION . 'model/' . $part[1] . '/' . $part[2] . '.php')) {
            $route = $part[1] . '/' . $part[2];
        }
    }
    
    public function afterModel(&$route)
    {
        $route = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route);
        
        $part = explode('/', $route);
                    
        $this->{'model_extension_' . $part[0] . '_' . $part[1]} = $this->{'model_' . $part[0] . '_' . $part[1]};
    }
        
    public function language(&$route)
    {
        $route = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route);
                
        $part = explode('/', $route);
                
        if (!is_file(SR_LANGUAGE . $this->config->get('config_language') . '/' . $route . '.php') && is_file(SR_LANGUAGE . $this->config->get('config_language') . '/' . $part[1] . '/' . $part[2] . '.php')) {
            $route = $part[1] . '/' . $part[2];
        }
    }
}
