<?php
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

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
