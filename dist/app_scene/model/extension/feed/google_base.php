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
    public function getCategories()
    {
        $query = $this->db->query("
			SELECT google_base_category_id, 
				(
					SELECT name 
					FROM `google_base_category` gbc 
					WHERE gbc.google_base_category_id = gbc2c.google_base_category_id) AS google_base_category, 
				category_id, 
				(
					SELECT name 
					FROM `category_description` cd 
					WHERE cd.category_id = gbc2c.category_id 
						AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS category 
			FROM `google_base_category_to_category` gbc2c 
			ORDER BY google_base_category ASC
		");

        return $query->rows;
    }

    public function getTotalCategories()
    {
        $query = $this->db->query("
			SELECT COUNT(*) AS total 
			FROM `google_base_category_to_category`
		");

        return $query->row['total'];
    }
}
