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

class Document
{
    private $title;
    private $robots;
    private $description;
    private $links = array();
    private $stylespreload = array();
    private $styles = array();
    private $scriptsdefer = array();
    private $scriptsasync = array();
    private $scripts = array();

    public function setTitle($title)
    {
        $this->title = $title;
    }

    public function getTitle()
    {
        return $this->title;
    }
    
    public function setRobots($robots)
    {
        $this->robots = $robots;
    }
    
    public function getRobots()
    {
        return $this->robots;
    }

    public function setDescription($description)
    {
        $this->description = $description;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function addLink($href, $rel)
    {
        $this->links[$href] = array(
            'href' => $href,
            'rel'  => $rel
        );
    }

    public function getLinks()
    {
        return $this->links;
    }

    public function addStylePreload($href, $rel = 'preload')
    {
        $this->stylespreload[$href] = array(
            'href'  => $href,
            'rel'   => $rel,
        );
    }

    public function addStyle($href, $rel = 'stylesheet')
    {
        $this->styles[$href] = array(
            'href'  => $href,
            'rel'   => $rel
        );
    }

    public function getStylespreload()
    {
        return $this->stylespreload;
    }

    public function getStyles()
    {
        return $this->styles;
    }

    public function addScriptAsync($href, $postion = 'header')
    {
        $this->scriptsasync[$postion][$href] = $href;
    }

    public function addScriptDefer($href, $postion = 'header')
    {
        $this->scriptsdefer[$postion][$href] = $href;
    }

    public function addScript($href, $postion = 'header')
    {
        $this->scripts[$postion][$href] = $href;
    }

    public function getScriptsAsync($postion = 'header')
    {
        if (isset($this->scriptsasync[$postion])) {
            return $this->scriptsasync[$postion];
        } else {
            return array();
        }
    }

    public function getScriptsDefer($postion = 'header')
    {
        if (isset($this->scriptsdefer[$postion])) {
            return $this->scriptsdefer[$postion];
        } else {
            return array();
        }
    }

    public function getScripts($postion = 'header')
    {
        if (isset($this->scripts[$postion])) {
            return $this->scripts[$postion];
        } else {
            return array();
        }
    }
}
