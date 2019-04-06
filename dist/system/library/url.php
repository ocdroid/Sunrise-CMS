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

class Url
{
    private $url;
    private $ssl;
    private $rewrite = array();

    public function __construct($url, $ssl = '')
    {
        $this->url = $url;
        $this->ssl = $ssl;
    }
    
    public function addRewrite($rewrite)
    {
        $this->rewrite[] = $rewrite;
    }

    public function link($route, $args = '', $secure = false)
    {
        if ($this->ssl && $secure) {
            $url = $this->ssl . 'index.php?route=' . $route;
        } else {
            $url = $this->url . 'index.php?route=' . $route;
        }
        
        if ($args) {
            if (is_array($args)) {
                $url .= '&amp;' . http_build_query($args);
            } else {
                // $url .= str_replace('&', '&amp;', '&' . ltrim($args, '&'));
                $url .= str_replace('&', '&', '&' . ltrim($args, '&'));
            }
        }
        
        foreach ($this->rewrite as $rewrite) {
            $url = $rewrite->rewrite($url);
        }
        
        return $url;
    }
}
