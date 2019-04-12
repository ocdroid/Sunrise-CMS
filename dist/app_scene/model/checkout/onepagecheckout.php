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

class ModelCheckoutOnepagecheckout extends Model
{
    public function addOrder($data)
    {
        $this->db->query("
            INSERT INTO `order` 
            SET store_id = '" . (int)$data['store_id'] . "', 
                store_name = '" . $this->db->escape($data['store_name']) . "', 
                store_url = '" . $this->db->escape($data['store_url']) . "', 
                customer_id = '" . (int)$data['customer_id'] . "', 
                customer_group_id = '" . (int)$data['customer_group_id'] . "', 
                firstname = '" . $this->db->escape($data['firstname']) . "', 
                email = '" . $this->db->escape($data['email']) . "', 
                telephone = '" . $this->db->escape($data['telephone']) . "', 
                payment_firstname = '" . $this->db->escape($data['firstname']) . "', 
                payment_address_1 = '" . $this->db->escape($data['address_1']) . "', 
                payment_city = '" . $this->db->escape($data['city']) . "', 
                shipping_address_1 = '" . $this->db->escape($data['address_1']) . "', 
                shipping_city = '" . $this->db->escape($data['city']) . "', 
                shipping_method = '" . $this->db->escape($data['shipping_method']['title']) . "', 
                shipping_code = '" . $this->db->escape($data['shipping_method']['code']) . "', 
                payment_method = '" . $this->db->escape($data['payment_method']['title']) . "', 
                payment_code = '" . $this->db->escape($data['payment_method']['code']) . "', 
                payment_country='', 
                payment_country_id = '0', 
                payment_zone_id = '0', 
                shipping_country_id = '0', 
                shipping_zone_id = '0', 
                comment = '" . $this->db->escape($data['comment']) . "', 
                total = '" . (float)$data['cart_total'] . "', 
                language_id = '" . (int)$data['language_id'] . "', 
                currency_id = '" . (int)$data['currency_id'] . "', 
                currency_code = '" . $this->db->escape($data['currency_code']) . "', 
                currency_value = '" . (float)$data['currency_value'] . "', 
                order_status_id = '" . (int)$data['order_status_id'] . "', 
                ip = '" . $this->db->escape($data['ip']) . "', 
                forwarded_ip = '" .  $this->db->escape($data['forwarded_ip']) . "', 
                user_agent = '" . $this->db->escape($data['user_agent']) . "', 
                accept_language = '" . $this->db->escape($data['accept_language']) . "', 
                date_added = NOW(), 
                date_modified = NOW()
        ");

        $order_id = $this->db->getLastId();

        // Products
        if (isset($data['products'])) {
            foreach ($data['products'] as $product) {
                $this->db->query("
                    INSERT INTO order_product 
                    SET order_id = '" . (int)$order_id . "', 
                        product_id = '" . (int)$product['product_id'] . "', 
                        name = '" . $this->db->escape($product['name']) . "', 
                        model = '" . $this->db->escape($product['model']) . "', 
                        quantity = '" . (int)$product['quantity'] . "', 
                        price = '" . (float)$product['price'] . "', 
                        total = '" . (float)$product['total'] . "', 
                        tax = '', 
                        reward = '" . (int)$product['reward'] . "'
                ");

                $order_product_id = $this->db->getLastId();

                foreach ($product['option'] as $option) {
                    $this->db->query("
                        INSERT INTO order_option 
                        SET order_id = '" . (int)$order_id . "', 
                            order_product_id = '" . (int)$order_product_id . "', 
                            product_option_id = '" . (int)$option['product_option_id'] . "', 
                            product_option_value_id = '" . (int)$option['product_option_value_id'] . "', 
                            name = '" . $this->db->escape($option['name']) . "', 
                            `value` = '" . $this->db->escape($option['value']) . "', 
                            `type` = '" . $this->db->escape($option['type']) . "'
                    ");
                }
            }
        }

        // Totals this is netver used
        if (isset($data['cart_total']) && false) {
            $this->db->query("
                INSERT INTO order_total 
                SET order_id = '" . (int)$order_id . "', 
                    code = 'total', 
                    title = 'Total', 
                    `value` = '" . (float)$data['cart_total']."', 
                    sort_order = ''
            ");
            $this->db->query("
                INSERT INTO order_total 
                SET order_id = '" . (int)$order_id . "', 
                    code = 'sub_total', 
                    title = 'Total', 
                    `value` = '" . (float)$data['cart_total']."', 
                    sort_order = ''
            ");
        }
        $totals = array();
        $taxes = array();
        // ex4 mod for totals
        $total_data = array(
            'totals' => &$totals,
            'taxes'  => &$taxes,
            'total'  => &$total
        );
        $sort_order = array();

        $results = $this->model_extension_extension->getExtensions('total');

        foreach ($results as $key => $value) {
            $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
        }

        array_multisort($sort_order, SORT_ASC, $results);

        foreach ($results as $result) {
            if ($this->config->get($result['code'] . '_status')) {
                $this->load->model('extension/total/' . $result['code']);

                // We have to put the totals in an array so that they pass by reference.
                $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
            }
        }

        $sort_order = array();
        foreach ($totals as $key => $value) {
            $sort_order[$key] = $value['sort_order'];
        }

        array_multisort($sort_order, SORT_ASC, $totals);
        $i = 10;
        $total_sum = 0;
        foreach ($totals as $total) {
            $this->db->query("
                INSERT INTO order_total 
                SET order_id = '" . (int)$order_id . "', 
                    code = '".$total['code']."', 
                    title = '".$total['title']."', 
                    `value` = '" . (float)$total['value']."', 
                    sort_order = '".$i."'
            ");
            $i += 10;
            $total_sum =  $total['value'];
        }
        // Last row in totals should be final sum...
        $this->db->query("
            UPDATE order 
            SET total='".$total_sum."' 
            WHERE order_id = '" . (int)$order_id . "'
        ");

        return $order_id;
    }
}
