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

class ModelExtensionTotalLowOrderFee extends Model {
	public function getTotal($total) {
		if ($this->cart->getSubTotal() && ($this->cart->getSubTotal() < $this->config->get('low_order_fee_total'))) {
			$this->load->language('extension/total/low_order_fee');

			$total['totals'][] = array(
				'code'       => 'low_order_fee',
				'title'      => $this->language->get('text_low_order_fee'),
				'value'      => $this->config->get('low_order_fee_fee'),
				'sort_order' => $this->config->get('low_order_fee_sort_order')
			);

			if ($this->config->get('low_order_fee_tax_class_id')) {
				$tax_rates = $this->tax->getRates($this->config->get('low_order_fee_fee'), $this->config->get('low_order_fee_tax_class_id'));

				foreach ($tax_rates as $tax_rate) {
					if (!isset($total['taxes'][$tax_rate['tax_rate_id']])) {
						$total['taxes'][$tax_rate['tax_rate_id']] = $tax_rate['amount'];
					} else {
						$total['taxes'][$tax_rate['tax_rate_id']] += $tax_rate['amount'];
					}
				}
			}

			$total['total'] += $this->config->get('low_order_fee_fee');
		}
	}
}