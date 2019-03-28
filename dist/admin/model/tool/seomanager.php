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

class ModelToolSeoManager extends Model {

	public function deleteUrlAlias($url_alias_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE `url_alias_id` = '" . (int)$url_alias_id . "'");
		$this->cache->delete('seo_pro');
		$this->cache->delete('seo_url');
	}

	public function updateUrlAlias($data) {
		if($data['query'] == '') return false;
		if($data['url_alias_id'] != 0 ) {
			$this->db->query("UPDATE `" . DB_PREFIX . "url_alias` SET `query` = '" . $this->db->escape($data['query']) . "', `keyword` = '" . $data['keyword'] . "' WHERE `url_alias_id` = '" . (int)$data['url_alias_id'] . "'");
		} else {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` SET 
				`query` = '" .  $this->db->escape($data['query']) . "', 
				`keyword` = '" . $this->db->escape($data['keyword']) . "',
				`seomanager` = 1");
		}
		$this->cache->delete('seo_pro');
		$this->cache->delete('seo_url');
		return true;
	}
	
	// Get List URL Alias
	public function getUrlAaliases($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM `" . DB_PREFIX . "url_alias` ua WHERE ua.seomanager = '1'";

			$sort_data = array('ua.query', 'ua.keyword');

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY ua.query";
			}

			if (isset($data['order']) && ($data['order'] == 'ASC')) {
				$sql .= " ASC";
			} else {
				$sql .= " DESC";
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

			return  $query->rows;
		} else {
			$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "url_alias` ua WHERE ua.seomanager = '1' ORDER BY ua.query");
			return $query->rows;
		}
	}

	// Total Aliases
	public function getTotalUrlAalias() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "url_alias` WHERE `seomanager` = '1';");
		return $query->row['total'];
	}

}
?>