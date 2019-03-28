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

class ControllerExtensionModuleLatestPerCategory extends Controller
{
    public function index($setting)
    {
        static $module_id = 0;

        $this->load->language('extension/module/latestpercategory');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['button_buy_it'] = $this->language->get('button_buy_it');

        $this->load->model('extension/module/latestpercategory');

        $this->load->model('tool/image');

        $data['products'] = array();
        
        if (isset($this->request->get['path'])) {
            $path = '';

            $parts = explode('_', (string)$this->request->get['path']);

            foreach ($parts as $path_id) {
                if (!$path) {
                    $path = $path_id;
                } else {
                    $path .= '_' . $path_id;
                }
            }

            $category_id = array_pop($parts);
        } else {
            $category_id = null;
        }
        
        if (isset($this->request->get['manufacturer_id'])) {
            $manufacturer_id = ($this->request->get['manufacturer_id']);
        } else {
            $manufacturer_id  = null;
        }

        $filter_data = array(
            'sort'  => 'p.date_added',
            'order' => 'DESC',
            'start' => 0,
            'limit' => $setting['limit'],
            'category_id' => $category_id,
            'manufacturer_id' => $manufacturer_id
        );

        $results = $this->model_extension_module_latestpercategory->getLatestProductsPerCategory($filter_data);

        if ($results) {
            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
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

                if ((float)$result['special']) {
                    $yousave_percent = round(((($result['price'] - $result['special']) / $result['price']) * 100), 0);
                } else {
                    $yousave_percent = false;
                }


                $stickers = $this->getStickers($result['product_id']) ;

                $data['products'][] = array(
                    'product_id'  => $result['product_id'],
                    'thumb'       => $image,
                    'name'        => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                    'price'       => $price,
                    'special'     => $special,
                    'yousave_percent' => $yousave_percent,
                    'sticker'     => $stickers,
                    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
                );
            }
            
            $data['module_id'] = $module_id++;

            return $this->load->view('extension/module/latestpercategory', $data);
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
