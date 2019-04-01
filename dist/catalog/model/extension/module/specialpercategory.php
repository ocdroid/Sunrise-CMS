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

class ModelExtensionModuleSpecialpercategory extends Model
{
    public function getSpecialPerCategories($data = array(), $category_id = null, $manufacturer_id = null)
    {
        if (isset($data['limit'])) {
            $limit=(int)$data['limit'];
                        
            if ($this->customer->isLogged()) {
                $customer_group_id = $this->customer->getGroupId();
            } else {
                $customer_group_id = $this->config->get('config_customer_group_id');
            }
    
            $product_data = $this->cache->get('product.specialpercategories.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$limit . '.' . (int)$limit . ($category_id ? (int)$category_id : '') . '.' . (int)$limit . ($manufacturer_id ? (int)$manufacturer_id : ''));

            
            if (!$product_data) {
                $product_data = array();

                $sql = "SELECT DISTINCT ps.product_id FROM product_special ps LEFT JOIN product p ON (ps.product_id = p.product_id) LEFT JOIN product_description pd ON (p.product_id = pd.product_id) LEFT JOIN product_to_store p2s ON (p.product_id = p2s.product_id)";
            
                if ($category_id) {
                    $sql .= " LEFT JOIN product_to_category p2c ON (ps.product_id = p2c.product_id) ";
                }
            
                if ($manufacturer_id) {
                    $sql .= " LEFT JOIN product pm ON (ps.product_id = pm.product_id) ";
                }

                $sql .= "WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
    

                if ($category_id) {
                    $sql .= " AND p2c.category_id = '" . (int)$category_id . "' ";
                }
            
                if ($manufacturer_id) {
                    $sql .= " AND pm.manufacturer_id = '" . (int)$manufacturer_id . "' ";
                }
    
                $sql .= "AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.product_id";
            

                $sql .= " ORDER BY p.sort_order ASC  LIMIT " . $limit;

                $product_data = array();

                $query = $this->db->query($sql);
            
                $this->load->model('catalog/product');

                foreach ($query->rows as $result) {
                    $product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
                }
                
                $this->cache->set('product.specialpercategories.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$limit . '.' . (int)$limit . ($category_id ? (int)$category_id : '') . '.' . (int)$limit . ($manufacturer_id ? (int)$manufacturer_id : ''), $product_data);
            }

            return $product_data;
        }
    }
}
