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

class DB
{
    private $adaptor;

    public function __construct($adaptor, $hostname, $username, $password, $database, $port = null)
    {
        $class = 'DB\\' . $adaptor;

        if (class_exists($class)) {
            $this->adaptor = new $class($hostname, $username, $password, $database, $port);
        } else {
            throw new \Exception('Error: Could not load database adaptor ' . $adaptor . '!');
        }
    }

    public function query($sql, $params = array())
    {
        return $this->adaptor->query($sql, $params);
    }

    public function escape($value)
    {
        return $this->adaptor->escape($value);
    }

    public function countAffected()
    {
        return $this->adaptor->countAffected();
    }

    public function getLastId()
    {
        return $this->adaptor->getLastId();
    }
    
    public function connected()
    {
        return $this->adaptor->connected();
    }
}
