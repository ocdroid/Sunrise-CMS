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

class ControllerCommoncolumnLeft extends Controller
{
    public function index()
    {
        if (isset($this->request->get['token']) && isset($this->session->data['token']) && ($this->request->get['token'] == $this->session->data['token'])) {
            $this->load->language('common/column_left');
    
            $this->load->model('user/user');
    
            $this->load->model('tool/image');
    
            $user_info = $this->model_user_user->getUser($this->user->getId());
    
            if ($user_info) {
                $data['firstname'] = $user_info['firstname'];
                $data['lastname'] = $user_info['lastname'];
    
                $data['user_group'] = $user_info['user_group'];
    
                if (is_file(DIR_IMAGE . $user_info['image'])) {
                    $data['image'] = $this->model_tool_image->resize($user_info['image'], 45, 45);
                } else {
                    $data['image'] = '';
                }
            } else {
                $data['firstname'] = '';
                $data['lastname'] = '';
                $data['user_group'] = '';
                $data['image'] = '';
            }
        
            // Create a 3 level menu array
            // Level 2 can not have children
            
            // Menu
            $data['menus'][] = array(
                'id'       => 'menu-dashboard',
                'name'	   => $this->language->get('text_dashboard'),
                'href'     => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
                'children' => array()
            );
            
            // Catalog
            $catalog = array();
            
            if ($this->user->hasPermission('access', 'catalog/category')) {
                $catalog[] = array(
                    'name'	   => $this->language->get('text_category'),
                    'href'     => $this->url->link('catalog/category', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'catalog/product')) {
                $catalog[] = array(
                    'name'	   => $this->language->get('text_product'),
                    'href'     => $this->url->link('catalog/product', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'catalog/filter')) {
                $catalog[] = array(
                    'name'	   => $this->language->get('text_filter'),
                    'href'     => $this->url->link('catalog/filter', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            // Attributes
            $attribute = array();
            
            if ($this->user->hasPermission('access', 'catalog/attribute')) {
                $attribute[] = array(
                    'name'     => $this->language->get('text_attribute'),
                    'href'     => $this->url->link('catalog/attribute', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'catalog/attribute_group')) {
                $attribute[] = array(
                    'name'	   => $this->language->get('text_attribute_group'),
                    'href'     => $this->url->link('catalog/attribute_group', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($attribute) {
                $catalog[] = array(
                    'name'	   => $this->language->get('text_attribute'),
                    'href'     => '',
                    'children' => $attribute
                );
            }
            
            if ($this->user->hasPermission('access', 'catalog/option')) {
                $catalog[] = array(
                    'name'	   => $this->language->get('text_option'),
                    'href'     => $this->url->link('catalog/option', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'catalog/manufacturer')) {
                $catalog[] = array(
                    'name'	   => $this->language->get('text_manufacturer'),
                    'href'     => $this->url->link('catalog/manufacturer', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'catalog/download')) {
                $catalog[] = array(
                    'name'	   => $this->language->get('text_download'),
                    'href'     => $this->url->link('catalog/download', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'catalog/review')) {
                $catalog[] = array(
                    'name'	   => $this->language->get('text_review'),
                    'href'     => $this->url->link('catalog/review', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'catalog/information')) {
                $catalog[] = array(
                    'name'	   => $this->language->get('text_information'),
                    'href'     => $this->url->link('catalog/information', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($catalog) {
                $data['menus'][] = array(
                    'id'       => 'menu-catalog',
                    'name'	   => $this->language->get('text_catalog'),
                    'href'     => '',
                    'children' => $catalog
                );
            }
            
            // BLOG
            $blog = array();

            if ($this->user->hasPermission('access', 'blog/article')) {
                $blog[] = array(
                    'name'	   => $this->language->get('text_blog_article'),
                    'href'     => $this->url->link('blog/article', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'blog/category')) {
                $blog[] = array(
                    'name'	   => $this->language->get('text_blog_category'),
                    'href'     => $this->url->link('blog/category', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
                    
            if ($this->user->hasPermission('access', 'blog/review')) {
                $blog[] = array(
                    'name'	   => $this->language->get('text_blog_review'),
                    'href'     => $this->url->link('blog/review', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'blog/setting')) {
                $blog[] = array(
                    'name'	   => $this->language->get('text_blog_setting'),
                    'href'     => $this->url->link('blog/setting', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
                    
            if ($blog) {
                $data['menus'][] = array(
                    'id'       => 'menu-blog',
                    'name'	   => $this->language->get('text_blog'),
                    'href'     => '',
                    'children' => $blog
                );
            }
            
    
            // Extension
            $extension = array();
            /*
            if ($this->user->hasPermission('access', 'extension/store')) {
                $extension[] = array(
                    'name'	   => $this->language->get('text_store'),
                    'href'     => $this->url->link('extension/store', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            */
            if ($this->user->hasPermission('access', 'extension/installer')) {
                $extension[] = array(
                    'name'	   => $this->language->get('text_installer'),
                    'href'     => $this->url->link('extension/installer', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'extension/extension')) {
                $extension[] = array(
                    'name'	   => $this->language->get('text_extension'),
                    'href'     => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
                    
            if ($this->user->hasPermission('access', 'extension/event')) {
                $extension[] = array(
                    'name'	   => $this->language->get('text_event'),
                    'href'     => $this->url->link('extension/event', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
                    
            if ($extension) {
                $data['menus'][] = array(
                    'id'       => 'menu-extension',
                    'name'	   => $this->language->get('text_extension'),
                    'href'     => '',
                    'children' => $extension
                );
            }
            
            // Design
            $design = array();
            
            if ($this->user->hasPermission('access', 'design/layout')) {
                $design[] = array(
                    'name'	   => $this->language->get('text_layout'),
                    'href'     => $this->url->link('design/layout', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'design/custommenu')) {
                $design[] = array(
                    'name'	   => $this->language->get('text_custommenu'),
                    'href'     => $this->url->link('design/custommenu', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            /*
            if ($this->user->hasPermission('access', 'design/menu')) {
                $design[] = array(
                    'name'	   => $this->language->get('text_menu'),
                    'href'     => $this->url->link('design/menu', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            */
            /*
            if ($this->user->hasPermission('access', 'design/theme')) {
                $design[] = array(
                    'name'	   => $this->language->get('text_theme'),
                    'href'     => $this->url->link('design/theme', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }

            if ($this->user->hasPermission('access', 'design/language')) {
                $design[] = array(
                    'name'	   => $this->language->get('text_translation'),
                    'href'     => $this->url->link('design/language', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            */
            if ($this->user->hasPermission('access', 'design/banner')) {
                $design[] = array(
                    'name'	   => $this->language->get('text_banner'),
                    'href'     => $this->url->link('design/banner', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'design/sticker')) {
                $design[] = array(
                    'name'	   => $this->language->get('text_sticker'),
                    'href'     => $this->url->link('design/sticker', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'design/benefit')) {
                $design[] = array(
                    'name'	   => $this->language->get('text_benefit'),
                    'href'     => $this->url->link('design/benefit', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($design) {
                $data['menus'][] = array(
                    'id'       => 'menu-design',
                    'name'	   => $this->language->get('text_design'),
                    'href'     => '',
                    'children' => $design
                );
            }
            
            // Sales
            $sale = array();
            
            if ($this->user->hasPermission('access', 'sale/order')) {
                $sale[] = array(
                    'name'	   => $this->language->get('text_order'),
                    'href'     => $this->url->link('sale/order', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($sale) {
                $data['menus'][] = array(
                    'id'       => 'menu-sale',
                    'name'	   => $this->language->get('text_sale'),
                    'href'     => '',
                    'children' => $sale
                );
            }
            
            // Customer
            $customer = array();
            
            if ($this->user->hasPermission('access', 'customer/customer')) {
                $customer[] = array(
                    'name'	   => $this->language->get('text_customer'),
                    'href'     => $this->url->link('customer/customer', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'customer/customer_group')) {
                $customer[] = array(
                    'name'	   => $this->language->get('text_customer_group'),
                    'href'     => $this->url->link('customer/customer_group', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'customer/custom_field')) {
                $customer[] = array(
                    'name'	   => $this->language->get('text_custom_field'),
                    'href'     => $this->url->link('customer/custom_field', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($customer) {
                $data['menus'][] = array(
                    'id'       => 'menu-customer',
                    'name'	   => $this->language->get('text_customer'),
                    'href'     => '',
                    'children' => $customer
                );
            }
            
            // Marketing
            $marketing = array();
            
            if ($this->user->hasPermission('access', 'marketing/marketing')) {
                $marketing[] = array(
                    'name'	   => $this->language->get('text_marketing'),
                    'href'     => $this->url->link('marketing/marketing', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'marketing/contact')) {
                $marketing[] = array(
                    'name'	   => $this->language->get('text_contact'),
                    'href'     => $this->url->link('marketing/contact', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($marketing) {
                $data['menus'][] = array(
                    'id'       => 'menu-marketing',
                    'name'	   => $this->language->get('text_marketing'),
                    'href'     => '',
                    'children' => $marketing
                );
            }
            
            // System
            $system = array();
            
            if ($this->user->hasPermission('access', 'setting/setting')) {
                $system[] = array(
                    'name'	   => $this->language->get('text_setting'),
                    'href'     => $this->url->link('setting/store', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
        
            // Users
            $user = array();
            
            if ($this->user->hasPermission('access', 'user/user')) {
                $user[] = array(
                    'name'	   => $this->language->get('text_users'),
                    'href'     => $this->url->link('user/user', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'user/user_permission')) {
                $user[] = array(
                    'name'	   => $this->language->get('text_user_group'),
                    'href'     => $this->url->link('user/user_permission', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'user/api')) {
                $user[] = array(
                    'name'	   => $this->language->get('text_api'),
                    'href'     => $this->url->link('user/api', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($user) {
                $system[] = array(
                    'name'	   => $this->language->get('text_users'),
                    'href'     => '',
                    'children' => $user
                );
            }
            
            // Localisation
            $localisation = array();
            
            if ($this->user->hasPermission('access', 'localisation/location')) {
                $localisation[] = array(
                    'name'	   => $this->language->get('text_location'),
                    'href'     => $this->url->link('localisation/location', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'localisation/language')) {
                $localisation[] = array(
                    'name'	   => $this->language->get('text_language'),
                    'href'     => $this->url->link('localisation/language', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'localisation/currency')) {
                $localisation[] = array(
                    'name'	   => $this->language->get('text_currency'),
                    'href'     => $this->url->link('localisation/currency', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'localisation/stock_status')) {
                $localisation[] = array(
                    'name'	   => $this->language->get('text_stock_status'),
                    'href'     => $this->url->link('localisation/stock_status', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'localisation/order_status')) {
                $localisation[] = array(
                    'name'	   => $this->language->get('text_order_status'),
                    'href'     => $this->url->link('localisation/order_status', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'localisation/country')) {
                $localisation[] = array(
                    'name'	   => $this->language->get('text_country'),
                    'href'     => $this->url->link('localisation/country', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'localisation/zone')) {
                $localisation[] = array(
                    'name'	   => $this->language->get('text_zone'),
                    'href'     => $this->url->link('localisation/zone', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'localisation/geo_zone')) {
                $localisation[] = array(
                    'name'	   => $this->language->get('text_geo_zone'),
                    'href'     => $this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            // Tax
            $tax = array();
            
            if ($this->user->hasPermission('access', 'localisation/tax_class')) {
                $tax[] = array(
                    'name'	   => $this->language->get('text_tax_class'),
                    'href'     => $this->url->link('localisation/tax_class', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'localisation/tax_rate')) {
                $tax[] = array(
                    'name'	   => $this->language->get('text_tax_rate'),
                    'href'     => $this->url->link('localisation/tax_rate', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($tax) {
                $localisation[] = array(
                    'name'	   => $this->language->get('text_tax'),
                    'href'     => '',
                    'children' => $tax
                );
            }
            
            if ($localisation) {
                $system[] = array(
                    'name'	   => $this->language->get('text_localisation'),
                    'href'     => '',
                    'children' => $localisation
                );
            }
            
            // Tools
            $tool = array();
            
            if ($this->user->hasPermission('access', 'tool/upload')) {
                $tool[] = array(
                    'name'	   => $this->language->get('text_upload'),
                    'href'     => $this->url->link('tool/upload', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'tool/backup')) {
                $tool[] = array(
                    'name'	   => $this->language->get('text_backup'),
                    'href'     => $this->url->link('tool/backup', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'tool/seomanager')) {
                $tool[] = array(
                    'name'	   => $this->language->get('text_seomanager'),
                    'href'     => $this->url->link('tool/seomanager', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($this->user->hasPermission('access', 'tool/log')) {
                $tool[] = array(
                    'name'	   => $this->language->get('text_log'),
                    'href'     => $this->url->link('tool/log', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($tool) {
                $system[] = array(
                    'name'	   => $this->language->get('text_tools'),
                    'href'     => '',
                    'children' => $tool
                );
            }
            
            if ($system) {
                $data['menus'][] = array(
                    'id'       => 'menu-system',
                    'name'	   => $this->language->get('text_system'),
                    'href'     => '',
                    'children' => $system
                );
            }
            
            // Report
            $report = array();
            
            // Report Customers
            $report_customer = array();
            
            if ($this->user->hasPermission('access', 'report/customer_reward')) {
                $report_customer[] = array(
                    'name'	   => $this->language->get('text_report_customer_reward'),
                    'href'     => $this->url->link('report/customer_reward', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }
            
            if ($report_customer) {
                $report[] = array(
                    'name'	   => $this->language->get('text_report_customer'),
                    'href'     => '',
                    'children' => $report_customer
                );
            }
            
            // Report Marketing
            $report_marketing = array();
            
            if ($this->user->hasPermission('access', 'report/marketing')) {
                $report_marketing[] = array(
                    'name'	   => $this->language->get('text_report_marketing'),
                    'href'     => $this->url->link('report/marketing', 'token=' . $this->session->data['token'], true),
                    'children' => array()
                );
            }

            if ($report_marketing) {
                $report[] = array(
                    'name'	   => $this->language->get('text_report_marketing'),
                    'href'     => '',
                    'children' => $report_marketing
                );
            }
            
            if ($report) {
                $data['menus'][] = array(
                    'id'       => 'menu-report',
                    'name'	   => $this->language->get('text_reports'),
                    'href'     => '',
                    'children' => $report
                );
            }
            
            return $this->load->view('common/column_left', $data);
        }
    }
}
