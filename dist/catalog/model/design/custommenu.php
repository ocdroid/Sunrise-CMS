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

class ModelDesignCustomMenu extends Model {

    public function getcustommenus() {
        $data = array();

        $store_id = $this->config->get('config_store_id', 0);

        $sql = "SELECT * FROM `" . DB_PREFIX . "custommenu` m LEFT JOIN " . DB_PREFIX . "custommenu_description md ON (m.custommenu_id = md.custommenu_id) LEFT JOIN " . DB_PREFIX . "custommenu_to_store ms ON (m.custommenu_id = ms.custommenu_id) WHERE ms.store_id = '" . $store_id . "' AND md.language_id = '" . (int)$this->config->get('config_language_id') . "' AND m.status = 1 ORDER BY m.sort_order";

        $query = $this->db->query($sql);

        if ($query->rows) {
            foreach ($query->rows as $custommenu) {
                $data[$custommenu['custommenu_id']] = $custommenu;
            }
        }

        return $data;
    }

    public function getChildcustommenus() {
        $data = array();

        $store_id = $this->config->get('config_store_id', 0);

        $sql = "SELECT * FROM `" . DB_PREFIX . "custommenu_child` mc LEFT JOIN " . DB_PREFIX . "custommenu_child_description mcd ON (mc.custommenu_child_id = mcd.custommenu_child_id) LEFT JOIN " . DB_PREFIX . "custommenu_child_to_store mcs ON (mc.custommenu_child_id = mcs.custommenu_child_id) WHERE mcs.store_id = '" . $store_id . "'AND mcd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND mc.status = 1 ORDER BY mc.sort_order";

        $query = $this->db->query($sql);

        if ($query->rows) {
            foreach ($query->rows as $custommenu_child) {
                $data[$custommenu_child['custommenu_child_id']] = $custommenu_child;
            }
        }

        return $data;
    }
	
}