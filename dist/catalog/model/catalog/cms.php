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

class ModelCatalogCms extends Model
{
    private $NOW;

    public function __construct($registry)
    {
        $this->NOW = date('Y-m-d H:i') . ':00';
        parent::__construct($registry);
    }
    
    public function getProductRelatedByCategory($data)
    {
        $product_data = array();
        
        $this->load->model('catalog/product');
                
        $query = $this->db->query(
            "
			SELECT * 
			FROM product_related_wb pr 
			LEFT JOIN product p ON (pr.product_id = p.product_id) 
			LEFT JOIN product_to_store p2s ON (p.product_id = p2s.product_id) 
			WHERE pr.category_id = '" . (int)$data['category_id'] . "' 
				AND p.status = '1' 
				AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
			LIMIT " . (int)$data['limit']
        );

        foreach ($query->rows as $result) {
            $product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
        }
        return $product_data;
    }
    
    public function getProductRelatedByManufacturer($data)
    {
        $product_data = array();
        
        $this->load->model('catalog/product');
                
        $query = $this->db->query(
            "
			SELECT * 
			FROM product_related_mn pr 
			LEFT JOIN product p ON (pr.product_id = p.product_id) 
			LEFT JOIN product_to_store p2s ON (p.product_id = p2s.product_id) 
			WHERE pr.manufacturer_id = '" . (int)$data['manufacturer_id'] . "' 
				AND p.status = '1' AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
			LIMIT " . (int)$data['limit']
        );

        foreach ($query->rows as $result) {
            $product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
        }
        return $product_data;
    }
    
