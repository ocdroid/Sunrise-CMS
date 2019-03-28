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

class ModelCatalogAttributeGroup extends Model
{
    public function addAttributeGroup($data)
    {
        $this->db->query("INSERT INTO " . DB_PREFIX . "attribute_group SET sort_order = '" . (int)$data['sort_order'] . "'");

        $attribute_group_id = $this->db->getLastId();

        foreach ($data['attribute_group_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "attribute_group_description SET attribute_group_id = '" . (int)$attribute_group_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
        }

        return $attribute_group_id;
    }

    public function editAttributeGroup($attribute_group_id, $data)
    {
        $this->db->query("UPDATE " . DB_PREFIX . "attribute_group SET sort_order = '" . (int)$data['sort_order'] . "' WHERE attribute_group_id = '" . (int)$attribute_group_id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "attribute_group_description WHERE attribute_group_id = '" . (int)$attribute_group_id . "'");

        foreach ($data['attribute_group_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "attribute_group_description SET attribute_group_id = '" . (int)$attribute_group_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
        }
    }

    public function deleteAttributeGroup($attribute_group_id)
    {
        $this->db->query("DELETE FROM " . DB_PREFIX . "attribute_group WHERE attribute_group_id = '" . (int)$attribute_group_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "attribute_group_description WHERE attribute_group_id = '" . (int)$attribute_group_id . "'");
    }

    public function getAttributeGroup($attribute_group_id)
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "attribute_group WHERE attribute_group_id = '" . (int)$attribute_group_id . "'");

        return $query->row;
    }

    public function getAttributeGroups($data = array())
    {
        $sql = "SELECT * FROM " . DB_PREFIX . "attribute_group ag LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (ag.attribute_group_id = agd.attribute_group_id) WHERE agd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        $sort_data = array(
            'agd.name',
            'ag.sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY agd.name";
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

    public function getAttributeGroupDescriptions($attribute_group_id)
    {
        $attribute_group_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "attribute_group_description WHERE attribute_group_id = '" . (int)$attribute_group_id . "'");

        foreach ($query->rows as $result) {
            $attribute_group_data[$result['language_id']] = array('name' => $result['name']);
        }

        return $attribute_group_data;
    }

    public function getTotalAttributeGroups()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "attribute_group");

        return $query->row['total'];
    }
}
