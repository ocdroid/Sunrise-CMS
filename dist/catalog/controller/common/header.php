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

class ControllerCommonHeader extends Controller
{
    public function index()
    {
        // styles (addStylePreload if "preload" or addStyle if not)
        $this->document->addStyle('https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/css/uikit.min.css');
        $this->document->addStyle('/css/catalog/general/styles.css');
        // scripts (addScriptDefer if "defer" or addScriptAsync if "async" or addScript if neither one nor the other)
        $this->document->addScriptAsync('https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js');
        $this->document->addScriptAsync('https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit.min.js');
        $this->document->addScriptDefer('https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit-icons.min.js');

        $this->document->addScript('https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js');
        $this->document->addScriptAsync('/js/catalog/general/common/cart.js');
        
        //
        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
            $this->document->addLink($server . 'images/' . $this->config->get('config_icon'), 'icon');
        }

        $data['title'] = $this->document->getTitle();

        $data['base'] = $server;
        $data['description'] = $this->document->getDescription();
        $data['links'] = $this->document->getLinks();
        $data['robots'] = $this->document->getRobots();
        
        $data['stylespreload'] = $this->document->getStylespreload();
        $data['styles'] = $this->document->getStyles();
        
        $data['scriptsasync'] = $this->document->getScriptsAsync();
        $data['scriptsdefer'] = $this->document->getScriptsDefer();
        $data['scripts'] = $this->document->getScripts();

        $data['lang'] = $this->language->get('code');
        $data['direction'] = $this->language->get('direction');

        $data['name'] = $this->config->get('config_name');

