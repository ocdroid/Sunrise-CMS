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

class ControllerStartupPermission extends Controller
{
    public function index()
    {
        if (isset($this->request->get['route'])) {
            $route = '';
            
            $part = explode('/', $this->request->get['route']);

            if (isset($part[0])) {
                $route .= $part[0];
            }

            if (isset($part[1])) {
                $route .= '/' . $part[1];
            }

            // If a 3rd part is found we need to check if its under one of the extension folders.
            $extension = array(
                'extension/dashboard',
                'extension/extension',
                'extension/feed',
                'extension/module',
                'extension/payment',
                'extension/shipping',
                'extension/theme',
                'extension/total'
            );

            if (isset($part[2]) && in_array($route, $extension)) {
                $route .= '/' . $part[2];
            }
            
            // We want to ingore some pages from having its permission checked.
            $ignore = array(
                'common/dashboard',
                'common/login',
                'common/logout',
                'common/forgotten',
                'common/reset',
                'error/not_found',
                'error/permission'
            );

            if (!in_array($route, $ignore) && !$this->user->hasPermission('access', $route)) {
                return new Action('error/permission');
            }
        }
    }
}
