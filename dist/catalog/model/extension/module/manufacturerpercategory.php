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

class ModelExtensionModuleManufacturerpercategory extends Model
{
    public function getManufacturersByCategory($category_id)
    {
        $sql = "	SELECT DISTINCT m.manufacturer_id, m.name, m.image FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id) LEFT JOIN `" . DB_PREFIX . "product` p ON (m.manufacturer_id = p.manufacturer_id) LEFT JOIN `" . DB_PREFIX . "product_to_category` p2c ON (p.product_id= p2c.product_id)";
        $sql .= "	LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) WHERE m2s.store_id = '0' AND category_id = ". (int)$category_id . " AND md.language_id = '1' GROUP BY m.manufacturer_id ORDER BY m.name ASC";
            
            
        $query = $this->db->query($sql);

            
        return $query->rows;
    }
}
