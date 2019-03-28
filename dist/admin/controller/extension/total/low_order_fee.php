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

class ControllerExtensionTotalLowOrderFee extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('extension/total/low_order_fee');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('low_order_fee', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=total', true));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_none'] = $this->language->get('text_none');

        $data['entry_total'] = $this->language->get('entry_total');
        $data['entry_fee'] = $this->language->get('entry_fee');
        $data['entry_tax_class'] = $this->language->get('entry_tax_class');
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

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=total', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/total/low_order_fee', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('extension/total/low_order_fee', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=total', true);

        if (isset($this->request->post['low_order_fee_total'])) {
            $data['low_order_fee_total'] = $this->request->post['low_order_fee_total'];
        } else {
            $data['low_order_fee_total'] = $this->config->get('low_order_fee_total');
        }

        if (isset($this->request->post['low_order_fee_fee'])) {
            $data['low_order_fee_fee'] = $this->request->post['low_order_fee_fee'];
        } else {
            $data['low_order_fee_fee'] = $this->config->get('low_order_fee_fee');
        }

        if (isset($this->request->post['low_order_fee_tax_class_id'])) {
            $data['low_order_fee_tax_class_id'] = $this->request->post['low_order_fee_tax_class_id'];
        } else {
            $data['low_order_fee_tax_class_id'] = $this->config->get('low_order_fee_tax_class_id');
        }

        $this->load->model('localisation/tax_class');

        $data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

        if (isset($this->request->post['low_order_fee_status'])) {
            $data['low_order_fee_status'] = $this->request->post['low_order_fee_status'];
        } else {
            $data['low_order_fee_status'] = $this->config->get('low_order_fee_status');
        }

        if (isset($this->request->post['low_order_fee_sort_order'])) {
            $data['low_order_fee_sort_order'] = $this->request->post['low_order_fee_sort_order'];
        } else {
            $data['low_order_fee_sort_order'] = $this->config->get('low_order_fee_sort_order');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/total/low_order_fee', $data));
    }

    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/total/low_order_fee')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
}
