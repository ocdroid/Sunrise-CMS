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

class ControllerExtensionModuleHTML extends Controller
{
    public function index($setting)
    {
        static $module_id = 0;

        if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
            $data['heading_title'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8');
            $data['html'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');

            $data['module_id'] = $module_id++;

            return $this->load->view('extension/module/html', $data);
        }
    }
}
