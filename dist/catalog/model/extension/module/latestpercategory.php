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

class ModelExtensionModuleLatestpercategory extends Model
{
    public function getLatestProductsPerCategory($data = array())
    {
        if (isset($data['limit'])) {
            $limit=(int)$data['limit'];
                    
            
            if (isset($data['category_id'])) {
                $category_id=(int)$data['category_id'];
            } else {
                $category_id='';
            }

                
            if (isset($data['manufacturer_id'])) {
                $manufacturer_id=(int)$data['manufacturer_id'];
            } else {
                $manufacturer_id='';
            }
            
            
            if ($this->customer->isLogged()) {
                $customer_group_id = $this->customer->getGroupId();
            } else {
                $customer_group_id = $this->config->get('config_customer_group_id');
            }
        
            $product_data = array();
        
            
            $product_data = $this->cache->get('product.latestpercategories.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$limit . '.' . (int)$limit . ($category_id ? (int)$category_id : '') . '.' . (int)$limit . ($manufacturer_id ? (int)$manufacturer_id : ''));

            
            if (!$product_data) {
                $product_data = array();
                

                $sql = "SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)";
                

                if ($category_id) {
                    $sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) ";
                }
                
                $sql .= "WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
        

                if ($category_id) {
                    $sql .= " AND p2c.category_id = '" . $category_id . "' ";
                }
                
                if ($manufacturer_id) {
                    $sql .= " AND p.manufacturer_id = '" . $manufacturer_id . "' ";
                }
        
                
                $sql .= " ORDER BY p.date_added DESC LIMIT " . $limit;
                
                
            
                
                $product_data = array();

                $query = $this->db->query($sql);
            
                $this->load->model('catalog/product');

                foreach ($query->rows as $result) {
                    $product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
                }
                    
                    
                $this->cache->set('product.latestpercategories.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$limit . '.' . (int)$limit . ($category_id ? (int)$category_id : '') . '.' . (int)$limit . ($manufacturer_id ? (int)$manufacturer_id : ''), $product_data);
            }

            return $product_data;
        }
    }
}
