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

class Language
{
    private $default = 'en-gb';
    private $directory;
    private $data = array();

    public function __construct($directory = '')
    {
        $this->directory = $directory;
    }

    public function get($key)
    {
        return (isset($this->data[$key]) ? $this->data[$key] : $key);
    }
    
    public function set($key, $value)
    {
        $this->data[$key] = $value;
    }
    
    // Please dont use the below function i'm thinking getting rid of it.
    public function all()
    {
        return $this->data;
    }
    
    // Please dont use the below function i'm thinking getting rid of it.
    public function merge(&$data)
    {
        array_merge($this->data, $data);
    }
            
    public function load($filename, &$data = array())
    {
        $_ = array();

        $file = SR_LANGUAGE . 'english/' . $filename . '.php';
        
        if (is_file($file)) {
            require($file);
        }

        $file = SR_LANGUAGE . $this->default . '/' . $filename . '.php';

        if (is_file($file)) {
            require($file);
        }

        $file = SR_LANGUAGE . $this->directory . '/' . $filename . '.php';

        if (is_file($file)) {
            require($file);
        }

        $this->data = array_merge($this->data, $_);

        return $this->data;
    }
}
