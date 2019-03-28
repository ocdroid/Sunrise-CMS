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

class Proxy
{
    public function __get($key)
    {
        return $this->{$key};
    }
    
    public function __set($key, $value)
    {
        $this->{$key} = $value;
    }
    
    public function __call($key, $args)
    {
        $arg_data = array();
        
        $args = func_get_args();
        
        foreach ($args as $arg) {
            if ($arg instanceof Ref) {
                $arg_data[] =& $arg->getRef();
            } else {
                $arg_data[] =& $arg;
            }
        }
        
        if (isset($this->{$key})) {
            return call_user_func_array($this->{$key}, $arg_data);
        } else {
            $trace = debug_backtrace();
            
            exit('<b>Notice</b>:  Undefined property: Proxy::' . $key . ' in <b>' . $trace[1]['file'] . '</b> on line <b>' . $trace[1]['line'] . '</b>');
        }
    }
}
