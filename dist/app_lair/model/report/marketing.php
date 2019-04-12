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

class ModelReportMarketing extends Model
{
    public function getMarketing($data = array())
    {
        $sql = "
			SELECT m.marketing_id, 
				m.name AS campaign, 
				m.code, 
				m.clicks AS clicks, 
				(
					SELECT COUNT(DISTINCT order_id) 
					FROM `order` o1 
					WHERE o1.marketing_id = m.marketing_id
		";

        if (!empty($data['filter_order_status_id'])) {
            $sql .= " AND o1.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
        } else {
            $sql .= " AND o1.order_status_id > '0'";
        }

        if (!empty($data['filter_date_start'])) {
            $sql .= " AND DATE(o1.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " AND DATE(o1.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
        }

        $sql .= ") AS `orders`, (SELECT SUM(total) FROM `order` o2 WHERE o2.marketing_id = m.marketing_id";

        if (!empty($data['filter_order_status_id'])) {
            $sql .= " AND o2.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
        } else {
            $sql .= " AND o2.order_status_id > '0'";
        }

        if (!empty($data['filter_date_start'])) {
            $sql .= " AND DATE(o2.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " AND DATE(o2.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
        }

        $sql .= " 
			GROUP BY o2.marketing_id) AS `total` 
			FROM `marketing` m ORDER BY m.date_added ASC
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

    public function getTotalMarketing($data = array())
    {
        $query = $this->db->query("
			SELECT COUNT(*) AS total 
			FROM `marketing`
		");

        return $query->row['total'];
    }
}
