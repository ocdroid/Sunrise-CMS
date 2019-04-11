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

class ModelCatalogReview extends Model
{
    public function addReview($data)
    {
        $this->db->query("
            INSERT INTO review 
            SET author = '" . $this->db->escape($data['author']) . "', 
                product_id = '" . (int)$data['product_id'] . "', 
                text = '" . $this->db->escape(strip_tags($data['text'])) . "', 
                rating = '" . (int)$data['rating'] . "', 
                status = '" . (int)$data['status'] . "', 
                date_added = '" . $this->db->escape($data['date_added']) . "'
        ");

        $review_id = $this->db->getLastId();

        $this->cache->delete('product');

        return $review_id;
    }

    public function editReview($review_id, $data)
    {
        $this->db->query("
            UPDATE review 
            SET author = '" . $this->db->escape($data['author']) . "', 
                product_id = '" . (int)$data['product_id'] . "', 
                text = '" . $this->db->escape(strip_tags($data['text'])) . "', 
                rating = '" . (int)$data['rating'] . "', 
                status = '" . (int)$data['status'] . "', 
                date_added = '" . $this->db->escape($data['date_added']) . "', 
                date_modified = NOW() 
            WHERE review_id = '" . (int)$review_id . "'
        ");

        $this->cache->delete('product');
    }

    public function deleteReview($review_id)
    {
        $this->db->query("
            DELETE 
			FROM review 
            WHERE review_id = '" . (int)$review_id . "'
        ");

        $this->cache->delete('product');
    }

    public function getReview($review_id)
    {
        $query = $this->db->query("
            SELECT DISTINCT *, 
                (
                    SELECT pd.name 
                    FROM product_description pd 
                    WHERE pd.product_id = r.product_id 
                        AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS product 
            FROM review r 
            WHERE r.review_id = '" . (int)$review_id . "'
        ");

        return $query->row;
    }

    public function getReviews($data = array())
    {
        $sql = "
            SELECT r.review_id, 
                pd.name, 
                r.author, 
                r.rating, 
                r.status, 
                r.date_added 
            FROM review r 
            LEFT JOIN product_description pd ON (r.product_id = pd.product_id) 
            WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
        ";

        if (!empty($data['filter_product'])) {
            $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_product']) . "%'";
        }

        if (!empty($data['filter_author'])) {
            $sql .= " AND r.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
        }

        if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
            $sql .= " AND r.status = '" . (int)$data['filter_status'] . "'";
        }

        if (!empty($data['filter_date_added'])) {
            $sql .= " AND DATE(r.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
        }

        $sort_data = array(
            'pd.name',
            'r.author',
            'r.rating',
            'r.status',
            'r.date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY r.date_added";
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

    public function getTotalReviews($data = array())
    {
        $sql = "
            SELECT COUNT(*) AS total 
            FROM review r 
            LEFT JOIN product_description pd ON (r.product_id = pd.product_id) 
            WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
        ";

        if (!empty($data['filter_product'])) {
            $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_product']) . "%'";
        }

        if (!empty($data['filter_author'])) {
            $sql .= " AND r.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
        }

        if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
            $sql .= " AND r.status = '" . (int)$data['filter_status'] . "'";
        }

        if (!empty($data['filter_date_added'])) {
            $sql .= " AND DATE(r.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getTotalReviewsAwaitingApproval()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM review WHERE status = '0'");

        return $query->row['total'];
    }
}
