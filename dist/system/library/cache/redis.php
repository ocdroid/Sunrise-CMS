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

namespace Cache;

class Redis
{
    private $expire;
    private $cache;

    public function __construct($expire)
    {
        $this->expire = $expire;

        $this->cache = new \Redis();
        $this->cache->pconnect('localhost', '6379');
    }

    public function get($key)
    {
        $data = $this->cache->get('snrs_' . $key);
        return json_decode($data, true);
    }

    public function set($key, $value)
    {
        $status = $this->cache->set('snrs_' . $key, json_encode($value));
        if ($status) {
            $this->cache->setTimeout('snrs_' . $key, $this->expire);
        }
        return $status;
    }

    public function delete($key)
    {
        $this->cache->delete('snrs_' . $key);
    }
}
