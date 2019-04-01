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

class ModelCatalogCategory extends Model
{
    public function addCategory($data)
    {
        $this->db->query("INSERT INTO category SET parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', noindex = '" . (int)$data['noindex'] . "', date_modified = NOW(), date_added = NOW()");

        $category_id = $this->db->getLastId();

        if (isset($data['image'])) {
            $this->db->query("UPDATE category SET image = '" . $this->db->escape($data['image']) . "' WHERE category_id = '" . (int)$category_id . "'");
        }

        foreach ($data['category_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO category_description SET category_id = '" . (int)$category_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', description_bottom = '" . $this->db->escape($value['description_bottom']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_h1 = '" . $this->db->escape($value['meta_h1']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "'");
        }

        // MySQL Hierarchical Data Closure Table Pattern
        $level = 0;

        $query = $this->db->query("SELECT * FROM `category_path` WHERE category_id = '" . (int)$data['parent_id'] . "' ORDER BY `level` ASC");

        foreach ($query->rows as $result) {
            $this->db->query("INSERT INTO `category_path` SET `category_id` = '" . (int)$category_id . "', `path_id` = '" . (int)$result['path_id'] . "', `level` = '" . (int)$level . "'");

            $level++;
        }

        $this->db->query("INSERT INTO `category_path` SET `category_id` = '" . (int)$category_id . "', `path_id` = '" . (int)$category_id . "', `level` = '" . (int)$level . "'");

        if (isset($data['category_filter'])) {
            foreach ($data['category_filter'] as $filter_id) {
                $this->db->query("INSERT INTO category_filter SET category_id = '" . (int)$category_id . "', filter_id = '" . (int)$filter_id . "'");
            }
        }

        if (isset($data['category_store'])) {
            foreach ($data['category_store'] as $store_id) {
                $this->db->query("INSERT INTO category_to_store SET category_id = '" . (int)$category_id . "', store_id = '" . (int)$store_id . "'");
            }
        }
        
        if (isset($data['product_related'])) {
            foreach ($data['product_related'] as $related_id) {
                $this->db->query("INSERT INTO product_related_wb SET category_id = '" . (int)$category_id . "', product_id = '" . (int)$related_id . "'");
            }
        }
    
        if (isset($data['article_related'])) {
            foreach ($data['article_related'] as $related_id) {
                $this->db->query("INSERT INTO article_related_wb SET category_id = '" . (int)$category_id . "', article_id = '" . (int)$related_id . "'");
            }
        }

        // Set which layout to use with this category
        if (isset($data['category_layout'])) {
            foreach ($data['category_layout'] as $store_id => $layout_id) {
                $this->db->query("INSERT INTO category_to_layout SET category_id = '" . (int)$category_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
            }
        }
        
        $this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');

        if (isset($data['keyword'])) {
            $this->db->query("INSERT INTO url_alias SET query = 'category_id=" . (int)$category_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }

        $this->cache->delete('category');

        return $category_id;
    }

    public function editCategory($category_id, $data)
    {
        $this->db->query("UPDATE category SET parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', noindex = '" . (int)$data['noindex'] . "', date_modified = NOW() WHERE category_id = '" . (int)$category_id . "'");
        
        if (isset($data['image'])) {
            $this->db->query("UPDATE category SET image = '" . $this->db->escape($data['image']) . "' WHERE category_id = '" . (int)$category_id . "'");
        }

        $this->db->query("DELETE FROM category_description WHERE category_id = '" . (int)$category_id . "'");

        foreach ($data['category_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO category_description SET category_id = '" . (int)$category_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', description_bottom = '" . $this->db->escape($value['description_bottom']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_h1 = '" . $this->db->escape($value['meta_h1']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "'");
        }

        // MySQL Hierarchical Data Closure Table Pattern
        $query = $this->db->query("SELECT * FROM `category_path` WHERE path_id = '" . (int)$category_id . "' ORDER BY level ASC");

        if ($query->rows) {
            foreach ($query->rows as $category_path) {
                // Delete the path below the current one
                $this->db->query("DELETE FROM `category_path` WHERE category_id = '" . (int)$category_path['category_id'] . "' AND level < '" . (int)$category_path['level'] . "'");

                $path = array();

                // Get the nodes new parents
                $query = $this->db->query("SELECT * FROM `category_path` WHERE category_id = '" . (int)$data['parent_id'] . "' ORDER BY level ASC");

                foreach ($query->rows as $result) {
                    $path[] = $result['path_id'];
                }

                // Get whats left of the nodes current path
                $query = $this->db->query("SELECT * FROM `category_path` WHERE category_id = '" . (int)$category_path['category_id'] . "' ORDER BY level ASC");

                foreach ($query->rows as $result) {
                    $path[] = $result['path_id'];
                }

                // Combine the paths with a new level
                $level = 0;

                foreach ($path as $path_id) {
                    $this->db->query("REPLACE INTO `category_path` SET category_id = '" . (int)$category_path['category_id'] . "', `path_id` = '" . (int)$path_id . "', level = '" . (int)$level . "'");

                    $level++;
                }
            }
        } else {
            // Delete the path below the current one
            $this->db->query("DELETE FROM `category_path` WHERE category_id = '" . (int)$category_id . "'");

            // Fix for records with no paths
            $level = 0;

            $query = $this->db->query("SELECT * FROM `category_path` WHERE category_id = '" . (int)$data['parent_id'] . "' ORDER BY level ASC");

            foreach ($query->rows as $result) {
                $this->db->query("INSERT INTO `category_path` SET category_id = '" . (int)$category_id . "', `path_id` = '" . (int)$result['path_id'] . "', level = '" . (int)$level . "'");

                $level++;
            }

            $this->db->query("REPLACE INTO `category_path` SET category_id = '" . (int)$category_id . "', `path_id` = '" . (int)$category_id . "', level = '" . (int)$level . "'");
        }

        $this->db->query("DELETE FROM category_filter WHERE category_id = '" . (int)$category_id . "'");

        if (isset($data['category_filter'])) {
            foreach ($data['category_filter'] as $filter_id) {
                $this->db->query("INSERT INTO category_filter SET category_id = '" . (int)$category_id . "', filter_id = '" . (int)$filter_id . "'");
            }
        }

        $this->db->query("DELETE FROM category_to_store WHERE category_id = '" . (int)$category_id . "'");

        if (isset($data['category_store'])) {
            foreach ($data['category_store'] as $store_id) {
                $this->db->query("INSERT INTO category_to_store SET category_id = '" . (int)$category_id . "', store_id = '" . (int)$store_id . "'");
            }
        }
        
        $this->db->query("DELETE FROM product_related_wb WHERE category_id = '" . (int)$category_id . "'");
    
        if (isset($data['product_related'])) {
            foreach ($data['product_related'] as $related_id) {
                $this->db->query("DELETE FROM product_related_wb WHERE category_id = '" . (int)$category_id . "' AND product_id = '" . (int)$related_id . "'");
                $this->db->query("INSERT INTO product_related_wb SET category_id = '" . (int)$category_id . "', product_id = '" . (int)$related_id . "'");
            }
        }
        
        $this->db->query("DELETE FROM article_related_wb WHERE category_id = '" . (int)$category_id . "'");
    
        if (isset($data['article_related'])) {
            foreach ($data['article_related'] as $related_id) {
                $this->db->query("DELETE FROM article_related_wb WHERE category_id = '" . (int)$category_id . "' AND article_id = '" . (int)$related_id . "'");
                $this->db->query("INSERT INTO article_related_wb SET category_id = '" . (int)$category_id . "', article_id = '" . (int)$related_id . "'");
            }
        }

        $this->db->query("DELETE FROM category_to_layout WHERE category_id = '" . (int)$category_id . "'");

        if (isset($data['category_layout'])) {
            foreach ($data['category_layout'] as $store_id => $layout_id) {
                $this->db->query("INSERT INTO category_to_layout SET category_id = '" . (int)$category_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
            }
        }

        $this->db->query("DELETE FROM url_alias WHERE query = 'category_id=" . (int)$category_id . "'");
        
        $this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');

        if ($data['keyword']) {
            $this->db->query("INSERT INTO url_alias SET query = 'category_id=" . (int)$category_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }

        $this->cache->delete('category');
    }
    
    public function editCategoryStatus($category_id, $status)
    {
        $this->db->query("UPDATE category SET status = '" . (int)$status . "', date_modified = NOW() WHERE category_id = '" . (int)$category_id . "'");
        
        $this->cache->delete('category');
    }

    public function deleteCategory($category_id)
    {
        $this->db->query("DELETE FROM category_path WHERE category_id = '" . (int)$category_id . "'");

        $query = $this->db->query("SELECT * FROM category_path WHERE path_id = '" . (int)$category_id . "'");

        foreach ($query->rows as $result) {
            $this->deleteCategory($result['category_id']);
        }

        $this->db->query("DELETE FROM category WHERE category_id = '" . (int)$category_id . "'");
        $this->db->query("DELETE FROM category_description WHERE category_id = '" . (int)$category_id . "'");
        $this->db->query("DELETE FROM category_filter WHERE category_id = '" . (int)$category_id . "'");
        $this->db->query("DELETE FROM category_to_store WHERE category_id = '" . (int)$category_id . "'");
        $this->db->query("DELETE FROM category_to_layout WHERE category_id = '" . (int)$category_id . "'");
        $this->db->query("DELETE FROM product_to_category WHERE category_id = '" . (int)$category_id . "'");
        $this->db->query("DELETE FROM url_alias WHERE query = 'category_id=" . (int)$category_id . "'");
        $this->db->query("DELETE FROM product_related_wb WHERE category_id = '" . (int)$category_id . "'");
        $this->db->query("DELETE FROM article_related_wb WHERE category_id = '" . (int)$category_id . "'");

        $this->cache->delete('category');
    }

    public function repairCategories($parent_id = 0)
    {
        $query = $this->db->query("SELECT * FROM category WHERE parent_id = '" . (int)$parent_id . "'");

        foreach ($query->rows as $category) {
            // Delete the path below the current one
            $this->db->query("DELETE FROM `category_path` WHERE category_id = '" . (int)$category['category_id'] . "'");

            // Fix for records with no paths
            $level = 0;

            $query = $this->db->query("SELECT * FROM `category_path` WHERE category_id = '" . (int)$parent_id . "' ORDER BY level ASC");

            foreach ($query->rows as $result) {
                $this->db->query("INSERT INTO `category_path` SET category_id = '" . (int)$category['category_id'] . "', `path_id` = '" . (int)$result['path_id'] . "', level = '" . (int)$level . "'");

                $level++;
            }

            $this->db->query("REPLACE INTO `category_path` SET category_id = '" . (int)$category['category_id'] . "', `path_id` = '" . (int)$category['category_id'] . "', level = '" . (int)$level . "'");

            $this->repairCategories($category['category_id']);
        }
    }

    public function getCategory($category_id)
    {
        $query = $this->db->query("SELECT DISTINCT *, (SELECT GROUP_CONCAT(cd1.name ORDER BY level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') FROM category_path cp LEFT JOIN category_description cd1 ON (cp.path_id = cd1.category_id AND cp.category_id != cp.path_id) WHERE cp.category_id = c.category_id AND cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY cp.category_id) AS path, (SELECT DISTINCT keyword FROM url_alias WHERE query = 'category_id=" . (int)$category_id . "') AS keyword FROM category c LEFT JOIN category_description cd2 ON (c.category_id = cd2.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'");

        return $query->row;
    }

    public function getCategories($data = array())
    {
        $sql = "SELECT cp.category_id AS category_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') AS name, c1.parent_id, c1.sort_order, c1.noindex FROM category_path cp LEFT JOIN category c1 ON (cp.category_id = c1.category_id) LEFT JOIN category c2 ON (cp.path_id = c2.category_id) LEFT JOIN category_description cd1 ON (cp.path_id = cd1.category_id) LEFT JOIN category_description cd2 ON (cp.category_id = cd2.category_id) WHERE cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND cd2.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }

        $sql .= " GROUP BY cp.category_id";

        $sort_data = array(
            'name',
            'sort_order',
            'noindex'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY sort_order";
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

    public function getCategoryDescriptions($category_id)
    {
        $category_description_data = array();

        $query = $this->db->query("SELECT * FROM category_description WHERE category_id = '" . (int)$category_id . "'");

        foreach ($query->rows as $result) {
            $category_description_data[$result['language_id']] = array(
                'name'             => $result['name'],
                'meta_title'       => $result['meta_title'],
                'meta_h1'      	   => $result['meta_h1'],
                'meta_description' => $result['meta_description'],
                'description'      => $result['description'],
                'description_bottom'      => $result['description_bottom']
            );
        }

        return $category_description_data;
    }
    
    public function getCategoryPath($category_id)
    {
        $query = $this->db->query("SELECT category_id, path_id, level FROM category_path WHERE category_id = '" . (int)$category_id . "'");

        return $query->rows;
    }
    
    public function getCategoryFilters($category_id)
    {
        $category_filter_data = array();

        $query = $this->db->query("SELECT * FROM category_filter WHERE category_id = '" . (int)$category_id . "'");

        foreach ($query->rows as $result) {
            $category_filter_data[] = $result['filter_id'];
        }

        return $category_filter_data;
    }

    public function getCategoryStores($category_id)
    {
        $category_store_data = array();

        $query = $this->db->query("SELECT * FROM category_to_store WHERE category_id = '" . (int)$category_id . "'");

        foreach ($query->rows as $result) {
            $category_store_data[] = $result['store_id'];
        }

        return $category_store_data;
    }
    
    public function getCategoryRelated($category_id)
    {
        $category_related_data = array();
        
        $query = $this->db->query("SELECT * FROM product_related_wb WHERE product_id = '" . (int)$product_id . "'");
        
        foreach ($query->rows as $result) {
            $product_related_data[] = $result['related_id'];
        }
        
        return $product_related_data;
    }
    
    public function getCategoryRelated_article($category_id)
    {
        $category_related_data = array();
        
        $query = $this->db->query("SELECT * FROM article_related_wb WHERE article_id = '" . (int)$article_id . "'");
        
        foreach ($query->rows as $result) {
            $article_related_data[] = $result['related_id'];
        }
        
        return $article_related_data;
    }

    public function getCategoryLayouts($category_id)
    {
        $category_layout_data = array();

        $query = $this->db->query("SELECT * FROM category_to_layout WHERE category_id = '" . (int)$category_id . "'");

        foreach ($query->rows as $result) {
            $category_layout_data[$result['store_id']] = $result['layout_id'];
        }

        return $category_layout_data;
    }

    public function getTotalCategories()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM category");

        return $query->row['total'];
    }
    
    public function getTotalCategoriesByLayoutId($layout_id)
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM category_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

        return $query->row['total'];
    }
    
    public function getCategoriesByParentId($parent_id = 0)
    {
        $query = $this->db->query("SELECT *, (SELECT COUNT(parent_id) FROM category WHERE parent_id = c.category_id) AS children FROM category c LEFT JOIN category_description cd ON (c.category_id = cd.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name");
        return $query->rows;
    }

    public function getAllCategories()
    {
        $category_data = $this->cache->get('category.all.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
        if (!$category_data || !is_array($category_data)) {
            $query = $this->db->query("SELECT * FROM category c LEFT JOIN category_description cd ON (c.category_id = cd.category_id) LEFT JOIN category_to_store c2s ON (c.category_id = c2s.category_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY c.parent_id, c.sort_order, cd.name");
            $category_data = array();
        
            foreach ($query->rows as $row) {
                $category_data[$row['parent_id']][$row['category_id']] = $row;
            }
            $this->cache->set('category.all.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $category_data);
        }
        
        return $category_data;
    }
    
    public function getProductRelated($category_id)
    {
        $product_related_data = array();
        
        $query = $this->db->query("SELECT * FROM product_related_wb WHERE category_id = '" . (int)$category_id . "'");
        
        foreach ($query->rows as $result) {
            $product_related_data[] = $result['product_id'];
        }
        
        return $product_related_data;
    }
    
    public function getArticleRelated($category_id)
    {
        $article_related_data = array();
        
        $query = $this->db->query("SELECT * FROM article_related_wb WHERE category_id = '" . (int)$category_id . "'");
        
        foreach ($query->rows as $result) {
            $article_related_data[] = $result['article_id'];
        }
        
        return $article_related_data;
    }
    
    public function getCategoriesChildren($parent_id = 0)
    {
        $query = $this->db->query("SELECT * FROM category_path WHERE path_id = '" . (int)$parent_id . "'");
        return $query->rows;
    }
}
