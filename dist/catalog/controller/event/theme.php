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

class ControllerEventTheme extends Controller
{
    public function index(&$view, &$data, &$output)
    {
        if (!$this->config->get($this->config->get('config_theme') . '_status')) {
            exit('Error: A theme has not been assigned to this store!');
        }
        
        if ($this->config->get('config_theme') == 'theme_default') {
            $theme = $this->config->get('theme_default_directory');
        } else {
            $theme = $this->config->get('config_theme');
        }
        
        if (is_file(SR_TEMPLATE . $theme . '/template/' . $view . '.html')) {
            $view = $theme . '/template/' . $view;
        } else {
            $view = 'default/template/' . $view;
        }
    }
}
