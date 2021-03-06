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

class ControllerExtensionFeedSitemapPro extends Controller
{
    public function index()
    {
        if ($this->config->get('sitemap_pro_status')) {
            $output  = '<?xml version="1.0" encoding="UTF-8"?>';
            $output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">';

            $this->load->model('extension/feed/sitemap_pro');
            $this->load->model('tool/image');

            $products = $this->model_extension_feed_sitemap_pro->getProducts();

            foreach ($products as $product) {
                if ($product['image']) {
                    $output .= '<url>';
                    $output .= '<loc>' . $this->url->link('product/product', 'product_id=' . $product['product_id']) . '</loc>';
                    $output .= '<changefreq>weekly</changefreq>';
                    $output .= '<priority>1.0</priority>';
                    $output .= '<image:image>';
                    $output .= '<image:loc>' . $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')) . '</image:loc>';
                    $output .= '<image:caption>' . htmlspecialchars($product['name']) . '</image:caption>';
                    $output .= '<image:title>' . htmlspecialchars($product['name']) . '</image:title>';
                    $output .= '</image:image>';
                    $output .= '</url>';
                    $output .= "\n";
                }
            }

            $this->load->model('catalog/category');

            $output .= $this->getCategories(0);

            $this->load->model('catalog/manufacturer');

            $manufacturers = $this->model_catalog_manufacturer->getManufacturers();

            foreach ($manufacturers as $manufacturer) {
                $output .= '<url>';
                $output .= '<loc>' . $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id']) . '</loc>';
                $output .= '<changefreq>weekly</changefreq>';
                $output .= '<priority>0.7</priority>';
                $output .= '</url>';
            }

            $this->load->model('catalog/information');

            $informations = $this->model_catalog_information->getInformations();

            foreach ($informations as $information) {
                $output .= '<url>';
                $output .= '<loc>' . $this->url->link('information/information', 'information_id=' . $information['information_id']) . '</loc>';
                $output .= '<changefreq>weekly</changefreq>';
                $output .= '<priority>0.5</priority>';
                $output .= '</url>';
            }

            $output .= '</urlset>';

            $this->response->addHeader('Content-Type: application/xml');
            $this->response->setOutput($output);
        }
    }

    protected function getCategories($parent_id, $current_path = '')
    {
        $output = '';

        $results = $this->model_catalog_category->getCategories($parent_id);

        foreach ($results as $result) {
            if (!$current_path) {
                $new_path = $result['category_id'];
            } else {
                $new_path = $current_path . '_' . $result['category_id'];
            }

            $output .= '<url>';
            $output .= '<loc>' . $this->url->link('product/category', 'path=' . $new_path) . '</loc>';
            $output .= '<changefreq>weekly</changefreq>';
            $output .= '<priority>0.7</priority>';
            $output .= '</url>';
            $output .= '\n';
            
            $output .= $this->getCategories($result['category_id'], $new_path);
        }
        
        
        return $output;
    }
}
