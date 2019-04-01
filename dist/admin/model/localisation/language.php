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

class ModelLocalisationLanguage extends Model {
	public function addLanguage($data) {
		$this->db->query("INSERT INTO language SET name = '" . $this->db->escape($data['name']) . "', code = '" . $this->db->escape($data['code']) . "', locale = '" . $this->db->escape($data['locale']) . "', sort_order = '" . $this->db->escape($data['sort_order']) . "', status = '" . (int)$data['status'] . "'");

		$this->cache->delete('language');

		$language_id = $this->db->getLastId();
		
		// Blog Article
		$query = $this->db->query("SELECT * FROM article_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		foreach ($query->rows as $article) {
			$this->db->query("INSERT INTO article_description SET article_id = '" . (int)$article['article_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($article['name']) . "', description = '" . $this->db->escape($article['description']) . "', meta_description = '" . $this->db->escape($article['meta_description']) . "', meta_title = '" . $this->db->escape($article['meta_title']) . "', meta_h1 = '" . $this->db->escape($article['meta_h1']) . "', tag = '" . $this->db->escape($article['tag']) . "'");
		}
		$this->cache->delete('article');
		
		// Blog Category
		$query = $this->db->query("SELECT * FROM blog_category_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		foreach ($query->rows as $blog_category) {
			$this->db->query("INSERT INTO blog_category_description SET blog_category_id = '" . (int)$blog_category['blog_category_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($blog_category['name']) . "', description = '" . $this->db->escape($blog_category['description']) . "', meta_description = '" . $this->db->escape($blog_category['meta_description']) . "', meta_title = '" . $this->db->escape($blog_category['meta_title']) . "', meta_h1 = '" . $this->db->escape($blog_category['meta_h1']) . "'");
		}
		
		// Menu
		$query = $this->db->query("SELECT * FROM custommenu_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		foreach ($query->rows as $custommenu) {
			$this->db->query("INSERT INTO custommenu_description SET custommenu_id = '" . (int)$custommenu['custommenu_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($custommenu['name']) . "', link = '" . $this->db->escape($custommenu['link']) . "'");
		}
		
		// Menu Child
		$query = $this->db->query("SELECT * FROM custommenu_child_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		foreach ($query->rows as $custommenu_child) {
			$this->db->query("INSERT INTO custommenu_child_description SET custommenu_child_id = '" . (int)$custommenu_child['custommenu_child_id'] . "', custommenu_id = '" . (int)$custommenu_child['custommenu_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($custommenu_child['name']) . "', link = '" . $this->db->escape($custommenu_child['link']) . "'");
		}

		// Attribute
		$query = $this->db->query("SELECT * FROM attribute_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $attribute) {
			$this->db->query("INSERT INTO attribute_description SET attribute_id = '" . (int)$attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($attribute['name']) . "'");
		}

		// Attribute Group
		$query = $this->db->query("SELECT * FROM attribute_group_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $attribute_group) {
			$this->db->query("INSERT INTO attribute_group_description SET attribute_group_id = '" . (int)$attribute_group['attribute_group_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($attribute_group['name']) . "'");
		}

		$this->cache->delete('attribute');

		// Banner
		$query = $this->db->query("SELECT * FROM banner_image WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $banner_image) {
			$this->db->query("INSERT INTO banner_image SET banner_id = '" . (int)$banner_image['banner_id'] . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($banner_image['title']) . "', link = '" . $this->db->escape($banner_image['link']) . "', image = '" . $this->db->escape($banner_image['image']) . "', sort_order = '" . (int)$banner_image['sort_order'] . "'");
		}

		$this->cache->delete('banner');

		// Category
		$query = $this->db->query("SELECT * FROM category_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $category) {
			$this->db->query("INSERT INTO category_description SET category_id = '" . (int)$category['category_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($category['name']) . "', description = '" . $this->db->escape($category['description']) . "', meta_title = '" . $this->db->escape($category['meta_title']) . "', meta_description = '" . $this->db->escape($category['meta_description']) . "'");
		}

		$this->cache->delete('category');

		// Customer Group
		$query = $this->db->query("SELECT * FROM customer_group_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $customer_group) {
			$this->db->query("INSERT INTO customer_group_description SET customer_group_id = '" . (int)$customer_group['customer_group_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($customer_group['name']) . "', description = '" . $this->db->escape($customer_group['description']) . "'");
		}

		// Custom Field
		$query = $this->db->query("SELECT * FROM custom_field_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $custom_field) {
			$this->db->query("INSERT INTO custom_field_description SET custom_field_id = '" . (int)$custom_field['custom_field_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($custom_field['name']) . "'");
		}

		// Custom Field Value
		$query = $this->db->query("SELECT * FROM custom_field_value_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $custom_field_value) {
			$this->db->query("INSERT INTO custom_field_value_description SET custom_field_value_id = '" . (int)$custom_field_value['custom_field_value_id'] . "', language_id = '" . (int)$language_id . "', custom_field_id = '" . (int)$custom_field_value['custom_field_id'] . "', name = '" . $this->db->escape($custom_field_value['name']) . "'");
		}

		// Download
		$query = $this->db->query("SELECT * FROM download_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $download) {
			$this->db->query("INSERT INTO download_description SET download_id = '" . (int)$download['download_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($download['name']) . "'");
		}

		// Filter
		$query = $this->db->query("SELECT * FROM filter_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $filter) {
			$this->db->query("INSERT INTO filter_description SET filter_id = '" . (int)$filter['filter_id'] . "', language_id = '" . (int)$language_id . "', filter_group_id = '" . (int)$filter['filter_group_id'] . "', name = '" . $this->db->escape($filter['name']) . "'");
		}

		// Filter Group
		$query = $this->db->query("SELECT * FROM filter_group_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $filter_group) {
			$this->db->query("INSERT INTO filter_group_description SET filter_group_id = '" . (int)$filter_group['filter_group_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($filter_group['name']) . "'");
		}

		// Information
		$query = $this->db->query("SELECT * FROM information_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $information) {
			$this->db->query("INSERT INTO information_description SET information_id = '" . (int)$information['information_id'] . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($information['title']) . "', description = '" . $this->db->escape($information['description']) . "', meta_title = '" . $this->db->escape($information['meta_title']) . "', meta_description = '" . $this->db->escape($information['meta_description']) . "'");
		}

		$this->cache->delete('information');

		// Option
		$query = $this->db->query("SELECT * FROM option_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $option) {
			$this->db->query("INSERT INTO option_description SET option_id = '" . (int)$option['option_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($option['name']) . "'");
		}

		// Option Value
		$query = $this->db->query("SELECT * FROM option_value_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $option_value) {
			$this->db->query("INSERT INTO option_value_description SET option_value_id = '" . (int)$option_value['option_value_id'] . "', language_id = '" . (int)$language_id . "', option_id = '" . (int)$option_value['option_id'] . "', name = '" . $this->db->escape($option_value['name']) . "'");
		}

		// Order Status
		$query = $this->db->query("SELECT * FROM order_status WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $order_status) {
			$this->db->query("INSERT INTO order_status SET order_status_id = '" . (int)$order_status['order_status_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($order_status['name']) . "'");
		}

		$this->cache->delete('order_status');

		// Product
		$query = $this->db->query("SELECT * FROM product_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $product) {
			$this->db->query("INSERT INTO product_description SET product_id = '" . (int)$product['product_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($product['name']) . "', description = '" . $this->db->escape($product['description']) . "', tag = '" . $this->db->escape($product['tag']) . "', meta_title = '" . $this->db->escape($product['meta_title']) . "', meta_description = '" . $this->db->escape($product['meta_description']) . "'");
		}

		$this->cache->delete('product');

		// Product Attribute
		$query = $this->db->query("SELECT * FROM product_attribute WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $product_attribute) {
			$this->db->query("INSERT INTO product_attribute SET product_id = '" . (int)$product_attribute['product_id'] . "', attribute_id = '" . (int)$product_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" . $this->db->escape($product_attribute['text']) . "'");
		}

		// Stock Status
		$query = $this->db->query("SELECT * FROM stock_status WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($query->rows as $stock_status) {
			$this->db->query("INSERT INTO stock_status SET stock_status_id = '" . (int)$stock_status['stock_status_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($stock_status['name']) . "'");
		}

		$this->cache->delete('stock_status');

		return $language_id;
	}

	public function editLanguage($language_id, $data) {
		$language_query = $this->db->query("SELECT `code` FROM language WHERE language_id = '" . (int)$language_id . "'");
		
		$this->db->query("UPDATE language SET name = '" . $this->db->escape($data['name']) . "', code = '" . $this->db->escape($data['code']) . "', locale = '" . $this->db->escape($data['locale']) . "', sort_order = '" . $this->db->escape($data['sort_order']) . "', status = '" . (int)$data['status'] . "' WHERE language_id = '" . (int)$language_id . "'");

		if ($language_query->row['code'] != $data['code']) {
			$this->db->query("UPDATE setting SET value = '" . $this->db->escape($data['code']) . "' WHERE `key` = 'config_language' AND value = '" . $this->db->escape($language_query->row['code']) . "'");
			$this->db->query("UPDATE setting SET value = '" . $this->db->escape($data['code']) . "' WHERE `key` = 'config_admin_language' AND value = '" . $this->db->escape($language_query->row['code']) . "'");
		}
		
		$this->cache->delete('language');
	}
	
	public function deleteLanguage($language_id) {
		$this->db->query("DELETE FROM language WHERE language_id = '" . (int)$language_id . "'");

		$this->cache->delete('language');
		
		$this->db->query("DELETE FROM article_description WHERE language_id = '" . (int)$language_id . "'");
		$this->cache->delete('article');
		$this->db->query("DELETE FROM blog_category_description WHERE language_id = '" . (int)$language_id . "'");
		$this->db->query("DELETE FROM custommenu_description WHERE language_id = '" . (int)$language_id . "'");
		$this->db->query("DELETE FROM custommenu_child_description WHERE language_id = '" . (int)$language_id . "'");

		$this->db->query("DELETE FROM attribute_description WHERE language_id = '" . (int)$language_id . "'");
		$this->db->query("DELETE FROM attribute_group_description WHERE language_id = '" . (int)$language_id . "'");
		$this->db->query("DELETE FROM category_description WHERE language_id = '" . (int)$language_id . "'");

		$this->cache->delete('category');

		$this->db->query("DELETE FROM customer_group_description WHERE language_id = '" . (int)$language_id . "'");
		$this->db->query("DELETE FROM download_description WHERE language_id = '" . (int)$language_id . "'");
		$this->db->query("DELETE FROM filter_description WHERE language_id = '" . (int)$language_id . "'");
		$this->db->query("DELETE FROM filter_group_description WHERE language_id = '" . (int)$language_id . "'");
		$this->db->query("DELETE FROM information_description WHERE language_id = '" . (int)$language_id . "'");

		$this->cache->delete('information');

		$this->db->query("DELETE FROM option_description WHERE language_id = '" . (int)$language_id . "'");
		$this->db->query("DELETE FROM option_value_description WHERE language_id = '" . (int)$language_id . "'");
		$this->db->query("DELETE FROM order_status WHERE language_id = '" . (int)$language_id . "'");

		$this->cache->delete('order_status');

		$this->db->query("DELETE FROM product_attribute WHERE language_id = '" . (int)$language_id . "'");
		$this->db->query("DELETE FROM product_description WHERE language_id = '" . (int)$language_id . "'");

		$this->cache->delete('product');

		$this->db->query("DELETE FROM stock_status WHERE language_id = '" . (int)$language_id . "'");

		$this->cache->delete('stock_status');

	}

	public function getLanguage($language_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM language WHERE language_id = '" . (int)$language_id . "'");

		return $query->row;
	}

	public function getLanguages($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM language";

			$sort_data = array(
				'name',
				'code',
				'sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY sort_order, name";
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
			$language_data = $this->cache->get('language');

			if (!$language_data) {
				$language_data = array();

				$query = $this->db->query("SELECT * FROM language ORDER BY sort_order, name");

				foreach ($query->rows as $result) {
					$language_data[$result['code']] = array(
						'language_id' => $result['language_id'],
						'name'        => $result['name'],
						'code'        => $result['code'],
						'locale'      => $result['locale'],
						'image'       => $result['image'],
						'directory'   => $result['directory'],
						'sort_order'  => $result['sort_order'],
						'status'      => $result['status']
					);
				}

				$this->cache->set('language', $language_data);
			}

			return $language_data;
		}
	}

	public function getLanguageByCode($code) {
		$query = $this->db->query("SELECT * FROM `language` WHERE code = '" . $this->db->escape($code) . "'");

		return $query->row;
	}

	public function getTotalLanguages() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM language");

		return $query->row['total'];
	}
}
