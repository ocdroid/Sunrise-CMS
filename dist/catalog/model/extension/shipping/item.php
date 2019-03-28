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

class ModelExtensionShippingItem extends Model {
	function getQuote($address) {
		$this->load->language('extension/shipping/item');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('item_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->config->get('item_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$items = 0;

			foreach ($this->cart->getProducts() as $product) {
				if ($product['shipping']) {
					$items += $product['quantity'];
				}
			}

			$quote_data = array();

			$quote_data['item'] = array(
				'code'         => 'item.item',
				'title'        => $this->language->get('text_description'),
				'cost'         => $this->config->get('item_cost') * $items,
				'tax_class_id' => $this->config->get('item_tax_class_id'),
				'text'         => $this->currency->format($this->tax->calculate($this->config->get('item_cost') * $items, $this->config->get('item_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency'])
			);

			$method_data = array(
				'code'       => 'item',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('item_sort_order'),
				'error'      => false
			);
		}

		return $method_data;
	}
}