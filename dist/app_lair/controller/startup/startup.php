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

class ControllerStartupStartup extends Controller
{
    public function index()
    {
        // Settings
        $query = $this->db->query("
            SELECT * 
            FROM setting 
            WHERE store_id = '0'
        ");
        
        foreach ($query->rows as $setting) {
            if (!$setting['serialized']) {
                $this->config->set($setting['key'], $setting['value']);
            } else {
                $this->config->set($setting['key'], json_decode($setting['value'], true));
            }
        }
        
        // Language
        $query = $this->db->query("
            SELECT * 
            FROM `language` 
            WHERE code = '" . $this->db->escape($this->config->get('config_admin_language')) . "'
        ");
        
        if ($query->num_rows) {
            $this->config->set('config_language_id', $query->row['language_id']);
        }
        
        // Language
        $language = new Language($this->config->get('config_admin_language'));
        $language->load($this->config->get('config_admin_language'));
        $this->registry->set('language', $language);
        
        // Customer
        $this->registry->set('customer', new Cart\Customer($this->registry));

        // Currency
        $this->registry->set('currency', new Cart\Currency($this->registry));
    
        // Tax
        $this->registry->set('tax', new Cart\Tax($this->registry));
        
        if ($this->config->get('config_tax_default') == 'shipping') {
            $this->tax->setShippingAddress($this->config->get('config_country_id'), $this->config->get('config_zone_id'));
        }

        if ($this->config->get('config_tax_default') == 'payment') {
            $this->tax->setPaymentAddress($this->config->get('config_country_id'), $this->config->get('config_zone_id'));
        }

        $this->tax->setStoreAddress($this->config->get('config_country_id'), $this->config->get('config_zone_id'));

        // Cart
        $this->registry->set('cart', new Cart\Cart($this->registry));
        
        // Encryption
        $this->registry->set('encryption', new Encryption($this->config->get('config_encryption')));
    }
}