    public function getBestSeller($data = array())
    {
        $product_data = array();

        $sort_data = array(
            'op.name',
            'p.model',
            'p.price',
            'total'
        );
        $sql="
			SELECT op.product_id, SUM(op.quantity) AS total 
			FROM order_product op 
			LEFT JOIN `order` o ON (op.order_id = o.order_id) 
			LEFT JOIN `product` p ON (op.product_id = p.product_id) 
			LEFT JOIN product_to_store p2s ON (p.product_id = p2s.product_id) 
			WHERE o.order_status_id > '0' 
				AND p.status = '1' 
				AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
			GROUP BY op.product_id
		";

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
                $sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
            } else {
                $sql .= " ORDER BY " . $data['sort'];
            }
        } else {
            $sql .= " ORDER BY p.sort_order";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC, LCASE(op.name) DESC";
        } else {
            $sql .= " ASC, LCASE(op.name) ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        foreach ($query->rows as $result) {
            $product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
        }

        return $product_data;
    }
    
    public function getTotalBestSeller()
    {
        $query = $this->db->query("
			SELECT COUNT(DISTINCT op.product_id) AS total 
			FROM order_product op 
			LEFT JOIN `order` o ON (op.order_id = o.order_id) 
			LEFT JOIN `product` p ON (op.product_id = p.product_id) 
			LEFT JOIN product_to_store p2s ON (p.product_id = p2s.product_id) 
			WHERE o.order_status_id > '0' 
				AND p.status = '1' 
				AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'
		");

        if (isset($query->row['total'])) {
            return $query->row['total'];
        } else {
            return 0;
        }
    }
    
    public function getLatest($data = array())
    {
        $this->load->model('catalog/product');
        $NOW = date('Y-m-d H:i') . ':00';
        $sql = "
		SELECT * 
		FROM (SELECT p.product_id, 
				p.sort_order, 
				p.model, 
				pd.name, 
				p.quantity, 
				p.price, 
				(
					SELECT price 
					FROM product_discount pd2 
					WHERE pd2.product_id = p.product_id 
						AND pd2.quantity = '1' 
						AND ((pd2.date_start = '2000-01-01' OR pd2.date_start < '" . $NOW . "') 
							AND (pd2.date_end = '2000-01-01' OR pd2.date_end > '" . $NOW . "')) 
					ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, 
				(
					SELECT price 
					FROM product_special ps 
					WHERE ps.product_id = p.product_id 
						AND ((ps.date_start = '2000-01-01' OR ps.date_start < '" . $NOW . "') 
						AND (ps.date_end = '2000-01-01' OR ps.date_end > '" . $NOW . "')) 
					ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special 
					FROM product p 
		LEFT JOIN product_to_store p2s ON (p.product_id = p2s.product_id) 
		LEFT JOIN product_description pd ON (p.product_id = pd.product_id) 
		WHERE p.status = '1' 
			AND p2s.store_id = '" . (int)$this->config->get('config_store_id') .  "' 
			AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
		GROUP BY p.product_id 
		ORDER BY p.date_added DESC, 
		LCASE(pd.name) DESC
		";

        $sql .= " LIMIT  0," . (int)$data['max'];

        $sql .= ") p ORDER BY ";

        $sort_data = array(
            'pd.name',
            'quantity',
            'ps.price',
            'p.sort_order',
            'p.model'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            if ($data['sort'] == 'pd.name') {
                $sql .= " LCASE('name')";
            } elseif ($data['sort'] == 'ps.price') {
                $sql .= " (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
            } else {
                $sql .= " " . $data['sort'];
            }
        } else {
            $sql .= " sort_order";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC, LCASE(name) DESC";
        } else {
            $sql .= " ASC, LCASE(name) ASC";
        }


        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        foreach ($query->rows as $result) {
            $product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
        }

        return $product_data;
    }
    
    public function getMostViewed($data = array())
    {
        $this->load->model('catalog/product');
        
        if ($this->customer->isLogged()) {
            $customer_group_id = $this->customer->getCustomerGroupId();
        } else {
            $customer_group_id = $this->config->get('config_customer_group_id');
        }

        $product_data = $this->cache->get('product.mostviewed.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$data['limit']);

        $product_data = null;
        
        if (!$product_data) {
            $product_data = array();

            $sql = "
				SELECT * 
				FROM (
					SELECT p.product_id, 
					(
						SELECT price 
						FROM product_discount pd2 
						WHERE pd2.product_id = p.product_id 
							AND pd2.customer_group_id = '" . (int)$customer_group_id . "' 
							AND pd2.quantity = '1' 
							AND ((pd2.date_start = '2000-01-01' OR pd2.date_start < '" . $this->NOW . "') 
								AND (pd2.date_end = '2000-01-01' OR pd2.date_end > '" . $this->NOW . "')) 
							ORDER BY pd2.priority ASC, pd2.price ASC 
							LIMIT 1
					) AS discount, 
					(
						SELECT price 
						FROM product_special ps 
						WHERE ps.product_id = p.product_id 
							AND ps.customer_group_id = '" . (int)$customer_group_id . "' 
							AND ((ps.date_start = '2000-01-01' OR ps.date_start < '" . $this->NOW . "') 
								AND (ps.date_end = '2000-01-01' OR ps.date_end > '" . $this->NOW . "')) 
							ORDER BY ps.priority ASC, ps.price ASC 
							LIMIT 1
					) AS special, 
					p.sort_order, 
					p.viewed, 
					p.price, 
					p.model
			";
        
            $sql .= " 
				FROM product p  	
				LEFT JOIN product_to_store p2s ON (p.product_id = p2s.product_id) 
				WHERE p.status = '1' 
					AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
				GROUP BY p.product_id 
				ORDER by p.viewed DESC 
				LIMIT 0, " . (int)$data['max']
            ;

            $sql .= "
				) p 
				LEFT JOIN product_description pd ON (p.product_id = pd.product_id 
					AND pd.language_id = '".  (int)$this->config->get('config_language_id') ."') ORDER BY 
			";
    
        
            $sort_data = array(
            'pd.name',
            'quantity',
            'ps.price',
            'p.sort_order',
            'p.model',
            'p.viewed'
        );

            if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
                if ($data['sort'] == 'pd.name') {
                    $sql .= " LCASE('pd.name')";
                } elseif ($data['sort'] == 'ps.price') {
                    $sql .= " (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
                } else {
                    $sql .= " " . $data['sort'];
                }
            } else {
                $sql .= " p.sort_order";
            }
        
            if (isset($data['order']) && ($data['order'] == 'DESC')) {
                $sql .= " DESC, LCASE(name) DESC";
            } else {
                $sql .= " ASC, LCASE(name) ASC";
            }
    
                
            if (isset($data['start']) || isset($data['limit'])) {
                if ($data['start'] < 0) {
                    $data['start'] = 0;
                }

                if ($data['limit'] < 1) {
                    $data['limit'] = 20;
                }
        
                $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
            }

        
        
            $query = $this->db->query($sql);
        
    

            foreach ($query->rows as $result) {
                $product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
            }

            $this->cache->set('product.mostviewed.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$data['limit'], $product_data);
        }

        return $product_data;
    }
}
