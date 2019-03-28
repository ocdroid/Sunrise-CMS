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

namespace Template;

final class HTML
{
    private $data = array();
    
    public function set($key, $value)
    {
        $this->data[$key] = $value;
    }
    
    public function render($template)
    {
        $file = DIR_TEMPLATE . $template;

        if (is_file($file)) {
            extract($this->data);

            ob_start();

            require($file);

            return ob_get_clean();
        }

        trigger_error('Error: Could not load template ' . $file . '!');
        exit();
    }
}
