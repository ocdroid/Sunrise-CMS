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

class ModelExtensionTotalReward extends Model {
	public function getTotal($total) {
		if (isset($this->session->data['reward'])) {
			$this->load->language('extension/total/reward');

			$points = $this->customer->getRewardPoints();

			if ($this->session->data['reward'] <= $points) {
				$discount_total = 0;

				$points_total = 0;

				foreach ($this->cart->getProducts() as $product) {
					if ($product['points']) {
						$points_total += $product['points'];
					}
				}

				$points = min($points, $points_total);

				foreach ($this->cart->getProducts() as $product) {
					$discount = 0;

					if ($product['points']) {
						$discount = $product['total'] * ($this->session->data['reward'] / $points_total);

						if ($product['tax_class_id']) {
							$tax_rates = $this->tax->getRates($product['total'] - ($product['total'] - $discount), $product['tax_class_id']);

							foreach ($tax_rates as $tax_rate) {
								if ($tax_rate['type'] == 'P') {
									$total['taxes'][$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
								}
							}
						}
					}

					$discount_total += $discount;
				}

				$total['totals'][] = array(
					'code'       => 'reward',
					'title'      => sprintf($this->language->get('text_reward'), $this->session->data['reward']),
					'value'      => -$discount_total,
					'sort_order' => $this->config->get('reward_sort_order')
				);

				$total['total'] -= $discount_total;
			}
		}
	}

	public function confirm($order_info, $order_total) {
		$this->load->language('extension/total/reward');

		$points = 0;

		$start = strpos($order_total['title'], '(') + 1;
		$end = strrpos($order_total['title'], ')');

		if ($start && $end) {
			$points = substr($order_total['title'], $start, $end - $start);
		}

		$this->load->model('account/customer');

		if ($this->model_account_customer->getRewardTotal($order_info['customer_id']) >= $points) {
			$this->db->query("INSERT INTO customer_reward SET customer_id = '" . (int)$order_info['customer_id'] . "', order_id = '" . (int)$order_info['order_id'] . "', description = '" . $this->db->escape(sprintf($this->language->get('text_order_id'), (int)$order_info['order_id'])) . "', points = '" . (float)-$points . "', date_added = NOW()");
		}
	}

	public function unconfirm($order_id) {
		$this->db->query("DELETE FROM customer_reward WHERE order_id = '" . (int)$order_id . "' AND points < 0");
	}
}
