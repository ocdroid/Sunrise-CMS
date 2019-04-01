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

class ModelDesignBenefit extends Model {
	public function addBenefit($data) {
		$this->db->query("INSERT INTO benefit SET name = '" . $this->db->escape($data['name']) . "', link = '" . $data['link'] . "', type = '" . (int)$data['type'] . "', status = '" . (int)$data['status'] . "'");

		$benefit_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE benefit SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE benefit_id = '" . (int)$benefit_id . "'");
		}
		
		foreach ($data['benefit_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO benefit_description SET benefit_id = '" . (int)$benefit_id . "', language_id = '" . (int)$language_id . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
	}

	public function editBenefit($benefit_id, $data) {
		$this->db->query("UPDATE benefit SET name = '" . $this->db->escape($data['name']) . "', link = '" . $data['link'] . "', type = '" . (int)$data['type'] . "', status = '" . (int)$data['status'] . "' WHERE benefit_id = '" . (int)$benefit_id . "'");	
	
		if (isset($data['image'])) {
			$this->db->query("UPDATE benefit SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE benefit_id = '" . (int)$benefit_id . "'");
		}
		
		$this->db->query("DELETE FROM benefit_description WHERE benefit_id = '" . (int)$benefit_id . "'");
	
		foreach ($data['benefit_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO benefit_description SET benefit_id = '" . (int)$benefit_id . "', language_id = '" . (int)$language_id . "', description = '" . $this->db->escape($value['description']) . "'");
		}
	
	}

	public function deleteBenefit($benefit_id) {
		$this->db->query("DELETE FROM benefit WHERE benefit_id = '" . (int)$benefit_id . "'");
		$this->db->query("DELETE FROM benefit_description WHERE benefit_id = '" . (int)$benefit_id . "'");
	}

	public function getBenefit($benefit_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM benefit WHERE benefit_id = '" . (int)$benefit_id . "'");

		return $query->row;
	}

	public function getBenefits($data = array()) {
		$sql = "SELECT * FROM benefit";

		$sort_data = array(
			'name',
			'status'
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
	}	

	public function getProductBenefit($product_id) {
		$benefits = array();

		$query = $this->db->query("SELECT benefit_id, position FROM product_to_benefit WHERE product_id = '" . (int)$product_id . "' GROUP BY position");
		
		foreach ($query->rows as $benefit) {
			$benefits[$benefit['position']] = $benefit['benefit_id'];
		}

		return $benefits;
	}

	public function getTotalBenefits() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM benefit");

		return $query->row['total'];
	}	
	
	public function validateDelete($selected) {
	
		$query = $this->db->query("SELECT COUNT(*) AS total FROM product_to_benefit WHERE benefit_id IN (". $selected .")");

		return $query->row['total'];
	}
	
	
	public function getBenefitDescriptions($benefit_id) {
		$benefit_description_data = array();

		$query = $this->db->query("SELECT * FROM benefit_description WHERE benefit_id = '" . (int)$benefit_id . "'");

		foreach ($query->rows as $result) {
			$benefit_description_data[$result['language_id']] = array(
				'description'  => $result['description'],
			);
		}

		return $benefit_description_data;
	}
	
}
?>