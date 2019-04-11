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

class ModelReportCustomer extends Model
{
    public function getOrders($data = array())
    {
        $sql = "
			SELECT c.customer_id, 
				CONCAT(c.firstname, ' ', c.lastname) AS customer, 
				c.email, 
				cgd.name AS customer_group, 
				c.status, 
				o.order_id, 
				SUM(op.quantity) as products, 
				SUM(o.total) AS total 
			FROM `order` o 
			LEFT JOIN `order_product` op ON (o.order_id = op.order_id) 
			LEFT JOIN `customer` c ON (o.customer_id = c.customer_id) 
			LEFT JOIN `customer_group_description` cgd ON (c.customer_group_id = cgd.customer_group_id) 
			WHERE o.customer_id > 0 
				AND cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'
		";

        if (!empty($data['filter_date_start'])) {
            $sql .= " 
				AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'
			";
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " 
				AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'
			";
        }

        if (!empty($data['filter_customer'])) {
            $sql .= " 
				AND CONCAT(c.firstname, ' ', c.lastname) LIKE '" . $this->db->escape($data['filter_customer']) . "'
			";
        }

        if (!empty($data['filter_order_status_id'])) {
            $sql .= " 
				AND o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'
			";
        } else {
            $sql .= " 
				AND o.order_status_id > '0'
			";
        }

        $sql .= " GROUP BY o.order_id";

        $sql = "
			SELECT t.customer_id, 
				t.customer, 
				t.email, 
				t.customer_group, 
				t.status, 
				COUNT(DISTINCT t.order_id) AS orders, 
				SUM(t.products) AS products, 
				SUM(t.total) AS total 
			FROM (" . $sql . ") AS t 
			GROUP BY t.customer_id 
			ORDER BY total DESC
		";

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

    public function getTotalOrders($data = array())
    {
        $sql = "
			SELECT COUNT(DISTINCT o.customer_id) AS total 
			FROM `order` o 
			LEFT JOIN `customer` c ON (o.customer_id = c.customer_id) 
			WHERE o.customer_id > '0'
		";

        if (!empty($data['filter_date_start'])) {
            $sql .= " 
				AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'
			";
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " 
				AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'
			";
        }

        if (!empty($data['filter_customer'])) {
            $sql .= " 
				AND CONCAT(c.firstname, ' ', c.lastname) LIKE '" . $this->db->escape($data['filter_customer']) . "'
			";
        }

        if (!empty($data['filter_order_status_id'])) {
            $sql .= " 
				AND o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'
			";
        } else {
            $sql .= " 
				AND o.order_status_id > '0'
			";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getRewardPoints($data = array())
    {
        $sql = "
			SELECT cr.customer_id, 
				CONCAT(c.firstname, ' ', c.lastname) AS customer, 
				c.email, 
				cgd.name AS customer_group, 
				c.status, 
				SUM(cr.points) AS points, 
				COUNT(o.order_id) AS orders, 
				SUM(o.total) AS total 
			FROM customer_reward cr 
			LEFT JOIN `customer` c ON (cr.customer_id = c.customer_id) 
			LEFT JOIN customer_group_description cgd ON (c.customer_group_id = cgd.customer_group_id) 
			LEFT JOIN `order` o ON (cr.order_id = o.order_id) 
			WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'
		";

        if (!empty($data['filter_date_start'])) {
            $sql .= " 
				AND DATE(cr.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'
			";
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " 
				AND DATE(cr.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'
			";
        }

        if (!empty($data['filter_customer'])) {
            $sql .= " 
				AND CONCAT(c.firstname, ' ', c.lastname) LIKE '" . $this->db->escape($data['filter_customer']) . "'
			";
        }

        $sql .= " 
			GROUP BY cr.customer_id 
			ORDER BY points DESC
		";

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

    public function getTotalRewardPoints($data = array())
    {
        $sql = "
			SELECT COUNT(DISTINCT cr.customer_id) AS total 
			FROM `customer_reward` cr 
			LEFT JOIN `customer` c ON (cr.customer_id = c.customer_id)
		";

        $implode = array();

        if (!empty($data['filter_date_start'])) {
            $implode[] = "DATE(cr.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
        }

        if (!empty($data['filter_date_end'])) {
            $implode[] = "DATE(cr.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
        }

        if (!empty($data['filter_customer'])) {
            $implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE '" . $this->db->escape($data['filter_customer']) . "'";
        }

        if ($implode) {
            $sql .= " WHERE " . implode(" AND ", $implode);
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }
}
