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

class ModelDesignLayout extends Model {
	public function addLayout($data) {
		$this->db->query("INSERT INTO layout SET name = '" . $this->db->escape($data['name']) . "'");

		$layout_id = $this->db->getLastId();

		if (isset($data['layout_route'])) {
			foreach ($data['layout_route'] as $layout_route) {
				$this->db->query("INSERT INTO layout_route SET layout_id = '" . (int)$layout_id . "', store_id = '" . (int)$layout_route['store_id'] . "', route = '" . $this->db->escape($layout_route['route']) . "'");
			}
		}

		if (isset($data['layout_module'])) {
			foreach ($data['layout_module'] as $layout_module) {
				$this->db->query("INSERT INTO layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
			}
		}

		return $layout_id;
	}

	public function editLayout($layout_id, $data) {
		$this->db->query("UPDATE layout SET name = '" . $this->db->escape($data['name']) . "' WHERE layout_id = '" . (int)$layout_id . "'");

		$this->db->query("DELETE FROM layout_route WHERE layout_id = '" . (int)$layout_id . "'");

		if (isset($data['layout_route'])) {
			foreach ($data['layout_route'] as $layout_route) {
				$this->db->query("INSERT INTO layout_route SET layout_id = '" . (int)$layout_id . "', store_id = '" . (int)$layout_route['store_id'] . "', route = '" . $this->db->escape($layout_route['route']) . "'");
			}
		}

		$this->db->query("DELETE FROM layout_module WHERE layout_id = '" . (int)$layout_id . "'");

		if (isset($data['layout_module'])) {
			foreach ($data['layout_module'] as $layout_module) {
				$this->db->query("INSERT INTO layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
			}
		}
	}

	public function deleteLayout($layout_id) {
		$this->db->query("DELETE FROM layout WHERE layout_id = '" . (int)$layout_id . "'");
		$this->db->query("DELETE FROM layout_route WHERE layout_id = '" . (int)$layout_id . "'");
		$this->db->query("DELETE FROM layout_module WHERE layout_id = '" . (int)$layout_id . "'");
		$this->db->query("DELETE FROM category_to_layout WHERE layout_id = '" . (int)$layout_id . "'");
		$this->db->query("DELETE FROM product_to_layout WHERE layout_id = '" . (int)$layout_id . "'");
		$this->db->query("DELETE FROM information_to_layout WHERE layout_id = '" . (int)$layout_id . "'");
	}

	public function getLayout($layout_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row;
	}

	public function getLayouts($data = array()) {
		$sql = "SELECT * FROM layout";

		$sort_data = array('name');

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

	public function getLayoutRoutes($layout_id) {
		$query = $this->db->query("SELECT * FROM layout_route WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->rows;
	}

	public function getLayoutModules($layout_id) {
		$query = $this->db->query("SELECT * FROM layout_module WHERE layout_id = '" . (int)$layout_id . "' ORDER BY position ASC, sort_order ASC");

		return $query->rows;
	}

	public function getTotalLayouts() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM layout");

		return $query->row['total'];
	}
}