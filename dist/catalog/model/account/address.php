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

class ModelAccountAddress extends Model {
	public function addAddress($data) {
		$this->db->query("
			INSERT INTO address
			SET customer_id = '" . (int)$this->customer->getId() . "',
				firstname = '" . $this->db->escape($data['firstname']) . "',
				lastname = '" . $this->db->escape($data['lastname']) . "',
				company = '" . $this->db->escape($data['company']) . "',
				address_1 = '" . $this->db->escape($data['address_1']) . "',
				address_2 = '" . $this->db->escape($data['address_2']) . "',
				postcode = '" . $this->db->escape($data['postcode']) . "',
				city = '" . $this->db->escape($data['city']) . "',
				zone_id = '" . (int)$data['zone_id'] . "',
				country_id = '" . (int)$data['country_id'] . "',
				custom_field = '" . $this->db->escape(isset($data['custom_field']) ? json_encode($data['custom_field']) : '') . "'
		");

		$address_id = $this->db->getLastId();

		if (!empty($data['default'])) {
			$this->db->query("UPDATE customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
		}

		return $address_id;
	}

	public function editAddress($address_id, $data) {
		$this->db->query("UPDATE address SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', company = '" . $this->db->escape($data['company']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', city = '" . $this->db->escape($data['city']) . "', zone_id = '" . (int)$data['zone_id'] . "', country_id = '" . (int)$data['country_id'] . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? json_encode($data['custom_field']) : '') . "' WHERE address_id  = '" . (int)$address_id . "' AND customer_id = '" . (int)$this->customer->getId() . "'");

		if (!empty($data['default'])) {
			$this->db->query("UPDATE customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
		}
	}

	public function deleteAddress($address_id) {
		$this->db->query("DELETE FROM address WHERE address_id = '" . (int)$address_id . "' AND customer_id = '" . (int)$this->customer->getId() . "'");
	}

	public function getAddress($address_id) {
		$address_query = $this->db->query("SELECT DISTINCT * FROM address WHERE address_id = '" . (int)$address_id . "' AND customer_id = '" . (int)$this->customer->getId() . "'");

		if ($address_query->num_rows) {
			$country_query = $this->db->query("SELECT * FROM `country` WHERE country_id = '" . (int)$address_query->row['country_id'] . "'");

			if ($country_query->num_rows) {
				$country = $country_query->row['name'];
				$iso_code_2 = $country_query->row['iso_code_2'];
				$iso_code_3 = $country_query->row['iso_code_3'];
				$address_format = $country_query->row['address_format'];
			} else {
				$country = '';
				$iso_code_2 = '';
				$iso_code_3 = '';
				$address_format = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `zone` WHERE zone_id = '" . (int)$address_query->row['zone_id'] . "'");

			if ($zone_query->num_rows) {
				$zone = $zone_query->row['name'];
				$zone_code = $zone_query->row['code'];
			} else {
				$zone = '';
				$zone_code = '';
			}

			$address_data = array(
				'address_id'     => $address_query->row['address_id'],
				'firstname'      => $address_query->row['firstname'],
				'lastname'       => $address_query->row['lastname'],
				'company'        => $address_query->row['company'],
				'address_1'      => $address_query->row['address_1'],
				'address_2'      => $address_query->row['address_2'],
				'postcode'       => $address_query->row['postcode'],
				'city'           => $address_query->row['city'],
				'zone_id'        => $address_query->row['zone_id'],
				'zone'           => $zone,
				'zone_code'      => $zone_code,
				'country_id'     => $address_query->row['country_id'],
				'country'        => $country,
				'iso_code_2'     => $iso_code_2,
				'iso_code_3'     => $iso_code_3,
				'address_format' => $address_format,
				'custom_field'   => json_decode($address_query->row['custom_field'], true)
			);

			return $address_data;
		} else {
			return false;
		}
	}

	public function getAddresses() {
		$address_data = array();

		$query = $this->db->query("SELECT * FROM address WHERE customer_id = '" . (int)$this->customer->getId() . "'");

		foreach ($query->rows as $result) {
			$country_query = $this->db->query("SELECT * FROM `country` WHERE country_id = '" . (int)$result['country_id'] . "'");

			if ($country_query->num_rows) {
				$country = $country_query->row['name'];
				$iso_code_2 = $country_query->row['iso_code_2'];
				$iso_code_3 = $country_query->row['iso_code_3'];
				$address_format = $country_query->row['address_format'];
			} else {
				$country = '';
				$iso_code_2 = '';
				$iso_code_3 = '';
				$address_format = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `zone` WHERE zone_id = '" . (int)$result['zone_id'] . "'");

			if ($zone_query->num_rows) {
				$zone = $zone_query->row['name'];
				$zone_code = $zone_query->row['code'];
			} else {
				$zone = '';
				$zone_code = '';
			}

			$address_data[$result['address_id']] = array(
				'address_id'     => $result['address_id'],
				'firstname'      => $result['firstname'],
				'lastname'       => $result['lastname'],
				'company'        => $result['company'],
				'address_1'      => $result['address_1'],
				'address_2'      => $result['address_2'],
				'postcode'       => $result['postcode'],
				'city'           => $result['city'],
				'zone_id'        => $result['zone_id'],
				'zone'           => $zone,
				'zone_code'      => $zone_code,
				'country_id'     => $result['country_id'],
				'country'        => $country,
				'iso_code_2'     => $iso_code_2,
				'iso_code_3'     => $iso_code_3,
				'address_format' => $address_format,
				'custom_field'   => json_decode($result['custom_field'], true)

			);
		}

		return $address_data;
	}

	public function getTotalAddresses() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM address WHERE customer_id = '" . (int)$this->customer->getId() . "'");

		return $query->row['total'];
	}
}