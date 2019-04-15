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

final class Front
{
    private $registry;
    private $pre_action = array();
    private $error;

    public function __construct($registry)
    {
        $this->registry = $registry;
    }
    
    public function addPreAction(Action $pre_action)
    {
        $this->pre_action[] = $pre_action;
    }
    
    public function dispatch(Action $action, Action $error)
    {
        $this->error = $error;

        foreach ($this->pre_action as $pre_action) {
            $result = $this->execute($pre_action);

            if ($result instanceof Action) {
                $action = $result;

                break;
            }
        }

        while ($action instanceof Action) {
            $action = $this->execute($action);
        }
    }

    private function execute(Action $action)
    {
        $result = $action->execute($this->registry);

        if ($result instanceof Action) {
            return $result;
        }
        
        if ($result instanceof Exception) {
            $action = $this->error;
            
            $this->error = null;
            
            return $action;
        }
    }
}
