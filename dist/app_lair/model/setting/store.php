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

class ModelSettingStore extends Model
{
    public function addStore($data)
    {
        $this->db->query("INSERT INTO store SET name = '" . $this->db->escape($data['config_name']) . "', `url` = '" . $this->db->escape($data['config_url']) . "', `ssl` = '" . $this->db->escape($data['config_ssl']) . "'");

        $store_id = $this->db->getLastId();

        // Layout Route
        $query = $this->db->query("SELECT * FROM layout_route WHERE store_id = '0'");

        foreach ($query->rows as $layout_route) {
            $this->db->query("INSERT INTO layout_route SET layout_id = '" . (int)$layout_route['layout_id'] . "', route = '" . $this->db->escape($layout_route['route']) . "', store_id = '" . (int)$store_id . "'");
        }

        $this->cache->delete('store');

        return $store_id;
    }

    public function editStore($store_id, $data)
    {
        $this->db->query("UPDATE store SET name = '" . $this->db->escape($data['config_name']) . "', `url` = '" . $this->db->escape($data['config_url']) . "', `ssl` = '" . $this->db->escape($data['config_ssl']) . "' WHERE store_id = '" . (int)$store_id . "'");

        $this->cache->delete('store');
    }

    public function deleteStore($store_id)
    {
        $this->db->query("DELETE 
			FROM store WHERE store_id = '" . (int)$store_id . "'");
        $this->db->query("DELETE 
			FROM layout_route WHERE store_id = '" . (int)$store_id . "'");

        $this->cache->delete('store');
    }

    public function getStore($store_id)
    {
        $query = $this->db->query("SELECT DISTINCT * FROM store WHERE store_id = '" . (int)$store_id . "'");

        return $query->row;
    }

    public function getStores($data = array())
    {
        $store_data = $this->cache->get('store');

        if (!$store_data) {
            $query = $this->db->query("SELECT * FROM store ORDER BY url");

            $store_data = $query->rows;

            $this->cache->set('store', $store_data);
        }

        return $store_data;
    }

    public function getTotalStores()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM store");

        return $query->row['total'];
    }

    public function getTotalStoresByLayoutId($layout_id)
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_layout_id' AND `value` = '" . (int)$layout_id . "' AND store_id != '0'");

        return $query->row['total'];
    }

    public function getTotalStoresByLanguage($language)
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_language' AND `value` = '" . $this->db->escape($language) . "' AND store_id != '0'");

        return $query->row['total'];
    }

    public function getTotalStoresByCurrency($currency)
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_currency' AND `value` = '" . $this->db->escape($currency) . "' AND store_id != '0'");

        return $query->row['total'];
    }

    public function getTotalStoresByCountryId($country_id)
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_country_id' AND `value` = '" . (int)$country_id . "' AND store_id != '0'");

        return $query->row['total'];
    }

    public function getTotalStoresByZoneId($zone_id)
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_zone_id' AND `value` = '" . (int)$zone_id . "' AND store_id != '0'");

        return $query->row['total'];
    }

    public function getTotalStoresByCustomerGroupId($customer_group_id)
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_customer_group_id' AND `value` = '" . (int)$customer_group_id . "' AND store_id != '0'");

        return $query->row['total'];
    }

    public function getTotalStoresByInformationId($information_id)
    {
        $account_query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_account_id' AND `value` = '" . (int)$information_id . "' AND store_id != '0'");

        $checkout_query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_checkout_id' AND `value` = '" . (int)$information_id . "' AND store_id != '0'");

        return ($account_query->row['total'] + $checkout_query->row['total']);
    }

    public function getTotalStoresByOrderStatusId($order_status_id)
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_order_status_id' AND `value` = '" . (int)$order_status_id . "' AND store_id != '0'");

        return $query->row['total'];
    }
}
