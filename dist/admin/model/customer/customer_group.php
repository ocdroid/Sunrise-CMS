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

class ModelCustomerCustomerGroup extends Model
{
    public function addCustomerGroup($data)
    {
        $this->db->query("INSERT INTO customer_group SET approval = '" . (int)$data['approval'] . "', sort_order = '" . (int)$data['sort_order'] . "'");

        $customer_group_id = $this->db->getLastId();

        foreach ($data['customer_group_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO customer_group_description SET customer_group_id = '" . (int)$customer_group_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
        }
        
        return $customer_group_id;
    }

    public function editCustomerGroup($customer_group_id, $data)
    {
        $this->db->query("UPDATE customer_group SET approval = '" . (int)$data['approval'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE customer_group_id = '" . (int)$customer_group_id . "'");

        $this->db->query("DELETE FROM customer_group_description WHERE customer_group_id = '" . (int)$customer_group_id . "'");

        foreach ($data['customer_group_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO customer_group_description SET customer_group_id = '" . (int)$customer_group_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
        }
    }

    public function deleteCustomerGroup($customer_group_id)
    {
        $this->db->query("DELETE FROM customer_group WHERE customer_group_id = '" . (int)$customer_group_id . "'");
        $this->db->query("DELETE FROM customer_group_description WHERE customer_group_id = '" . (int)$customer_group_id . "'");
        $this->db->query("DELETE FROM product_discount WHERE customer_group_id = '" . (int)$customer_group_id . "'");
        $this->db->query("DELETE FROM product_special WHERE customer_group_id = '" . (int)$customer_group_id . "'");
        $this->db->query("DELETE FROM product_reward WHERE customer_group_id = '" . (int)$customer_group_id . "'");
        $this->db->query("DELETE FROM tax_rate_to_customer_group WHERE customer_group_id = '" . (int)$customer_group_id . "'");
    }

    public function getCustomerGroup($customer_group_id)
    {
        $query = $this->db->query("SELECT DISTINCT * FROM customer_group cg LEFT JOIN customer_group_description cgd ON (cg.customer_group_id = cgd.customer_group_id) WHERE cg.customer_group_id = '" . (int)$customer_group_id . "' AND cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

        return $query->row;
    }

    public function getCustomerGroups($data = array())
    {
        $sql = "SELECT * FROM customer_group cg LEFT JOIN customer_group_description cgd ON (cg.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        $sort_data = array(
            'cgd.name',
            'cg.sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY cgd.name";
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

    public function getCustomerGroupDescriptions($customer_group_id)
    {
        $customer_group_data = array();

        $query = $this->db->query("SELECT * FROM customer_group_description WHERE customer_group_id = '" . (int)$customer_group_id . "'");

        foreach ($query->rows as $result) {
            $customer_group_data[$result['language_id']] = array(
                'name'        => $result['name'],
                'description' => $result['description']
            );
        }

        return $customer_group_data;
    }

    public function getTotalCustomerGroups()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM customer_group");

        return $query->row['total'];
    }
}
