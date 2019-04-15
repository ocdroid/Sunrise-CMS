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

class Session
{
    public $session_id = '';
    public $data = array();

    public function __construct($adaptor = 'native')
    {
        $class = 'Session\\' . $adaptor;
        
        if (class_exists($class)) {
            $this->adaptor = new $class($this);
        } else {
            throw new \Exception('Error: Could not load session adaptor ' . $adaptor . ' session!');
        }
        
        if ($this->adaptor) {
            session_set_save_handler($this->adaptor);
        }
            
        if ($this->adaptor && !session_id()) {
            ini_set('session.use_only_cookies', 'Off');
            ini_set('session.use_cookies', 'On');
            ini_set('session.use_trans_sid', 'Off');
            ini_set('session.cookie_httponly', 'On');
        
            if (isset($_COOKIE[session_name()]) && !preg_match('/^[a-zA-Z0-9,\-]{22,52}$/', $_COOKIE[session_name()])) {
                exit('Error: Invalid session ID!');
            }
            
            session_set_cookie_params(0, '/');
            session_start();
        }
    }
        
    public function start($key = 'default', $value = '')
    {
        if ($value) {
            $this->session_id = $value;
        } elseif (isset($_COOKIE[$key])) {
            $this->session_id = $_COOKIE[$key];
        } else {
            $this->session_id = $this->createId();
        }
        
        if (!isset($_SESSION[$this->session_id])) {
            $_SESSION[$this->session_id] = array();
        }
        
        $this->data = &$_SESSION[$this->session_id];
        
        if ($key != 'PHPSESSID') {
            setcookie($key, $this->session_id, ini_get('session.cookie_lifetime'), ini_get('session.cookie_path'), ini_get('session.cookie_domain'), ini_get('session.cookie_secure'), ini_get('session.cookie_httponly'));
        }
        
        return $this->session_id;
    }

    public function getId()
    {
        return $this->session_id;
    }
    
    public function createId()
    {
        if (version_compare(phpversion(), '7.2', '>') == true) {
            return $this->adaptor->create_sid();
        } elseif (function_exists('openssl_random_pseudo_bytes')) {
            return substr(bin2hex(openssl_random_pseudo_bytes(26)), 0, 26);
        }
    }
        
    public function destroy($key = 'default')
    {
        if (isset($_SESSION[$key])) {
            unset($_SESSION[$key]);
        }
        
        setcookie($key, '', time() - 42000, ini_get('session.cookie_path'), ini_get('session.cookie_domain'));
    }
}
