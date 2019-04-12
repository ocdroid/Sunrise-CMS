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

class ControllerExtensionPaymentBankTransfer extends Controller
{
    public function index()
    {
        $this->load->language('extension/payment/bank_transfer');

        $data['text_instruction'] = $this->language->get('text_instruction');
        $data['text_description'] = $this->language->get('text_description');
        $data['text_payment'] = $this->language->get('text_payment');
        $data['text_loading'] = $this->language->get('text_loading');

        $data['button_confirm'] = $this->language->get('button_confirm');

        $data['bank'] = nl2br($this->config->get('bank_transfer_bank' . $this->config->get('config_language_id')));

        $data['continue'] = $this->url->link('checkout/success');

        return $this->load->view('extension/payment/bank_transfer', $data);
    }

    public function confirm()
    {
        if ($this->session->data['payment_method']['code'] == 'bank_transfer') {
            $this->load->language('extension/payment/bank_transfer');

            $this->load->model('checkout/order');

            $comment  = $this->language->get('text_instruction') . "\n\n";
            $comment .= $this->config->get('bank_transfer_bank' . $this->config->get('config_language_id')) . "\n\n";
            $comment .= $this->language->get('text_payment');

            $this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('bank_transfer_order_status_id'), $comment, true);
        }
    }
}
