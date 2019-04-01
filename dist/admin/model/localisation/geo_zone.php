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

class ModelLocalisationGeoZone extends Model {
	public function addGeoZone($data) {
		$this->db->query("INSERT INTO geo_zone SET name = '" . $this->db->escape($data['name']) . "', description = '" . $this->db->escape($data['description']) . "', date_added = NOW()");

		$geo_zone_id = $this->db->getLastId();

		if (isset($data['zone_to_geo_zone'])) {
			foreach ($data['zone_to_geo_zone'] as $value) {
				$this->db->query("DELETE FROM zone_to_geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "' AND country_id = '" . (int)$value['country_id'] . "' AND zone_id = '" . (int)$value['zone_id'] . "'");				

				$this->db->query("INSERT INTO zone_to_geo_zone SET country_id = '" . (int)$value['country_id'] . "', zone_id = '" . (int)$value['zone_id'] . "', geo_zone_id = '" . (int)$geo_zone_id . "', date_added = NOW()");
			}
		}

		$this->cache->delete('geo_zone');
		
		return $geo_zone_id;
	}

	public function editGeoZone($geo_zone_id, $data) {
		$this->db->query("UPDATE geo_zone SET name = '" . $this->db->escape($data['name']) . "', description = '" . $this->db->escape($data['description']) . "', date_modified = NOW() WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");

		$this->db->query("DELETE FROM zone_to_geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");

		if (isset($data['zone_to_geo_zone'])) {
			foreach ($data['zone_to_geo_zone'] as $value) {
				$this->db->query("DELETE FROM zone_to_geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "' AND country_id = '" . (int)$value['country_id'] . "' AND zone_id = '" . (int)$value['zone_id'] . "'");				

				$this->db->query("INSERT INTO zone_to_geo_zone SET country_id = '" . (int)$value['country_id'] . "', zone_id = '" . (int)$value['zone_id'] . "', geo_zone_id = '" . (int)$geo_zone_id . "', date_added = NOW()");
			}
		}

		$this->cache->delete('geo_zone');
	}

	public function deleteGeoZone($geo_zone_id) {
		$this->db->query("DELETE FROM geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");
		$this->db->query("DELETE FROM zone_to_geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");

		$this->cache->delete('geo_zone');
	}

	public function getGeoZone($geo_zone_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");

		return $query->row;
	}

	public function getGeoZones($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM geo_zone";

			$sort_data = array(
				'name',
				'description'
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
			$geo_zone_data = $this->cache->get('geo_zone');

			if (!$geo_zone_data) {
				$query = $this->db->query("SELECT * FROM geo_zone ORDER BY name ASC");

				$geo_zone_data = $query->rows;

				$this->cache->set('geo_zone', $geo_zone_data);
			}

			return $geo_zone_data;
		}
	}

	public function getTotalGeoZones() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM geo_zone");

		return $query->row['total'];
	}

	public function getZoneToGeoZones($geo_zone_id) {
		$query = $this->db->query("SELECT * FROM zone_to_geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");

		return $query->rows;
	}

	public function getTotalZoneToGeoZoneByGeoZoneId($geo_zone_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM zone_to_geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");

		return $query->row['total'];
	}

	public function getTotalZoneToGeoZoneByCountryId($country_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM zone_to_geo_zone WHERE country_id = '" . (int)$country_id . "'");

		return $query->row['total'];
	}

	public function getTotalZoneToGeoZoneByZoneId($zone_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM zone_to_geo_zone WHERE zone_id = '" . (int)$zone_id . "'");

		return $query->row['total'];
	}
}