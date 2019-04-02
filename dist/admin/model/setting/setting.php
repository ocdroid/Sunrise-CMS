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

class ModelSettingSetting extends Model
{
    public function getSetting($code, $store_id = 0)
    {
        $setting_data = array();

        $query = $this->db->query("
			SELECT * 
			FROM setting 
			WHERE store_id = '" . (int)$store_id . "' 
				AND `code` = '" . $this->db->escape($code) . "'
		");

        foreach ($query->rows as $result) {
            if (!$result['serialized']) {
                $setting_data[$result['key']] = $result['value'];
            } else {
                $setting_data[$result['key']] = json_decode($result['value'], true);
            }
        }

        return $setting_data;
    }

    public function editSetting($code, $data, $store_id = 0)
    {
        $this->db->query("
			DELETE FROM `setting` 
			WHERE store_id = '" . (int)$store_id . "' 
				AND `code` = '" . $this->db->escape($code) . "'
		");

        foreach ($data as $key => $value) {
            if (substr($key, 0, strlen($code)) == $code) {
                if (!is_array($value)) {
                    $this->db->query("
						INSERT INTO setting 
						SET store_id = '" . (int)$store_id . "', 
							`code` = '" . $this->db->escape($code) . "', 
							`key` = '" . $this->db->escape($key) . "', 
							`value` = '" . $this->db->escape($value) . "'
					");
                } else {
                    $this->db->query("
						INSERT INTO setting 
						SET store_id = '" . (int)$store_id . "', 
							`code` = '" . $this->db->escape($code) . "', 
							`key` = '" . $this->db->escape($key) . "', 
							`value` = '" . $this->db->escape(json_encode($value, true)) . "', 
							serialized = '1'
					");
                }
            }
        }
    }

    public function deleteSetting($code, $store_id = 0)
    {
        $this->db->query("
			DELETE FROM setting 
			WHERE store_id = '" . (int)$store_id . "' 
				AND `code` = '" . $this->db->escape($code) . "'
		");
    }
    
    public function getSettingValue($key, $store_id = 0)
    {
        $query = $this->db->query("
			SELECT value 
			FROM setting 
			WHERE store_id = '" . (int)$store_id . "' 
				AND `key` = '" . $this->db->escape($key) . "'
		");

        if ($query->num_rows) {
            return $query->row['value'];
        } else {
            return null;
        }
    }
    
    public function editSettingValue($code = '', $key = '', $value = '', $store_id = 0)
    {
        if (!is_array($value)) {
            $this->db->query("
				UPDATE setting 
				SET `value` = '" . $this->db->escape($value) . "', 
					serialized = '0' 
				WHERE `code` = '" . $this->db->escape($code) . "' 
					AND `key` = '" . $this->db->escape($key) . "' 
					AND store_id = '" . (int)$store_id . "'
			");
        } else {
            $this->db->query("
				UPDATE setting 
				SET `value` = '" . $this->db->escape(json_encode($value)) . "', 
					serialized = '1' 
				WHERE `code` = '" . $this->db->escape($code) . "' 
					AND `key` = '" . $this->db->escape($key) . "' 
					AND store_id = '" . (int)$store_id . "'
			");
        }
    }
}
