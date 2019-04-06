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

namespace DB;
final class MySQLi {
	private $connection;

	public function __construct($hostname, $username, $password, $database, $port = '3306') {
		$this->connection = new \mysqli($hostname, $username, $password, $database, $port);

		if ($this->connection->connect_error) {
			throw new \Exception('Error: ' . $this->connection->error . '<br />Error No: ' . $this->connection->errno);
		}

		$this->connection->set_charset("utf8");
		$this->connection->query("SET SQL_MODE = ''");
	}

	public function query($sql) {
		// debuger
        if (defined("IS_DEBUG") && IS_DEBUG) {
			global $debugModelQueries;

			$startTime = microtime(true);
			// default
			$query = $this->connection->query($sql);
			// 
			$executeTimeQuery = microtime(true) - $startTime;

			$debugBacktrace = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 3);

			$debugModelQueries[] = [
				'class' => (!empty($debugBacktrace[2]['class'])) ? $debugBacktrace[2]['class'] : '',
				'method' => (!empty($debugBacktrace[2]['function'])) ? $debugBacktrace[2]['function'] : '',
				'query' => $sql,
				'time'  => $executeTimeQuery,
				'file' => (!empty($debugBacktrace[2]['file'])) ? $debugBacktrace[2]['file'] : $debugBacktrace[1]['file'],
				'class:method' => (!empty($debugBacktrace[2]['class'])) ? $debugBacktrace[2]['class'] . '->' . $debugBacktrace[2]['function'] : '',
			];
		} else {
			$query = $this->connection->query($sql);
		}
		// 

		if (!$this->connection->errno) {
			if ($query instanceof \mysqli_result) {
				$data = array();

				while ($row = $query->fetch_assoc()) {
					$data[] = $row;
				}

				$result = new \stdClass();
				$result->num_rows = $query->num_rows;
				$result->row = isset($data[0]) ? $data[0] : array();
				$result->rows = $data;

				$query->close();

				return $result;
			} else {
				return true;
			}
		} else {
			throw new \Exception('Error: ' . $this->connection->error  . '<br />Error No: ' . $this->connection->errno . '<br />' . $sql);
		}
	}

	public function escape($value) {
		return $this->connection->real_escape_string($value);
	}
	
	public function countAffected() {
		return $this->connection->affected_rows;
	}

	public function getLastId() {
		return $this->connection->insert_id;
	}
	
	public function connected() {
		return $this->connection->ping();
	}
	
	public function __destruct() {
		$this->connection->close();
	}
}
