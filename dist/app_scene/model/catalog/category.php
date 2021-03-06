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
    public function getCategory($category_id)
    {
        $query = $this->db->query("
			SELECT DISTINCT *
			FROM category c
			LEFT JOIN category_description cd ON (c.category_id = cd.category_id)
			LEFT JOIN category_to_store c2s ON (c.category_id = c2s.category_id)
			WHERE c.category_id = '" . (int)$category_id . "'
				AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "'
				AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'
				AND c.status = '1'
		");

        return $query->row;
    }

    public function getCategories($parent_id = 0)
    {
        $query = $this->db->query("
			SELECT *
			FROM category c
			LEFT JOIN category_description cd ON (c.category_id = cd.category_id)
			LEFT JOIN category_to_store c2s ON (c.category_id = c2s.category_id)
			WHERE c.parent_id = '" . (int)$parent_id . "'
				AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "'
				AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'
				AND c.status = '1'
			ORDER BY c.sort_order, 
				LCASE(cd.name)
		");

        return $query->rows;
    }

    public function getCategoryFilters($category_id)
    {
        $implode = array();

        $query = $this->db->query("
			SELECT filter_id
			FROM category_filter
			WHERE category_id = '" . (int)$category_id . "'
		");

        foreach ($query->rows as $result) {
            $implode[] = (int)$result['filter_id'];
        }

        $filter_group_data = array();

        if ($implode) {
            $filter_group_query = $this->db->query("
				SELECT DISTINCT f.filter_group_id,
								fgd.name,
								fg.sort_order
				FROM filter f
				LEFT JOIN filter_group fg ON (f.filter_group_id = fg.filter_group_id)
				LEFT JOIN filter_group_description fgd ON (fg.filter_group_id = fgd.filter_group_id)
				WHERE f.filter_id IN (" . implode(',', $implode) . ")
				    AND fgd.language_id = '" . (int)$this->config->get('config_language_id') . "'
				GROUP BY f.filter_group_id
				ORDER BY fg.sort_order,
				LCASE(fgd.name)
			");

            foreach ($filter_group_query->rows as $filter_group) {
                $filter_data = array();

                $filter_query = $this->db->query("
					SELECT DISTINCT f.filter_id,
									fd.name
					FROM filter f
					LEFT JOIN filter_description fd ON (f.filter_id = fd.filter_id)
					WHERE f.filter_id IN (" . implode(',', $implode) . ")
						AND f.filter_group_id = '" . (int)$filter_group['filter_group_id'] . "'
						AND fd.language_id = '" . (int)$this->config->get('config_language_id') . "'
					ORDER BY f.sort_order,
					LCASE(fd.name)
				");

                foreach ($filter_query->rows as $filter) {
                    $filter_data[] = array(
                        'filter_id' => $filter['filter_id'],
                        'name'      => $filter['name']
                    );
                }

                if ($filter_data) {
                    $filter_group_data[] = array(
                        'filter_group_id' => $filter_group['filter_group_id'],
                        'name'            => $filter_group['name'],
                        'filter'          => $filter_data
                    );
                }
            }
        }

        return $filter_group_data;
    }

    public function getCategoryLayoutId($category_id)
    {
        $query = $this->db->query("
			SELECT *
			FROM category_to_layout
			WHERE category_id = '" . (int)$category_id . "'
				AND store_id = '" . (int)$this->config->get('config_store_id') . "'
		");

        if ($query->num_rows) {
            return $query->row['layout_id'];
        } else {
            return 0;
        }
    }

    public function getTotalCategoriesByCategoryId($parent_id = 0)
    {
        $query = $this->db->query("
			SELECT COUNT(*) AS total
			FROM category c
			LEFT JOIN category_to_store c2s ON (c.category_id = c2s.category_id)
			WHERE c.parent_id = '" . (int)$parent_id . "'
				AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'
				AND c.status = '1'
		");

        return $query->row['total'];
    }
}
