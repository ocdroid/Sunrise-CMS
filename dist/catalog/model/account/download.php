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

class ModelAccountDownload extends Model {
	public function getDownload($download_id) {
		$implode = array();

		$order_statuses = $this->config->get('config_complete_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT d.filename, d.mask FROM `order` o LEFT JOIN order_product op ON (o.order_id = op.order_id) LEFT JOIN product_to_download p2d ON (op.product_id = p2d.product_id) LEFT JOIN download d ON (p2d.download_id = d.download_id) WHERE o.customer_id = '" . (int)$this->customer->getId() . "' AND (" . implode(" OR ", $implode) . ") AND d.download_id = '" . (int)$download_id . "'");

			return $query->row;
		} else {
			return;
		}
	}

	public function getDownloads($start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 20;
		}

		$implode = array();

		$order_statuses = $this->config->get('config_complete_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT DISTINCT d.download_id, o.order_id, o.date_added, dd.name, d.filename FROM `order` o LEFT JOIN order_product op ON (o.order_id = op.order_id) LEFT JOIN product_to_download p2d ON (op.product_id = p2d.product_id) LEFT JOIN download d ON (p2d.download_id = d.download_id) LEFT JOIN download_description dd ON (d.download_id = dd.download_id) WHERE o.customer_id = '" . (int)$this->customer->getId() . "' AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND (" . implode(" OR ", $implode) . ") ORDER BY o.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

			return $query->rows;
		} else {
			return array();
		}
	}

	public function getTotalDownloads() {
		$implode = array();

		$order_statuses = $this->config->get('config_complete_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM `order` o LEFT JOIN order_product op ON (o.order_id = op.order_id) LEFT JOIN product_to_download p2d ON (op.product_id = p2d.product_id) WHERE o.customer_id = '" . (int)$this->customer->getId() . "' AND (" . implode(" OR ", $implode) . ")");

			return $query->row['total'];
		} else {
			return 0;
		}
	}
}