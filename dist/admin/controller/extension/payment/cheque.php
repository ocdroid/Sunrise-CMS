<?php

/* 	Sunrise CMS - Open source CMS for widespread use.
	Copyright (C) 2019 Mykola Burakov (burakov.work@gmail.com)

	See SOURCE.txt for other and additional information.

	This file is part of Sunrise CMS.

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. */

class ControllerExtensionPaymentCheque extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('extension/payment/cheque');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('cheque', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_all_zones'] = $this->language->get('text_all_zones');

        $data['entry_payable'] = $this->language->get('entry_payable');
        $data['entry_total'] = $this->language->get('entry_total');
        $data['entry_order_status'] = $this->language->get('entry_order_status');
        $data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $data['help_total'] = $this->language->get('help_total');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['payable'])) {
            $data['error_payable'] = $this->error['payable'];
        } else {
            $data['error_payable'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/payment/cheque', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('extension/payment/cheque', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true);

        if (isset($this->request->post['cheque_payable'])) {
            $data['cheque_payable'] = $this->request->post['cheque_payable'];
        } else {
            $data['cheque_payable'] = $this->config->get('cheque_payable');
        }

        if (isset($this->request->post['cheque_total'])) {
            $data['cheque_total'] = $this->request->post['cheque_total'];
        } else {
            $data['cheque_total'] = $this->config->get('cheque_total');
        }

        if (isset($this->request->post['cheque_order_status_id'])) {
            $data['cheque_order_status_id'] = $this->request->post['cheque_order_status_id'];
        } else {
            $data['cheque_order_status_id'] = $this->config->get('cheque_order_status_id');
        }

        $this->load->model('localisation/order_status');

        $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        if (isset($this->request->post['cheque_geo_zone_id'])) {
            $data['cheque_geo_zone_id'] = $this->request->post['cheque_geo_zone_id'];
        } else {
            $data['cheque_geo_zone_id'] = $this->config->get('cheque_geo_zone_id');
        }

        $this->load->model('localisation/geo_zone');

        $data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

        if (isset($this->request->post['cheque_status'])) {
            $data['cheque_status'] = $this->request->post['cheque_status'];
        } else {
            $data['cheque_status'] = $this->config->get('cheque_status');
        }

        if (isset($this->request->post['cheque_sort_order'])) {
            $data['cheque_sort_order'] = $this->request->post['cheque_sort_order'];
        } else {
            $data['cheque_sort_order'] = $this->config->get('cheque_sort_order');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/payment/cheque', $data));
    }

    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/payment/cheque')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['cheque_payable']) {
            $this->error['payable'] = $this->language->get('error_payable');
        }

        return !$this->error;
    }
}