        if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
            $data['logo'] = $server . 'images/' . $this->config->get('config_logo');
        } else {
            $data['logo'] = '';
        }

        // language
        $this->load->language('common/header');

        $data['text_home'] = $this->language->get('text_home');
        $data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
        $data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));
        $data['text_account'] = $this->language->get('text_account');
        $data['text_register'] = $this->language->get('text_register');
        $data['text_login'] = $this->language->get('text_login');
        $data['text_order'] = $this->language->get('text_order');
        $data['text_transaction'] = $this->language->get('text_transaction');
        $data['text_download'] = $this->language->get('text_download');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_checkout'] = $this->language->get('text_checkout');
        $data['text_main_menu'] = $this->language->get('text_main_menu');
        $data['text_go_to'] = $this->language->get('text_go_to');
        $data['text_look_at_map'] = $this->language->get('text_look_at_map');
        // 

        // links
        $data['home'] = $this->url->link('common/home');
        $data['logged'] = $this->customer->isLogged();
        $data['account'] = $this->url->link('account/account', '', true);
        $data['register'] = $this->url->link('account/register', '', true);
        $data['login'] = $this->url->link('account/login', '', true);
        $data['order'] = $this->url->link('account/order', '', true);
        $data['transaction'] = $this->url->link('account/transaction', '', true);
        $data['download'] = $this->url->link('account/download', '', true);
        $data['logout'] = $this->url->link('account/logout', '', true);
        $data['shopping_cart'] = $this->url->link('checkout/cart');
        // $data['checkout'] = $this->url->link('checkout/checkout', '', true);
        $data['checkout'] = $this->url->link('checkout/onepagecheckout', '', true);
        $data['contact'] = $this->url->link('information/contact');
        $data['telephone'] = $this->config->get('config_telephone');
        // 

        // Menu
        $this->load->model('design/custommenu');
        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $data['categories'] = array();
        
        if ($this->config->get('configcustommenu_custommenu')) {
            $custommenus = $this->model_design_custommenu->getcustommenus();
            $custommenu_child = $this->model_design_custommenu->getChildcustommenus();

            foreach ($custommenus as $id => $custommenu) {
                $children_data = array();
            
                foreach ($custommenu_child as $child_id => $child_custommenu) {
                    if (($custommenu['custommenu_id'] != $child_custommenu['custommenu_id']) or !is_numeric($child_id)) {
                        continue;
                    }

                    $child_name = '';

                    if (($custommenu['custommenu_type'] == 'category') and ($child_custommenu['custommenu_type'] == 'category')) {
                        $filter_data = array(
                            'filter_category_id'  => $child_custommenu['link'],
                            'filter_sub_category' => true
                        );

                        $child_name = ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '');
                    }

                    $children_data[] = array(
                        'name' => $child_custommenu['name'] . $child_name,
                        'href' => $this->getcustommenuLink($custommenu, $child_custommenu)
                    );
                }

                $data['categories'][] = array(
                    'name'     => $custommenu['name'] ,
                    'children' => $children_data,
                    'column'   => $custommenu['columns'] ? $custommenu['columns'] : 1,
                    'href'     => $this->getcustommenuLink($custommenu)
                );
            }
        } else {
            $categories = $this->model_catalog_category->getCategories(0);

            foreach ($categories as $category) {
                if ($category['top']) {

                    // Level 2
                    $children_data = array();

                    $children = $this->model_catalog_category->getCategories($category['category_id']);

                    foreach ($children as $child) {
                        $filter_data = array(
                            'filter_category_id'  => $child['category_id'],
                            'filter_sub_category' => true
                        );

                        $children_data[] = array(
                            'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                            'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                        );
                    }

                    // Level 1
                    $data['categories'][] = array(
                        'name'     => $category['name'],
                        'children' => $children_data,
                        'column'   => $category['column'] ? $category['column'] : 1,
                        'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
                    );
                }
            }
        }

        if ($this->config->get('configblog_blog_menu')) {
            $data['menu'] = $this->load->controller('blog/menu');
        } else {
            $data['menu'] = '';
        }
        // 

        // need fix later - https://opencartforum.com/topic/129529-reliz-ocstore-3020/?do=findComment&comment=1313914
        $data['search'] = $this->load->controller('common/search');
        $data['cart'] = $this->load->controller('common/cart');
        // 

        // adminbar
        if (isset($this->session->data['token'])) {

            // token
            $data['token_admin'] = $this->session->data['token'];
            // 

            // route
            if (isset($this->request->get['route'])) {
                if ($this->request->get['route'] == 'product/product') {
                    $data['quick_edit_admin'] = 'admin/index.php?route=catalog/product/edit&product_id=' . $this->request->get['product_id'] . '&token=' . $data['token_admin'];
                } elseif ($this->request->get['route'] == 'product/category') {
                    $path_parts = explode('_', $this->request->get['path']);
                    $data['quick_edit_admin'] = 'admin/index.php?route=catalog/category/edit&category_id=' . array_pop($path_parts) . '&token=' . $data['token_admin'];
                } elseif ($this->request->get['route'] == 'information/information') {
                    $data['quick_edit_admin'] = 'admin/index.php?route=catalog/information/edit&information_id=' . $this->request->get['information_id'] . '&token=' . $data['token_admin'];
                } elseif ($this->request->get['route'] == 'product/manufacturer/info') {
                    $data['quick_edit_admin'] = 'admin/index.php?route=catalog/manufacturer/edit&manufacturer_id=' . $this->request->get['manufacturer_id'] . '&token=' . $data['token_admin'];
                } else {
                    $data['quick_edit_admin'] = '';
                }
            } else {
                $data['quick_edit_admin'] = '';
            }
            // 
            
            // links
            $data['dashboard_admin'] = 'admin/index.php?route=common/dashboard&token=' . $data['token_admin'];
            $data['category_add_admin'] = 'admin/index.php?route=catalog/category/add&token=' . $data['token_admin'];
            $data['product_add_admin'] = 'admin/index.php?route=catalog/product/add&token=' . $data['token_admin'];
            $data['filter_add_admin'] = 'admin/index.php?route=catalog/filter/add&token=' . $data['token_admin'];
            $data['attribute_add_admin'] = 'admin/index.php?route=catalog/attribute/add&token=' . $data['token_admin'];
            $data['option_add_admin'] = 'admin/index.php?route=catalog/option/add&token=' . $data['token_admin'];
            $data['manufacturer_add_admin'] = 'admin/index.php?route=catalog/manufacturer/add&token=' . $data['token_admin'];
            $data['information_add_admin'] = 'admin/index.php?route=catalog/information/add&token=' . $data['token_admin'];
            $data['category_all_admin'] = 'admin/index.php?route=catalog/category&token=' . $data['token_admin'];
            $data['product_all_admin'] = 'admin/index.php?route=catalog/product&token=' . $data['token_admin'];
            $data['filter_all_admin'] = 'admin/index.php?route=catalog/filter&token=' . $data['token_admin'];
            $data['attribute_all_admin'] = 'admin/index.php?route=catalog/attribute&token=' . $data['token_admin'];
            $data['option_all_admin'] = 'admin/index.php?route=catalog/option&token=' . $data['token_admin'];
            $data['manufacturer_all_admin'] = 'admin/index.php?route=catalog/manufacturer&token=' . $data['token_admin'];
            $data['review_all_admin'] = 'admin/index.php?route=catalog/review&token=' . $data['token_admin'];
            $data['information_all_admin'] = 'admin/index.php?route=catalog/information&token=' . $data['token_admin'];
            $data['orders_pending_admin'] = 'admin/index.php?route=sale/order&token=' . $data['token_admin'] . '&filter_order_status=1';
            $data['orders_processing_admin'] = 'admin/index.php?route=sale/order&token=' . $data['token_admin'] . '&filter_order_status=1';
            $data['orders_orders_today'] = 'admin/index.php?route=sale/order&token=' . $data['token_admin'] . '&filter_date_added=' . date('Y-m-d');
            $data['all_orders_admin'] = 'admin/index.php?route=sale/order&token=' . $data['token_admin'];
            $data['return_admin'] = 'admin/index.php?route=sale/return&token=' . $data['token_admin'];
            $data['adminbar_logout'] = 'admin/index.php?route=common/logout&token=' . $data['token_admin'];
            // 

            // language
            $data['text_adminbar_edit'] = $this->language->get('text_adminbar_edit');
            $data['text_adminbar_dashboard'] = $this->language->get('text_adminbar_dashboard');
            $data['text_adminbar_add'] = $this->language->get('text_adminbar_add');
            $data['text_adminbar_category'] = $this->language->get('text_adminbar_category');
            $data['text_adminbar_product'] = $this->language->get('text_adminbar_product');
            $data['text_adminbar_filter'] = $this->language->get('text_adminbar_filter');
            $data['text_adminbar_attribute'] = $this->language->get('text_adminbar_attribute');
            $data['text_adminbar_option'] = $this->language->get('text_adminbar_option');
            $data['text_adminbar_manufacturer'] = $this->language->get('text_adminbar_manufacturer');
            $data['text_adminbar_information'] = $this->language->get('text_adminbar_information');
            $data['text_adminbar_catalog'] = $this->language->get('text_adminbar_catalog');
            $data['text_adminbar_categories'] = $this->language->get('text_adminbar_categories');
            $data['text_adminbar_products'] = $this->language->get('text_adminbar_products');
            $data['text_adminbar_filters'] = $this->language->get('text_adminbar_filters');
            $data['text_adminbar_attributes'] = $this->language->get('text_adminbar_attributes');
            $data['text_adminbar_options'] = $this->language->get('text_adminbar_options');
            $data['text_adminbar_manufacturers'] = $this->language->get('text_adminbar_manufacturers');
            $data['text_adminbar_review'] = $this->language->get('text_adminbar_review');
            $data['text_adminbar_informations'] = $this->language->get('text_adminbar_informations');
            $data['text_adminbar_sale'] = $this->language->get('text_adminbar_sale');
            $data['text_adminbar_orders_pending'] = $this->language->get('text_adminbar_orders_pending');
            $data['text_adminbar_orders_processing'] = $this->language->get('text_adminbar_orders_processing');
            $data['text_adminbar_orders_today'] = $this->language->get('text_adminbar_orders_today');
            $data['text_adminbar_all_orders'] = $this->language->get('text_adminbar_all_orders');
            $data['text_adminbar_return'] = $this->language->get('text_adminbar_return');
            $data['text_adminbar_logout'] = $this->language->get('text_adminbar_logout');
            // 
        }
        //

        // For page specific css
        if (isset($this->request->get['route'])) {
            if (isset($this->request->get['product_id'])) {
                $class = '-' . $this->request->get['product_id'];
            } elseif (isset($this->request->get['path'])) {
                $class = '-' . $this->request->get['path'];
            } elseif (isset($this->request->get['manufacturer_id'])) {
                $class = '-' . $this->request->get['manufacturer_id'];
            } elseif (isset($this->request->get['information_id'])) {
                $class = '-' . $this->request->get['information_id'];
            } else {
                $class = '';
            }

            $data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
        } else {
            $data['class'] = 'common-home';
        }
        // 

        return $this->load->view('common/header', $data);
    }
    
    public function getcustommenuLink($parent, $child = null)
    {
        if ($this->config->get('configcustommenu_custommenu')) {
            $item = empty($child) ? $parent : $child;

            switch ($item['custommenu_type']) {
                case 'category':
                    $route = 'product/category';

                    if (!empty($child)) {
                        $args = 'path=' . $parent['link'] . '_' . $item['link'];
                    } else {
                        $args = 'path='.$item['link'];
                    }
                    break;
                case 'product':
                    $route = 'product/product';
                    $args = 'product_id='.$item['link'];
                    break;
                case 'manufacturer':
                    $route = 'product/manufacturer/info';
                    $args = 'manufacturer_id='.$item['link'];
                    break;
                case 'information':
                    $route = 'information/information';
                    $args = 'information_id='.$item['link'];
                    break;
                default:
                    $tmp = explode('&', str_replace('index.php?route=', '', $item['link']));

                    if (!empty($tmp)) {
                        $route = $tmp[0];
                        unset($tmp[0]);
                        $args = (!empty($tmp)) ? implode('&', $tmp) : '';
                    } else {
                        $route = $item['link'];
                        $args = '';
                    }

                break;
            }

            $check = stripos($item['link'], 'http');
            $checkbase = strpos($item['link'], '/');
            
            if ($check === 0 || $checkbase === 0) {
                $link = $item['link'];
            } else {
                $link = $this->url->link($route, $args);
            }
            
            return $link;
        }
    }
}
