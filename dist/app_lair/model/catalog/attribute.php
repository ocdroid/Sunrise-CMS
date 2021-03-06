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

class ModelCatalogAttribute extends Model
{
    public function addAttribute($data)
    {
        $this->db->query("
            INSERT INTO attribute 
            SET attribute_group_id = '" . (int)$data['attribute_group_id'] . "', 
                sort_order = '" . (int)$data['sort_order'] . "'
        ");

        $attribute_id = $this->db->getLastId();

        foreach ($data['attribute_description'] as $language_id => $value) {
            $this->db->query("
                INSERT INTO attribute_description 
                SET attribute_id = '" . (int)$attribute_id . "', 
                    language_id = '" . (int)$language_id . "', 
                    name = '" . $this->db->escape($value['name']) . "'
            ");
        }

        return $attribute_id;
    }

    public function editAttribute($attribute_id, $data)
    {
        $this->db->query("
            UPDATE attribute 
            SET attribute_group_id = '" . (int)$data['attribute_group_id'] . "', 
                sort_order = '" . (int)$data['sort_order'] . "' 
            WHERE attribute_id = '" . (int)$attribute_id . "'
        ");

        $this->db->query("
            DELETE 
			FROM attribute_description 
            WHERE attribute_id = '" . (int)$attribute_id . "'
        ");

        foreach ($data['attribute_description'] as $language_id => $value) {
            $this->db->query("
                INSERT INTO attribute_description 
                SET attribute_id = '" . (int)$attribute_id . "', 
                    language_id = '" . (int)$language_id . "', 
                    name = '" . $this->db->escape($value['name']) . "'
            ");
        }
    }

    public function deleteAttribute($attribute_id)
    {
        $this->db->query("
            DELETE 
			FROM attribute 
            WHERE attribute_id = '" . (int)$attribute_id . "'
        ");
        $this->db->query("
            DELETE 
			FROM attribute_description 
            WHERE attribute_id = '" . (int)$attribute_id . "'
        ");
    }

    public function getAttribute($attribute_id)
    {
        $query = $this->db->query("
            SELECT * 
            FROM attribute a 
            LEFT JOIN attribute_description ad ON (a.attribute_id = ad.attribute_id) 
            WHERE a.attribute_id = '" . (int)$attribute_id . "' 
                AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "'
        ");

        return $query->row;
    }

    public function getAttributes($data = array())
    {
        $sql = "
            SELECT *, 
                (
                    SELECT agd.name 
                    FROM attribute_group_description agd 
                    WHERE agd.attribute_group_id = a.attribute_group_id 
                        AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS attribute_group 
            FROM attribute a 
            LEFT JOIN attribute_description ad ON (a.attribute_id = ad.attribute_id) 
            WHERE ad.language_id = '" . (int)$this->config->get('config_language_id') . "'
        ";

        if (!empty($data['filter_name'])) {
            $sql .= " AND ad.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }

        if (!empty($data['filter_attribute_group_id'])) {
            $sql .= " AND a.attribute_group_id = '" . $this->db->escape($data['filter_attribute_group_id']) . "'";
        }

        $sort_data = array(
            'ad.name',
            'attribute_group',
            'a.sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY attribute_group, ad.name";
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
    }

    public function getAttributeDescriptions($attribute_id)
    {
        $attribute_data = array();

        $query = $this->db->query("
            SELECT * 
            FROM attribute_description 
            WHERE attribute_id = '" . (int)$attribute_id . "'
        ");

        foreach ($query->rows as $result) {
            $attribute_data[$result['language_id']] = array('name' => $result['name']);
        }

        return $attribute_data;
    }

    public function getTotalAttributes()
    {
        $query = $this->db->query("
            SELECT COUNT(*) AS total 
            FROM attribute
        ");

        return $query->row['total'];
    }

    public function getTotalAttributesByAttributeGroupId($attribute_group_id)
    {
        $query = $this->db->query("
            SELECT COUNT(*) AS total 
            FROM attribute 
            WHERE attribute_group_id = '" . (int)$attribute_group_id . "'
        ");

        return $query->row['total'];
    }
}
