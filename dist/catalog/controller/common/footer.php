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

class ControllerCommonFooter extends Controller
{
    public function index()
    {
        $this->load->language('common/footer');

        $data['scripts'] = $this->document->getScripts('footer');

        $data['text_information'] = $this->language->get('text_information');
        $data['text_service'] = $this->language->get('text_service');
        $data['text_extra'] = $this->language->get('text_extra');
        $data['text_contact'] = $this->language->get('text_contact');
        $data['text_manufacturer'] = $this->language->get('text_manufacturer');
        $data['text_special'] = $this->language->get('text_special');
        $data['text_bestseller'] = $this->language->get('text_bestseller');
        $data['text_mostviewed'] = $this->language->get('text_mostviewed');
        $data['text_latest'] = $this->language->get('text_latest');
        $data['text_account'] = $this->language->get('text_account');
        $data['text_order'] = $this->language->get('text_order');
        $data['text_newsletter'] = $this->language->get('text_newsletter');
        $data['text_powered'] = $this->language->get('text_powered');
        
        $data['store_name'] = $this->config->get('config_name');
        $data['store_year'] = date('Y', time());

        if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
            $data['logo'] = '/images/' . $this->config->get('config_logo');
        } else {
            $data['logo'] = '';
        }

        $this->load->model('catalog/information');

        $data['informations'] = array();

        foreach ($this->model_catalog_information->getInformations() as $result) {
            if ($result['bottom']) {
                $data['informations'][] = array(
                    'title' => $result['title'],
                    'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
                );
            }
        }

        $data['contact'] = $this->url->link('information/contact');
        $data['manufacturer'] = $this->url->link('product/manufacturer');
        $data['special'] = $this->url->link('product/special');
        $data['bestseller'] = $this->url->link('product/bestseller');
        $data['mostviewed'] = $this->url->link('product/mostviewed');
        $data['latest'] = $this->url->link('product/latest');
        $data['account'] = $this->url->link('account/account', '', true);
        $data['order'] = $this->url->link('account/order', '', true);
        $data['newsletter'] = $this->url->link('account/newsletter', '', true);

        return $this->load->view('common/footer', $data);
    }
}
