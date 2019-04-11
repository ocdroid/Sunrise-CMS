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

class ModelLocalisationTaxRate extends Model
{
    public function addTaxRate($data)
    {
        $this->db->query("
			INSERT INTO tax_rate 
			SET name = '" . $this->db->escape($data['name']) . "', 
				rate = '" . (float)$data['rate'] . "', 
				`type` = '" . $this->db->escape($data['type']) . "', 
				geo_zone_id = '" . (int)$data['geo_zone_id'] . "', 
				date_added = NOW(), 
				date_modified = NOW()
		");

        $tax_rate_id = $this->db->getLastId();

        if (isset($data['tax_rate_customer_group'])) {
            foreach ($data['tax_rate_customer_group'] as $customer_group_id) {
                $this->db->query("
					INSERT INTO tax_rate_to_customer_group 
					SET tax_rate_id = '" . (int)$tax_rate_id . "', 
						customer_group_id = '" . (int)$customer_group_id . "'
				");
            }
        }
        
        return $tax_rate_id;
    }

    public function editTaxRate($tax_rate_id, $data)
    {
        $this->db->query("
			UPDATE tax_rate 
			SET name = '" . $this->db->escape($data['name']) . "', 
				rate = '" . (float)$data['rate'] . "', 
				`type` = '" . $this->db->escape($data['type']) . "', 
				geo_zone_id = '" . (int)$data['geo_zone_id'] . "', 
				date_modified = NOW() 
			WHERE tax_rate_id = '" . (int)$tax_rate_id . "'
		");

        $this->db->query("
			DELETE 
			FROM tax_rate_to_customer_group 
			WHERE tax_rate_id = '" . (int)$tax_rate_id . "'
		");

        if (isset($data['tax_rate_customer_group'])) {
            foreach ($data['tax_rate_customer_group'] as $customer_group_id) {
                $this->db->query("
					INSERT INTO tax_rate_to_customer_group 
					SET tax_rate_id = '" . (int)$tax_rate_id . "', 
						customer_group_id = '" . (int)$customer_group_id . "'
				");
            }
        }
    }

    public function deleteTaxRate($tax_rate_id)
    {
        $this->db->query("
			DELETE 
			FROM tax_rate 
			WHERE tax_rate_id = '" . (int)$tax_rate_id . "'
		");
        $this->db->query("
			DELETE 
			FROM tax_rate_to_customer_group 
			WHERE tax_rate_id = '" . (int)$tax_rate_id . "'
		");
    }

    public function getTaxRate($tax_rate_id)
    {
        $query = $this->db->query("
			SELECT tr.tax_rate_id, 
				tr.name AS name, 
				tr.rate, 
				tr.type, 
				tr.geo_zone_id, 
				gz.name AS geo_zone, 
				tr.date_added, 
				tr.date_modified 
			FROM tax_rate tr 
			LEFT JOIN geo_zone gz ON (tr.geo_zone_id = gz.geo_zone_id) 
			WHERE tr.tax_rate_id = '" . (int)$tax_rate_id . "'
		");

        return $query->row;
    }

    public function getTaxRates($data = array())
    {
        $sql = "
			SELECT tr.tax_rate_id, 
				tr.name AS name, 
				tr.rate, 
				tr.type, 
				gz.name AS 
				geo_zone, 
				tr.date_added, 
				tr.date_modified 
			FROM tax_rate tr 
			LEFT JOIN geo_zone gz ON (tr.geo_zone_id = gz.geo_zone_id)
		";

        $sort_data = array(
            'tr.name',
            'tr.rate',
            'tr.type',
            'gz.name',
            'tr.date_added',
            'tr.date_modified'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY tr.name";
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

    public function getTaxRateCustomerGroups($tax_rate_id)
    {
        $tax_customer_group_data = array();

        $query = $this->db->query("
			SELECT * 
			FROM tax_rate_to_customer_group 
			WHERE tax_rate_id = '" . (int)$tax_rate_id . "'
		");

        foreach ($query->rows as $result) {
            $tax_customer_group_data[] = $result['customer_group_id'];
        }

        return $tax_customer_group_data;
    }

    public function getTotalTaxRates()
    {
        $query = $this->db->query("
			SELECT COUNT(*) AS total 
			FROM tax_rate
		");

        return $query->row['total'];
    }

    public function getTotalTaxRatesByGeoZoneId($geo_zone_id)
    {
        $query = $this->db->query("
			SELECT COUNT(*) AS total 
			FROM tax_rate 
			WHERE geo_zone_id = '" . (int)$geo_zone_id . "'
		");

        return $query->row['total'];
    }
}