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

namespace Session;

class Native extends \SessionHandler
{
    public function create_sid()
    {
        return parent::create_sid();
    }

    public function open($path, $name)
    {
        return parent::open($path, $name);
    }

    public function close()
    {
        return parent::close();
    }
    
    public function read($session_id)
    {
        return parent::read($session_id);
    }

    public function write($session_id, $data)
    {
        return parent::write($session_id, $data);
    }

    public function destroy($session_id)
    {
        return parent::destroy($session_id);
    }

    public function gc($maxlifetime)
    {
        return parent::gc($maxlifetime);
    }
}
