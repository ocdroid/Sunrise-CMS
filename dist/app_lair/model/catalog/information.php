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

class ModelCatalogInformation extends Model
{
    public function addInformation($data)
    {
        $this->db->query("
            INSERT INTO information 
            SET sort_order = '" . (int)$data['sort_order'] . "', 
                bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', 
                status = '" . (int)$data['status'] . "', 
                noindex = '" . (int)$data['noindex'] . "'
        ");

        $information_id = $this->db->getLastId();

        foreach ($data['information_description'] as $language_id => $value) {
            $this->db->query("
                INSERT INTO information_description 
                SET information_id = '" . (int)$information_id . "', 
                    language_id = '" . (int)$language_id . "', 
                    title = '" . $this->db->escape($value['title']) . "', 
                    description = '" . $this->db->escape($value['description']) . "', 
                    meta_title = '" . $this->db->escape($value['meta_title']) . "', 
                    meta_h1 = '" . $this->db->escape($value['meta_h1']) . "', 
                    meta_description = '" . $this->db->escape($value['meta_description']) . "'
            ");
        }

        if (isset($data['information_store'])) {
            foreach ($data['information_store'] as $store_id) {
                $this->db->query("
                    INSERT INTO information_to_store 
                        SET information_id = '" . (int)$information_id . "', 
                        store_id = '" . (int)$store_id . "'
                ");
            }
        }

        if (isset($data['information_layout'])) {
            foreach ($data['information_layout'] as $store_id => $layout_id) {
                $this->db->query("
                    INSERT INTO information_to_layout 
                    SET information_id = '" . (int)$information_id . "', 
                        store_id = '" . (int)$store_id . "', 
                        layout_id = '" . (int)$layout_id . "'
                ");
            }
        }

        $this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');

        if (isset($data['keyword'])) {
            $this->db->query("
                INSERT INTO url_alias 
                SET query = 'information_id=" . (int)$information_id . "', 
                    keyword = '" . $this->db->escape($data['keyword']) . "'
            ");
        }

        $this->cache->delete('information');

        return $information_id;
    }

    public function editInformation($information_id, $data)
    {
        $this->db->query("
            UPDATE information 
            SET sort_order = '" . (int)$data['sort_order'] . "', 
                bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', 
                status = '" . (int)$data['status'] . "', 
                noindex = '" . (int)$data['noindex'] . "' 
                WHERE information_id = '" . (int)$information_id . "'
        ");

        $this->db->query("
            DELETE 
			FROM information_description 
            WHERE information_id = '" . (int)$information_id . "'
        ");

        foreach ($data['information_description'] as $language_id => $value) {
            $this->db->query("
                INSERT INTO information_description 
                SET information_id = '" . (int)$information_id . "', 
                    language_id = '" . (int)$language_id . "', 
                    title = '" . $this->db->escape($value['title']) . "', 
                    description = '" . $this->db->escape($value['description']) . "', 
                    meta_title = '" . $this->db->escape($value['meta_title']) . "', 
                    meta_h1 = '" . $this->db->escape($value['meta_h1']) . "', 
                    meta_description = '" . $this->db->escape($value['meta_description']) . "'
            ");
        }

        $this->db->query("
            DELETE 
			FROM information_to_store 
            WHERE information_id = '" . (int)$information_id . "'
        ");

        if (isset($data['information_store'])) {
            foreach ($data['information_store'] as $store_id) {
                $this->db->query("
                    INSERT INTO information_to_store 
                    SET information_id = '" . (int)$information_id . "', 
                        store_id = '" . (int)$store_id . "'
                ");
            }
        }

        $this->db->query("
            DELETE 
			FROM information_to_layout 
            WHERE information_id = '" . (int)$information_id . "'
        ");

        if (isset($data['information_layout'])) {
            foreach ($data['information_layout'] as $store_id => $layout_id) {
                $this->db->query("
                    INSERT INTO information_to_layout 
                    SET information_id = '" . (int)$information_id . "', 
                        store_id = '" . (int)$store_id . "', 
                        layout_id = '" . (int)$layout_id . "'
                ");
            }
        }

        $this->db->query("
            DELETE 
			FROM url_alias 
            WHERE query = 'information_id=" . (int)$information_id . "'
        ");

        $this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');

        if ($data['keyword']) {
            $this->db->query("
                INSERT INTO url_alias 
                SET query = 'information_id=" . (int)$information_id . "', 
                    keyword = '" . $this->db->escape($data['keyword']) . "'
            ");
        }

        $this->cache->delete('information');
    }

    public function editInformationStatus($information_id, $status)
    {
        $this->db->query("
            UPDATE information 
            SET status = '" . (int)$status . "' 
            WHERE information_id = '" . (int)$information_id . "'
        ");

        $this->cache->delete('information');
    }

    public function deleteInformation($information_id)
    {
        $this->db->query("
        	DELETE 
			FROM information 
        	WHERE information_id = '" . (int)$information_id . "'
        ");
        $this->db->query("
        	DELETE 
			FROM information_description 
        	WHERE information_id = '" . (int)$information_id . "'
        ");
        $this->db->query("
        	DELETE 
			FROM information_to_store 
        	WHERE information_id = '" . (int)$information_id . "'
        ");
        $this->db->query("
        	DELETE 
			FROM information_to_layout 
        	WHERE information_id = '" . (int)$information_id . "'
        ");
        $this->db->query("
        	DELETE 
			FROM url_alias 
        	WHERE query = 'information_id=" . (int)$information_id . "'
        ");

        $this->cache->delete('information');
    }

    public function getInformation($information_id)
    {
        $query = $this->db->query("
            SELECT DISTINCT *, 
                (
                    SELECT keyword 
                    FROM url_alias 
                    WHERE query = 'information_id=" . (int)$information_id . "') AS keyword 
            FROM information 
            WHERE information_id = '" . (int)$information_id . "'
        ");

        return $query->row;
    }

    public function getInformations($data = array())
    {
        if ($data) {
            $sql = "
                SELECT * 
                FROM information i 
                LEFT JOIN information_description id ON (i.information_id = id.information_id) 
                WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'
            ";

            if (!empty($data['filter_name'])) {
                $sql .= " AND id.title LIKE '" . $this->db->escape($data['filter_name']) . "%'";
            }

            $sort_data = array(
                'id.title',
                'i.sort_order'
            );

            if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
                $sql .= " ORDER BY " . $data['sort'];
            } else {
                $sql .= " ORDER BY id.title";
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
        } else {
            $information_data = $this->cache->get('information.' . (int)$this->config->get('config_language_id'));

            if (!$information_data) {
                $query = $this->db->query("
                    SELECT * 
                    FROM information i 
                    LEFT JOIN information_description id ON (i.information_id = id.information_id) 
                    WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' 
                    ORDER BY id.title
                ");

                $information_data = $query->rows;

                $this->cache->set('information.' . (int)$this->config->get('config_language_id'), $information_data);
            }

            return $information_data;
        }
    }

    public function getInformationDescriptions($information_id)
    {
        $information_description_data = array();

        $query = $this->db->query("
            SELECT * 
            FROM information_description 
            WHERE information_id = '" . (int)$information_id . "'
        ");

        foreach ($query->rows as $result) {
            $information_description_data[$result['language_id']] = array(
                'title'            => $result['title'],
                'description'      => $result['description'],
                'meta_title'       => $result['meta_title'],
                'meta_h1'	       => $result['meta_h1'],
                'meta_description' => $result['meta_description']
            );
        }

        return $information_description_data;
    }

    public function getInformationStores($information_id)
    {
        $information_store_data = array();

        $query = $this->db->query("
            SELECT * 
            FROM information_to_store 
            WHERE information_id = '" . (int)$information_id . "'
        ");

        foreach ($query->rows as $result) {
            $information_store_data[] = $result['store_id'];
        }

        return $information_store_data;
    }

    public function getInformationLayouts($information_id)
    {
        $information_layout_data = array();

        $query = $this->db->query("
            SELECT * 
            FROM information_to_layout 
            WHERE information_id = '" . (int)$information_id . "'
        ");

        foreach ($query->rows as $result) {
            $information_layout_data[$result['store_id']] = $result['layout_id'];
        }

        return $information_layout_data;
    }

    public function getTotalInformations()
    {
        $query = $this->db->query("
            SELECT COUNT(*) AS total 
            FROM information
        ");

        return $query->row['total'];
    }

    public function getTotalInformationsByLayoutId($layout_id)
    {
        $query = $this->db->query("
            SELECT COUNT(*) AS total 
            FROM information_to_layout 
            WHERE layout_id = '" . (int)$layout_id . "'
        ");

        return $query->row['total'];
    }
}
