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

class ModelExtensionFeedSitemapPro extends Model {

	public function getProducts() {
	
		$cache = md5('product_sitemap');
		
		$product_data = $this->cache->get('product_sitemap.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . $cache);

		if (!$product_data) {
			$sql = "SELECT p.product_id, p.image, pd.name  FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)"; 
			
			$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'"; 
					
			$product_data = array();
					
			$query = $this->db->query($sql);
		
			$product_data = $query->rows;

			$this->cache->set('product_sitemap.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id')  . $cache, $product_data);
		}
		
		return $product_data;
	}

}
?>