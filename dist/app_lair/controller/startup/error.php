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

class ControllerStartupError extends Controller
{
    public function index()
    {
        $this->registry->set('log', new Log($this->config->get('config_error_filename')));
        
        set_error_handler(array($this, 'handler'));
    }
    
    public function handler($code, $message, $file, $line)
    {
        // error suppressed with @
        if (error_reporting() === 0) {
            return false;
        }
    
        switch ($code) {
            case E_NOTICE:
            case E_USER_NOTICE:
                $error = 'Notice';
                break;
            case E_WARNING:
            case E_USER_WARNING:
                $error = 'Warning';
                break;
            case E_ERROR:
            case E_USER_ERROR:
                $error = 'Fatal Error';
                break;
            default:
                $error = 'Unknown';
                break;
        }
    
        if ($this->config->get('config_error_display')) {
            echo '<b>' . $error . '</b>: ' . $message . ' in <b>' . $file . '</b> on line <b>' . $line . '</b>';
        }
    
        if ($this->config->get('config_error_log')) {
            $this->log->write('PHP ' . $error . ':  ' . $message . ' in ' . $file . ' on line ' . $line);
        }
    
        return true;
    }
}
