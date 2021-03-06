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

class ControllerExtensionExtensionPayment extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('extension/extension/payment');
        
        $this->load->model('extension/extension');

        $this->getList();
    }

    public function install()
    {
        $this->load->language('extension/extension/payment');

        $this->load->model('extension/extension');

        if ($this->validate()) {
            $this->model_extension_extension->install('payment', $this->request->get['extension']);

            $this->load->model('user/user_group');

            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'extension/payment/' . $this->request->get['extension']);
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'extension/payment/' . $this->request->get['extension']);

            // Call install method if it exsits
            $this->load->controller('extension/payment/' . $this->request->get['extension'] . '/install');

            $this->session->data['success'] = $this->language->get('text_success');
        }

        $this->getList();
    }

    public function uninstall()
    {
        $this->load->language('extension/extension/payment');

        $this->load->model('extension/extension');

        if ($this->validate()) {
            $this->model_extension_extension->uninstall('payment', $this->request->get['extension']);

            // Call uninstall method if it exsits
            $this->load->controller('extension/payment/' . $this->request->get['extension'] . '/uninstall');

            $this->session->data['success'] = $this->language->get('text_success');
        }

        $this->getList();
    }

    protected function getList()
    {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['column_name'] = $this->language->get('column_name');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_action'] = $this->language->get('column_action');

        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_install'] = $this->language->get('button_install');
        $data['button_uninstall'] = $this->language->get('button_uninstall');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $this->load->model('extension/extension');

        $extensions = $this->model_extension_extension->getInstalled('payment');

        foreach ($extensions as $key => $value) {
            if (!is_file(SR_APPLICATION . 'controller/extension/payment/' . $value . '.php') && !is_file(SR_APPLICATION . 'controller/payment/' . $value . '.php')) {
                $this->model_extension_extension->uninstall('payment', $value);

                unset($extensions[$key]);
            }
        }

        $data['extensions'] = array();

        // Compatibility code for old extension folders
        $files = glob(SR_APPLICATION . 'controller/{extension/payment,payment}/*.php', GLOB_BRACE);

        if ($files) {
            foreach ($files as $file) {
                $extension = basename($file, '.php');

                $this->load->language('extension/payment/' . $extension);

                $text_link = $this->language->get('text_' . $extension);

                if ($text_link != 'text_' . $extension) {
                    $link = $this->language->get('text_' . $extension);
                } else {
                    $link = '';
                }

                $data['extensions'][] = array(
                    'name'       => $this->language->get('heading_title'),
                    'link'       => $link,
                    'status'     => $this->config->get($extension . '_status') ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
                    'sort_order' => $this->config->get($extension . '_sort_order'),
                    'install'   => $this->url->link('extension/extension/payment/install', 'token=' . $this->session->data['token'] . '&extension=' . $extension, true),
                    'uninstall' => $this->url->link('extension/extension/payment/uninstall', 'token=' . $this->session->data['token'] . '&extension=' . $extension, true),
                    'installed' => in_array($extension, $extensions),
                    'edit'      => $this->url->link('extension/payment/' . $extension, 'token=' . $this->session->data['token'], true)
                );
            }
        }
        
        $sort_order = array();

        foreach ($data['extensions'] as $key => $value) {
            if ($value['installed']) {
                $add = '0';
            } else {
                $add = '1';
            }
            $sort_order[$key] = $add.$value['name'];
        }

        array_multisort($sort_order, SORT_ASC, $data['extensions']);

        $this->response->setOutput($this->load->view('extension/extension/payment', $data));
    }

    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/extension/payment')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
}
