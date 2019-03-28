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

class ControllerStartupSession extends Controller
{
    public function index()
    {
        if (isset($this->request->get['token']) && isset($this->request->get['route']) && substr($this->request->get['route'], 0, 4) == 'api/') {
            $this->db->query("DELETE FROM `" . DB_PREFIX . "api_session` WHERE TIMESTAMPADD(HOUR, 1, date_modified) < NOW()");
        
            $query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "api` `a` LEFT JOIN `" . DB_PREFIX . "api_session` `as` ON (a.api_id = as.api_id) LEFT JOIN " . DB_PREFIX . "api_ip `ai` ON (as.api_id = ai.api_id) WHERE a.status = '1' AND as.token = '" . $this->db->escape($this->request->get['token']) . "' AND ai.ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'");
        
            if ($query->num_rows) {
                $this->session->start('api', $query->row['session_id']);
                
                // keep the session alive
                $this->db->query("UPDATE `" . DB_PREFIX . "api_session` SET date_modified = NOW() WHERE api_session_id = '" . (int)$query->row['api_session_id'] . "'");
            }
        } else {
            $this->session->start();
        }
    }
}
