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

class ControllerStartupCompatibility extends Controller
{
    public function index()
    {
        if (isset($this->request->get['route'])) {
            $extension = array(
                'extension/feed',
                'extension/module',
                'extension/payment',
                'extension/shipping',
                'extension/theme',
                'extension/total'
            );
        
            $part = explode('/', $this->request->get['route']);
            
            if (isset($part[0]) && isset($part[1]) && in_array($part[0] . '/' . $part[1], $extension)) {
                $route = '';
                
                if (isset($part[2])) {
                    $route = '/' . $part[2];
                }
                
                $this->response->redirect('extension/extension' . $route, 'token=' . $this->session->data['token'], true);
            }
        }
    }
}
