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

class ModelCatalogManufacturer extends Model
{
    public function addManufacturer($data)
    {
        $this->db->query("
            INSERT INTO manufacturer 
            SET name = '" . $this->db->escape($data['name']) . "', 
                sort_order = '" . (int)$data['sort_order'] . "', 
                noindex = '" . (int)$data['noindex'] . "'
            ");
        
        $manufacturer_id = $this->db->getLastId();
        
        if (isset($data['manufacturer_layout'])) {
            foreach ($data['manufacturer_layout'] as $store_id => $layout_id) {
                $this->db->query("
                    INSERT INTO manufacturer_to_layout 
                    SET manufacturer_id = '" . (int)$manufacturer_id . "', 
                        store_id = '" . (int)$store_id . "', 
                        layout_id = '" . (int)$layout_id . "'
                ");
            }
        }

        if (isset($data['image'])) {
            $this->db->query("
                UPDATE manufacturer 
                SET image = '" . $this->db->escape($data['image']) . "' 
                WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
            ");
        }
        
        foreach ($data['manufacturer_description'] as $language_id => $value) {
            $this->db->query("
                INSERT INTO manufacturer_description 
                SET manufacturer_id = '" . (int)$manufacturer_id . "', 
                    language_id = '" . (int)$language_id . "', 
                    description = '" . $this->db->escape($value['description']) . "', 
                    description_bottom = '" . $this->db->escape($value['description_bottom']) . "', 
                    meta_title = '" . $this->db->escape($value['meta_title']) . "', 
                    meta_h1 = '" . $this->db->escape($value['meta_h1']) . "', 
                    meta_description = '" . $this->db->escape($value['meta_description']) . "'
            ");
        }

        if (isset($data['manufacturer_store'])) {
            foreach ($data['manufacturer_store'] as $store_id) {
                $this->db->query("
                    INSERT INTO manufacturer_to_store 
                    SET manufacturer_id = '" . (int)$manufacturer_id . "', 
                        store_id = '" . (int)$store_id . "'
                ");
            }
        }
        
        if (isset($data['product_related'])) {
            foreach ($data['product_related'] as $related_id) {
                $this->db->query("
                    INSERT INTO product_related_mn 
                    SET manufacturer_id = '" . (int)$manufacturer_id . "', 
                        product_id = '" . (int)$related_id . "'
                    ");
            }
        }
    
        if (isset($data['article_related'])) {
            foreach ($data['article_related'] as $related_id) {
                $this->db->query("
                    INSERT INTO article_related_mn 
                    SET manufacturer_id = '" . (int)$manufacturer_id . "', 
                        article_id = '" . (int)$related_id . "'
                ");
            }
        }
        
        $this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');

        if (isset($data['keyword'])) {
            $this->db->query("
                INSERT INTO url_alias 
                SET query = 'manufacturer_id=" . (int)$manufacturer_id . "', 
                    keyword = '" . $this->db->escape($data['keyword']) . "'
            ");
        }

        $this->cache->delete('manufacturer');

        return $manufacturer_id;
    }

    public function editManufacturer($manufacturer_id, $data)
    {
        $this->db->query("
            DELETE 
			FROM manufacturer_to_layout 
            WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");

        if (isset($data['manufacturer_layout'])) {
            foreach ($data['manufacturer_layout'] as $store_id => $layout_id) {
                $this->db->query("
                    INSERT INTO manufacturer_to_layout 
                    SET manufacturer_id = '" . (int)$manufacturer_id . "', 
                        store_id = '" . (int)$store_id . "', 
                        layout_id = '" . (int)$layout_id . "'
                ");
            }
        }
        
        $this->db->query("
            UPDATE manufacturer 
            SET name = '" . $this->db->escape($data['name']) . "', 
                sort_order = '" . (int)$data['sort_order'] . "', 
                noindex = '" . (int)$data['noindex'] . "' 
            WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");

        if (isset($data['image'])) {
            $this->db->query("
                UPDATE manufacturer 
                SET image = '" . $this->db->escape($data['image']) . "' 
                WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
            ");
        }
        
        $this->db->query("
            DELETE 
			FROM manufacturer_description 
            WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");
        
        foreach ($data['manufacturer_description'] as $language_id => $value) {
            $this->db->query("
                INSERT INTO manufacturer_description 
                SET manufacturer_id = '" . (int)$manufacturer_id . "', 
                    language_id = '" . (int)$language_id . "', 
                    description = '" . $this->db->escape($value['description']) . "', 
                    description_bottom = '" . $this->db->escape($value['description_bottom']) . "', 
                    meta_title = '" . $this->db->escape($value['meta_title']) . "', 
                    meta_h1 = '" . $this->db->escape($value['meta_h1']) . "', 
                    meta_description = '" . $this->db->escape($value['meta_description']) . "'
            ");
        }

        $this->db->query("
            DELETE 
			FROM manufacturer_to_store 
            WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");

        if (isset($data['manufacturer_store'])) {
            foreach ($data['manufacturer_store'] as $store_id) {
                $this->db->query("
                    INSERT INTO manufacturer_to_store 
                    SET manufacturer_id = '" . (int)$manufacturer_id . "', 
                        store_id = '" . (int)$store_id . "'
                ");
            }
        }
        
        $this->db->query("
            DELETE 
			FROM product_related_mn 
            WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");
    
        if (isset($data['product_related'])) {
            foreach ($data['product_related'] as $related_id) {
                $this->db->query("
                    DELETE 
			FROM product_related_mn 
                    WHERE manufacturer_id = '" . (int)$manufacturer_id . "' 
                        AND product_id = '" . (int)$related_id . "'
                ");
                $this->db->query("
                    INSERT INTO product_related_mn 
                    SET manufacturer_id = '" . (int)$manufacturer_id . "', 
                        product_id = '" . (int)$related_id . "'
                ");
            }
        }
        
        $this->db->query("
            DELETE 
			FROM article_related_mn 
            WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");
    
        if (isset($data['article_related'])) {
            foreach ($data['article_related'] as $related_id) {
                $this->db->query("
                    DELETE 
			FROM article_related_mn 
                    WHERE manufacturer_id = '" . (int)$manufacturer_id . "' 
                        AND article_id = '" . (int)$related_id . "'
                    ");
                $this->db->query("
                    INSERT INTO article_related_mn 
                    SET manufacturer_id = '" . (int)$manufacturer_id . "', 
                        article_id = '" . (int)$related_id . "'
                ");
            }
        }

        $this->db->query("
            DELETE 
			FROM url_alias 
            WHERE query = 'manufacturer_id=" . (int)$manufacturer_id . "'
        ");
        
        $this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');

        if ($data['keyword']) {
            $this->db->query("
                INSERT INTO url_alias 
                SET query = 'manufacturer_id=" . (int)$manufacturer_id . "', 
                    keyword = '" . $this->db->escape($data['keyword']) . "'
            ");
        }

        $this->cache->delete('manufacturer');
    }

    public function deleteManufacturer($manufacturer_id)
    {
        $this->db->query("
        	DELETE 
			FROM manufacturer 
        	WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");
        $this->db->query("
        	DELETE 
			FROM manufacturer_description 
        	WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");
        $this->db->query("
        	DELETE 
			FROM manufacturer_to_layout 
        	WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");
        $this->db->query("
        	DELETE 
			FROM manufacturer_to_store 
        	WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");
        $this->db->query("
        	DELETE 
			FROM url_alias 
        	WHERE query = 'manufacturer_id=" . (int)$manufacturer_id . "'
        ");
        $this->db->query("
        	DELETE 
			FROM product_related_mn 
        	WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");
        $this->db->query("
        	DELETE 
			FROM article_related_mn 
        	WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");

        $this->cache->delete('manufacturer');
    }

    public function getManufacturer($manufacturer_id)
    {
        $query = $this->db->query("
            SELECT DISTINCT *, 
                (
                    SELECT keyword 
                    FROM url_alias 
                    WHERE query = 'manufacturer_id=" . (int)$manufacturer_id . "') AS keyword 
            FROM manufacturer 
            WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");

        return $query->row;
    }

    public function getManufacturers($data = array())
    {
        $sql = "
            SELECT * 
            FROM manufacturer
        ";

        if (!empty($data['filter_name'])) {
            $sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }

        $sort_data = array(
            'name',
            'sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY name";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
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

        return $query->rows;
    }

    public function getManufacturerStores($manufacturer_id)
    {
        $manufacturer_store_data = array();

        $query = $this->db->query("
            SELECT * 
            FROM manufacturer_to_store 
            WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");

        foreach ($query->rows as $result) {
            $manufacturer_store_data[] = $result['store_id'];
        }

        return $manufacturer_store_data;
    }
    
    public function getManufacturerLayouts($manufacturer_id)
    {
        $manufacturer_layout_data = array();

        $query = $this->db->query("
            SELECT * 
            FROM manufacturer_to_layout 
            WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");

        foreach ($query->rows as $result) {
            $manufacturer_layout_data[$result['store_id']] = $result['layout_id'];
        }

        return $manufacturer_layout_data;
    }

    public function getTotalManufacturerByLayoutId($layout_id)
    {
        $query = $this->db->query("
            SELECT COUNT(*) AS total 
            FROM manufacturer_to_layout 
            WHERE layout_id = '" . (int)$layout_id . "'
        ");

        return $query->row['total'];
    }

    public function getTotalManufacturers()
    {
        $query = $this->db->query("
            SELECT COUNT(*) AS total 
            FROM manufacturer
        ");

        return $query->row['total'];
    }
    
    public function getManufacturerDescriptions($manufacturer_id)
    {
        $manufacturer_description_data = array();
        $query = $this->db->query("
            SELECT * 
            FROM manufacturer_description 
            WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");
        foreach ($query->rows as $result) {
            $manufacturer_description_data[$result['language_id']] = array(
                'meta_title'       => $result['meta_title'],
                'meta_h1'      	   => $result['meta_h1'],
                'meta_description' => $result['meta_description'],
                'description'      => $result['description'],
                'description_bottom'      => $result['description_bottom']
            );
        }
        return $manufacturer_description_data;
    }
    
    public function getProductRelated($manufacturer_id)
    {
        $product_related_data = array();
        
        $query = $this->db->query("
            SELECT * 
            FROM product_related_mn 
            WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");
        
        foreach ($query->rows as $result) {
            $product_related_data[] = $result['product_id'];
        }
        
        return $product_related_data;
    }
    
    public function getArticleRelated($manufacturer_id)
    {
        $article_related_data = array();
        
        $query = $this->db->query("
            SELECT * 
            FROM article_related_mn 
            WHERE manufacturer_id = '" . (int)$manufacturer_id . "'
        ");
        
        foreach ($query->rows as $result) {
            $article_related_data[] = $result['article_id'];
        }
        
        return $article_related_data;
    }
}
