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

class ModelExtensionShippingFree extends Model
{
    public function getQuote($address)
    {
        $this->load->language('extension/shipping/free');

        $query = $this->db->query("
			SELECT * 
			FROM zone_to_geo_zone 
			WHERE geo_zone_id = '" . (int)$this->config->get('free_geo_zone_id') . "' 
				AND country_id = '" . (int)$address['country_id'] . "' 
				AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')
		");

        if (!$this->config->get('free_geo_zone_id')) {
            $status = true;
        } elseif ($query->num_rows) {
            $status = true;
        } else {
            $status = false;
        }

        if ($this->cart->getSubTotal() < $this->config->get('free_total')) {
            $status = false;
        }

        $method_data = array();

        if ($status) {
            $quote_data = array();

            $quote_data['free'] = array(
                'code'         => 'free.free',
                'title'        => $this->language->get('text_description'),
                'cost'         => 0.00,
                'tax_class_id' => 0,
                'text'         => $this->currency->format(0.00, $this->session->data['currency'])
            );

            $method_data = array(
                'code'       => 'free',
                'title'      => $this->language->get('text_title'),
                'quote'      => $quote_data,
                'sort_order' => $this->config->get('free_sort_order'),
                'error'      => false
            );
        }

        return $method_data;
    }
}
