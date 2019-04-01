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

class ModelExtensionFeedGoogleBase extends Model
{
    public function install()
    {
        $this->db->query("
			CREATE TABLE `google_base_category` (
				`google_base_category_id` INT(11) NOT NULL AUTO_INCREMENT,
				`name` varchar(255) NOT NULL,
				PRIMARY KEY (`google_base_category_id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
		");

        $this->db->query("
			CREATE TABLE `google_base_category_to_category` (
				`google_base_category_id` INT(11) NOT NULL,
				`category_id` INT(11) NOT NULL,
				PRIMARY KEY (`google_base_category_id`, `category_id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
		");
    }

    public function uninstall()
    {
        $this->db->query("DROP TABLE IF EXISTS `google_base_category`");
        $this->db->query("DROP TABLE IF EXISTS `google_base_category_to_category`");
    }

    public function import($string)
    {
        $this->db->query("DELETE FROM google_base_category");

        $lines = explode("\n", $string);

        foreach ($lines as $line) {
            if (substr($line, 0, 1) != '#') {
                $part = explode(' - ', $line, 2);

                if (isset($part[1])) {
                    $this->db->query("INSERT INTO google_base_category SET google_base_category_id = '" . (int)$part[0] . "', name = '" . $this->db->escape($part[1]) . "'");
                }
            }
        }
    }

    public function getGoogleBaseCategories($data = array())
    {
        $sql = "SELECT * FROM `google_base_category` WHERE name LIKE '%" . $this->db->escape($data['filter_name']) . "%' ORDER BY name ASC";

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function addCategory($data)
    {
        $this->db->query("DELETE FROM google_base_category_to_category WHERE category_id = '" . (int)$data['category_id'] . "'");

        $this->db->query("INSERT INTO google_base_category_to_category SET google_base_category_id = '" . (int)$data['google_base_category_id'] . "', category_id = '" . (int)$data['category_id'] . "'");
    }

    public function deleteCategory($category_id)
    {
        $this->db->query("DELETE FROM google_base_category_to_category WHERE category_id = '" . (int)$category_id . "'");
    }

    public function getCategories($data = array())
    {
        $sql = "SELECT google_base_category_id, (SELECT name FROM `google_base_category` gbc WHERE gbc.google_base_category_id = gbc2c.google_base_category_id) AS google_base_category, category_id, (SELECT name FROM `category_description` cd WHERE cd.category_id = gbc2c.category_id AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS category FROM `google_base_category_to_category` gbc2c ORDER BY google_base_category ASC";

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getTotalCategories()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `google_base_category_to_category`");

        return $query->row['total'];
    }
}
