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

class ModelDesignSticker extends Model {
	public function addSticker($data) {
		$this->db->query("INSERT INTO sticker SET name = '" . $this->db->escape($data['name']) . "', status = '" . (int)$data['status'] . "'");

		$sticker_id = $this->db->getLastId();

	if (isset($data['image'])) {
			$this->db->query("UPDATE sticker SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE sticker_id = '" . (int)$sticker_id . "'");
		}
		
	}

	public function editSticker($sticker_id, $data) {
		$this->db->query("UPDATE sticker SET name = '" . $this->db->escape($data['name']) . "', status = '" . (int)$data['status'] . "' WHERE sticker_id = '" . (int)$sticker_id . "'");	
	
	if (isset($data['image'])) {
			$this->db->query("UPDATE sticker SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE sticker_id = '" . (int)$sticker_id . "'");
		}
	
	}

	public function deleteSticker($sticker_id) {
		$this->db->query("DELETE FROM sticker WHERE sticker_id = '" . (int)$sticker_id . "'");
	}

	public function getSticker($sticker_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM sticker WHERE sticker_id = '" . (int)$sticker_id . "'");

		return $query->row;
	}

	public function getStickers($data = array()) {
		$sql = "SELECT * FROM sticker";

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
	
	public function getStickersProduct($data = array()) {

		$sql = "SELECT * FROM sticker";
			
		$query = $this->db->query($sql);
	
		return $query->rows;
			
	}

	public function getProductSticker($product_id) {
		$stickers = array();

		$query = $this->db->query("SELECT sticker_id, position FROM product_to_sticker WHERE product_id = '" . (int)$product_id . "' GROUP BY position");
		
		foreach ($query->rows as $sticker) {
			$stickers[$sticker['position']] = $sticker['sticker_id'];
		}

		return $stickers;
	}

	public function getTotalStickers() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM sticker");

		return $query->row['total'];
	}	
	
	public function validateDelete($selected) {
	
		$query = $this->db->query("SELECT COUNT(*) AS total FROM product_to_sticker WHERE sticker_id IN (". $selected .")");

		return $query->row['total'];
	}
}
?>