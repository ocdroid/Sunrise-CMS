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

class ModelExtensionShippingXshipping extends Model {
	function getQuote($address) {
		$this->load->language('extension/shipping/xshipping');
	
		$method_data = array();
	    $quote_data = array();
		
			
			
      		for($i=1;$i<=12;$i++)
			{
				
				
				
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('xshipping_geo_zone_id'.$i) . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
	
				if (!$this->config->get('xshipping_geo_zone_id'.$i)) {
					$status = true;
				} elseif ($query->num_rows) {
					$status = true;
				} else {
					$status = false;
				}
				
				
				
				if (!$this->config->get('xshipping_status'.$i)) {
				  $status = false;
				}
				
				if (!$this->config->get('xshipping_name'.$i)) {
				  $status = false;
				}
				
				$shipping_cost=$this->config->get('xshipping_cost'.$i);
				$free_shipping_cost=(float)$this->config->get('xshipping_free'.$i);
				if(empty($free_shipping_cost))$free_shipping_cost=0;
				
				if ($this->cart->getSubTotal() >= $free_shipping_cost && $free_shipping_cost!=0) {
					$shipping_cost = 0;
					
				}
				
				
				if ($status) {
				
					$quote_data['xshipping'.$i] = array(
						'code'         => 'xshipping'.'.xshipping'.$i,
						'title'        => $this->config->get('xshipping_name'.$i),
						'cost'         => $shipping_cost,
						'tax_class_id' => $this->config->get('xshipping_tax_class_id'.$i),
						'text'         => $this->currency->format($this->tax->calculate($shipping_cost, $this->config->get('xshipping_tax_class_id'.$i), $this->config->get('config_tax')), $this->session->data['currency'])
					);
		
					
				}
			}
			
			$method_data = array(
				'code'       => 'xshipping',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('xshipping_sort_order'),
				'error'      => ''
			);	
		
	
		return $method_data;
	}
}
?>