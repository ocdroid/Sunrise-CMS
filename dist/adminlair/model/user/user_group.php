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

class ModelUserUserGroup extends Model
{
    public function addUserGroup($data)
    {
        $this->db->query("
			INSERT INTO user_group 
			SET name = '" . $this->db->escape($data['name']) . "', 
				permission = '" . (isset($data['permission']) ? $this->db->escape(json_encode($data['permission'])) : '') . "'
		");
    
        return $this->db->getLastId();
    }

    public function editUserGroup($user_group_id, $data)
    {
        $this->db->query("
			UPDATE user_group 
			SET name = '" . $this->db->escape($data['name']) . "', 
				permission = '" . (isset($data['permission']) ? $this->db->escape(json_encode($data['permission'])) : '') . "' 
			WHERE user_group_id = '" . (int)$user_group_id . "'
		");
    }

    public function deleteUserGroup($user_group_id)
    {
        $this->db->query("
			DELETE FROM user_group 
			WHERE user_group_id = '" . (int)$user_group_id . "'
		");
    }

    public function getUserGroup($user_group_id)
    {
        $query = $this->db->query("
			SELECT DISTINCT * 
			FROM user_group 
			WHERE user_group_id = '" . (int)$user_group_id . "'
		");

        $user_group = array(
            'name'       => $query->row['name'],
            'permission' => json_decode($query->row['permission'], true)
        );

        return $user_group;
    }

    public function getUserGroups($data = array())
    {
        $sql = "
			SELECT * 
			FROM user_group
		";

        $sql .= " ORDER BY name";

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

    public function getTotalUserGroups()
    {
        $query = $this->db->query("
			SELECT COUNT(*) AS total 
			FROM user_group
		");

        return $query->row['total'];
    }

    public function addPermission($user_group_id, $type, $route)
    {
        $user_group_query = $this->db->query("
			SELECT DISTINCT * 
			FROM user_group 
			WHERE user_group_id = '" . (int)$user_group_id . "'
		");

        if ($user_group_query->num_rows) {
            $data = json_decode($user_group_query->row['permission'], true);

            $data[$type][] = $route;

            $this->db->query("
				UPDATE user_group 
				SET permission = '" . $this->db->escape(json_encode($data)) . "' 
				WHERE user_group_id = '" . (int)$user_group_id . "'
			");
        }
    }

    public function removePermission($user_group_id, $type, $route)
    {
        $user_group_query = $this->db->query("
			SELECT DISTINCT * 
			FROM user_group 
			WHERE user_group_id = '" . (int)$user_group_id . "'
		");

        if ($user_group_query->num_rows) {
            $data = json_decode($user_group_query->row['permission'], true);

            $data[$type] = array_diff($data[$type], array($route));

            $this->db->query("
				UPDATE user_group 
				SET permission = '" . $this->db->escape(json_encode($data)) . "' 
				WHERE user_group_id = '" . (int)$user_group_id . "'
			");
        }
    }
}
