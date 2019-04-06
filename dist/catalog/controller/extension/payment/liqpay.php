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

class ControllerExtensionPaymentLiqPay extends Controller
{
    public function index()
    {
        $data['button_confirm'] = $this->language->get('button_confirm');

        $this->load->model('checkout/order');

        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

        $data['action'] = 'https://liqpay.com/?do=clickNbuy';

        $xml  = '<request>';
        $xml .= '	<version>1.2</version>';
        $xml .= '	<result_url>' . $this->url->link('checkout/success', '', true) . '</result_url>';
        $xml .= '	<server_url>' . $this->url->link('extension/payment/liqpay/callback', '', true) . '</server_url>';
        $xml .= '	<merchant_id>' . $this->config->get('liqpay_merchant') . '</merchant_id>';
        $xml .= '	<order_id>' . $this->session->data['order_id'] . '</order_id>';
        $xml .= '	<amount>' . $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false) . '</amount>';
        $xml .= '	<currency>' . $order_info['currency_code'] . '</currency>';
        $xml .= '	<description>' . $this->config->get('config_name') . ' ' . $order_info['payment_firstname'] . ' ' . $order_info['payment_address_1'] . ' ' . $order_info['payment_address_2'] . ' ' . $order_info['payment_city'] . ' ' . $order_info['email'] . '</description>';
        $xml .= '	<default_phone></default_phone>';
        $xml .= '	<pay_way>' . $this->config->get('liqpay_type') . '</pay_way>';
        $xml .= '</request>';

        $data['xml'] = base64_encode($xml);
        $data['signature'] = base64_encode(sha1($this->config->get('liqpay_signature') . $xml . $this->config->get('liqpay_signature'), true));

        return $this->load->view('extension/payment/liqpay', $data);
    }

    public function callback()
    {
        $xml = base64_decode($this->request->post['operation_xml']);
        $signature = base64_encode(sha1($this->config->get('liqpay_signature') . $xml . $this->config->get('liqpay_signature'), true));

        $posleft = strpos($xml, 'order_id');
        $posright = strpos($xml, '/order_id');

        $order_id = substr($xml, $posleft + 9, $posright - $posleft - 10);

        if ($signature == $this->request->post['signature']) {
            $this->load->model('checkout/order');

            $this->model_checkout_order->addOrderHistory($order_id, $this->config->get('config_order_status_id'));
        }
    }
}
