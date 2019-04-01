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

class ModelBlogCategory extends Model
{
    public function getCategory($blog_category_id)
    {
        return $this->getCategories((int)$blog_category_id, 'by_id');
    }

    public function getCategories($id = 0, $type = 'by_parent')
    {
        static $data = null;

        if ($data === null) {
            $data = array();

            $query = $this->db->query(
                "
				SELECT * 
				FROM blog_category c 
				LEFT JOIN blog_category_description cd ON (c.blog_category_id = cd.blog_category_id) 
				LEFT JOIN blog_category_to_store c2s ON (c.blog_category_id = c2s.blog_category_id) 
				WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
				    AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
				    AND c.status = '1' 
				ORDER BY c.parent_id, c.sort_order, cd.name"
            );

            foreach ($query->rows as $row) {
                $data['by_id'][$row['blog_category_id']] = $row;
                $data['by_parent'][$row['parent_id']][] = $row;
            }
        }

        return ((isset($data[$type]) && isset($data[$type][$id])) ? $data[$type][$id] : array());
    }

    public function getCategoriesByParentId($blog_category_id)
    {
        $category_data = array();

        $categories = $this->getCategories((int)$blog_category_id);

        foreach ($categories as $category) {
            $category_data[] = $category['blog_category_id'];

            $children = $this->getCategoriesByParentId($category['blog_category_id']);

            if ($children) {
                $category_data = array_merge($children, $category_data);
            }
        }

        return $category_data;
    }

    public function getCategoryLayoutId($blog_category_id)
    {
        $query = $this->db->query("
			SELECT * 
			FROM blog_category_to_layout 
			WHERE blog_category_id = '" . (int)$blog_category_id . "' 
			    AND store_id = '" . (int)$this->config->get('config_store_id') . "'
		");

        if ($query->num_rows) {
            return $query->row['layout_id'];
        } else {
            return $this->config->get('config_layout_category');
        }
    }

    public function getTotalCategoriesByCategoryId($parent_id = 0)
    {
        return count($this->getCategories((int)$parent_id));
    }
}
