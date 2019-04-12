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

class ModelCatalogManufacturer extends Model
{
    public function getManufacturerLayoutId($manufacturer_id)
    {
        $query = $this->db->query("
			SELECT * 
			FROM manufacturer_to_layout 
			WHERE manufacturer_id = '" . (int)$manufacturer_id . "' 
				AND store_id = '" . (int)$this->config->get('config_store_id') . "'
		");

        if ($query->num_rows) {
            return $query->row['layout_id'];
        } else {
            return 0;
        }
    }
    
    public function getManufacturer($manufacturer_id)
    {
        $query = $this->db->query("
			SELECT DISTINCT * 
			FROM manufacturer m 
			LEFT JOIN manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id) 
			LEFT JOIN manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) 
			WHERE m.manufacturer_id = '" . (int)$manufacturer_id . "' 
				AND md.language_id = '" . (int)$this->config->get('config_language_id') . "' 
				AND m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'
		");

        return $query->row;
    }

    public function getManufacturers($data = array())
    {
        if ($data) {
            $sql = "
				SELECT * 
				FROM manufacturer m 
				LEFT JOIN manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id) 
				LEFT JOIN manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) 
				WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
					AND md.language_id = '" . (int)$this->config->get('config_language_id') . "'
			";

            $sort_data = array(
                'name',
                'sort_order'
            );

            if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
                $sql .= " ORDER BY " . $data['sort'];
            } else {
                $sql .= " ORDER BY name";
            }

            if (isset($data['order']) && ($data['order'] == 'DESC')) {
                $sql .= " DESC";
            } else {
                $sql .= " ASC";
            }

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
        } else {
            $manufacturer_data = $this->cache->get('manufacturer.' . (int)$this->config->get('config_store_id') . '.' . (int)$this->config->get('config_language_id'));

            if (!$manufacturer_data) {
                $query = $this->db->query("
					SELECT * 
					FROM manufacturer m 
					LEFT JOIN manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id) 
					LEFT JOIN manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) 
					WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
						AND md.language_id = '" . (int)$this->config->get('config_language_id') . "' 
					ORDER BY name
				");
                $manufacturer_data = $query->rows;
                $this->cache->set('manufacturer.' . (int)$this->config->get('config_store_id') . '.' . (int)$this->config->get('config_language_id'), $manufacturer_data);
            }

            return $manufacturer_data;
        }
    }
}
