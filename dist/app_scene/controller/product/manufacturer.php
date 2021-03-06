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

class ControllerProductManufacturer extends Controller
{
    public function index()
    {
        $this->load->language('product/manufacturer');

        $this->load->model('catalog/manufacturer');

        $this->load->model('tool/image');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_index'] = $this->language->get('text_index');
        $data['text_empty'] = $this->language->get('text_empty');

        $data['button_continue'] = $this->language->get('button_continue');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_brand'),
            'href' => $this->url->link('product/manufacturer')
        );

        $data['categories'] = array();

        $results = $this->model_catalog_manufacturer->getManufacturers();

        foreach ($results as $result) {
            if (is_numeric(utf8_substr($result['name'], 0, 1))) {
                $key = '0 - 9';
            } else {
                $key = utf8_substr(utf8_strtoupper($result['name']), 0, 1);
            }

            if (!isset($data['categories'][$key])) {
                $data['categories'][$key]['name'] = $key;
            }

            $data['categories'][$key]['manufacturer'][] = array(
                'name' => $result['name'],
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
            );
        }

        $data['continue'] = $this->url->link('common/home');

        $data['column'] = $this->load->controller('common/column');
        
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('product/manufacturer_list', $data));
    }

    public function info()
    {
        $this->load->language('product/manufacturer');

        $this->load->model('catalog/manufacturer');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        if (isset($this->request->get['manufacturer_id'])) {
            $manufacturer_id = (int)$this->request->get['manufacturer_id'];
        } else {
            $manufacturer_id = 0;
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
            $this->document->setRobots('noindex,follow');
        } else {
            $sort = 'p.sort_order';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
            $this->document->setRobots('noindex,follow');
        } else {
            $page = 1;
        }

        if (isset($this->request->get['limit'])) {
            $limi﻿t = ((int)$this->request->get['limit'] > 100 ? 100 : (int)$this->request->get['limit﻿']);
            $this->document->setRobots('noindex,follow');
        } else {
            $limit = (int)$this->config->get($this->config->get('config_theme') . '_product_limit');
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_brand'),
            'href' => $this->url->link('product/manufacturer')
        );

        $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);

        if ($manufacturer_info) {
            if ($manufacturer_info['meta_title']) {
                $this->document->setTitle($manufacturer_info['meta_title']);
            } else {
                $this->document->setTitle($manufacturer_info['name']);
            }
            
            if ($manufacturer_info['noindex'] <= 0) {
                $this->document->setRobots('noindex,follow');
            }
            
            if ($manufacturer_info['meta_h1']) {
                $data['heading_title'] = $manufacturer_info['meta_h1'];
            } else {
                $data['heading_title'] = $manufacturer_info['name'];
            }
            
            $this->document->setDescription($manufacturer_info['meta_description']);

            $data['description'] = html_entity_decode($manufacturer_info['description'], ENT_QUOTES, 'UTF-8');
            $data['description_bottom'] = html_entity_decode($manufacturer_info['description_bottom'], ENT_QUOTES, 'UTF-8');
            
            if ($manufacturer_info['image']) {
                $data['thumb'] = $this->model_tool_image->resize($manufacturer_info['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
            } else {
                $data['thumb'] = '';
            }

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $manufacturer_info['name'],
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
            );

            $data['text_empty'] = $this->language->get('text_empty');
            $data['text_quantity'] = $this->language->get('text_quantity');
            $data['text_manufacturer'] = $this->language->get('text_manufacturer');
            $data['text_model'] = $this->language->get('text_model');
            $data['text_price'] = $this->language->get('text_price');
            $data['text_tax'] = $this->language->get('text_tax');
            $data['text_points'] = $this->language->get('text_points');
            $data['text_sort'] = $this->language->get('text_sort');
            $data['text_limit'] = $this->language->get('text_limit');
            $data['text_go_back'] = $this->language->get('text_go_back');

            $data['button_buy_it'] = $this->language->get('button_buy_it');
            $data['button_continue'] = $this->language->get('button_continue');
            $data['button_list'] = $this->language->get('button_list');
            $data['button_grid'] = $this->language->get('button_grid');

            $data['products'] = array();

            $filter_data = array(
                'filter_manufacturer_id' => $manufacturer_id,
                'sort'                   => $sort,
                'order'                  => $order,
                'start'                  => ($page - 1) * $limit,
                'limit'                  => $limit
            );

            $product_total = $this->model_catalog_product->getTotalProducts($filter_data);

            $results = $this->model_catalog_product->getProducts($filter_data);

            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                }

                if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $price = false;
                }

                if ((float)$result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $special = false;
                }

                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
                } else {
                    $tax = false;
                }

                if ($result['description_mini']) {
                    $description = utf8_substr(strip_tags(html_entity_decode($result['description_mini'], ENT_QUOTES, 'UTF-8')), 0);
                } else {
                    $description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..';
                }
                
                $stickers = $this->getStickers($result['product_id']) ;

                $data['products'][] = array(
                    'product_id'  => $result['product_id'],
                    'thumb'       => $image,
                    'name'        => $result['name'],
                    'description' => $description,
                    'price'       => $price,
                    'special'     => $special,
                    'tax'         => $tax,
                    'sticker'     => $stickers,
                    'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
                    'href'        => $this->url->link('product/product', 'manufacturer_id=' . $result['manufacturer_id'] . '&product_id=' . $result['product_id'] . $url)
                );
            }

            $url = '';

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['sorts'] = array();

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_default'),
                'value' => 'p.sort_order-ASC',
                'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.sort_order&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_name_asc'),
                'value' => 'pd.name-ASC',
                'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=pd.name&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_name_desc'),
                'value' => 'pd.name-DESC',
                'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=pd.name&order=DESC' . $url)
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_price_asc'),
                'value' => 'p.price-ASC',
                'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.price&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_price_desc'),
                'value' => 'p.price-DESC',
                'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.price&order=DESC' . $url)
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_model_asc'),
                'value' => 'p.model-ASC',
                'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.model&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_model_desc'),
                'value' => 'p.model-DESC',
                'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.model&order=DESC' . $url)
            );

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            $data['limits'] = array();

            $limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

            sort($limits);

            foreach ($limits as $value) {
                $data['limits'][] = array(
                    'text'  => $value,
                    'value' => $value,
                    'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url . '&limit=' . $value)
                );
            }

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $pagination = new Pagination();
            $pagination->total = $product_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->url = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] .  $url . '&page={page}');

            $data['pagination'] = $pagination->render();

            $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

            // http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
            if ($page == 1) {
                $this->document->addLink($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'], true), 'canonical');
            } elseif ($page == 2) {
                $this->document->addLink($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'], true), 'prev');
            } else {
                $this->document->addLink($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url . '&page='. ($page - 1), true), 'prev');
            }

            if ($limit && ceil($product_total / $limit) > $page) {
                $this->document->addLink($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url . '&page='. ($page + 1), true), 'next');
            }

            $data['sort'] = $sort;
            $data['order'] = $order;
            $data['limit'] = $limit;

            $data['continue'] = $this->url->link('common/home');

            $data['column'] = $this->load->controller('common/column');
            
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            // Custom template module
            // $this->response->setOutput($this->load->view('product/manufacturer_info', $data));
            $template = 'product/manufacturer_info';
            
            $this->load->model('setting/setting');

            $customer_group_id = $this->customer->getGroupId();

            if ($this->config->get('config_theme') == 'theme_default') {
                $directory = $this->config->get('theme_default_directory');
            } else {
                $directory = $this->config->get('config_theme');
            }

            $custom_template_module = $this->model_setting_setting->getSetting('custom_template_module');
            if (!empty($custom_template_module['custom_template_module'])) {
                foreach ($custom_template_module['custom_template_module'] as $key => $module) {
                    if (($module['type'] == 3) && !empty($module['manufacturers'])) {
                        if ((isset($module['customer_groups']) && in_array($customer_group_id, $module['customer_groups'])) || !isset($module['customer_groups']) || empty($module['customer_groups'])) {
                            if (in_array($manufacturer_id, $module['manufacturers'])) {
                                if (file_exists(SR_TEMPLATE . $directory . DIRECTORY_SEPARATOR . 'template' . DIRECTORY_SEPARATOR . $module['template_name'] . '.html')) {
                                    $template = $this->config->get('config_theme') .DIRECTORY_SEPARATOR. $module['template_name'];
                                }
                            }
                        } // customer groups
                    }
                }
            }

            $template = str_replace('\\', '/', $template);

            $this->response->setOutput($this->load->view($template, $data));
        // Custom template module
        } else {
            $url = '';

            if (isset($this->request->get['manufacturer_id'])) {
                $url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('product/manufacturer/info', $url)
            );

            $this->document->setTitle($this->language->get('text_error'));

            $data['heading_title'] = $this->language->get('text_error');

            $data['text_error'] = $this->language->get('text_error');
            $data['text_go_back'] = $this->language->get('text_go_back');
            $data['text_get_back'] = $this->language->get('text_get_back');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

            $data['header'] = $this->load->controller('common/header');
            $data['footer'] = $this->load->controller('common/footer');
            $data['column'] = $this->load->controller('common/column');
            
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');

            $this->response->setOutput($this->load->view('error/not_found', $data));
        }
    }
    
    private function getStickers($product_id)
    {
        $stickers = $this->model_catalog_product->getProductStickerbyProductId($product_id) ;
        
        if (!$stickers) {
            return;
        }
        
        $data['stickers'] = array();
        
        foreach ($stickers as $sticker) {
            $data['stickers'][] = array(
                'position' => $sticker['position'],
                'image' => '/images/' . $sticker['image']
            );
        }
                
        return $this->load->view('product/stickers', $data);
    }
}
