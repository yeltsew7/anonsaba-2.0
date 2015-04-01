<?php

//Anonsaba 2.0 database wrapper
class Database extends PDO {
	public function GetAll($query) {
		$stmt = $this->query($query);
		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		$stmt->closeCursor();
		unset($stmt);
		return $results;
	}
	public function GetOne($query) {
		$stmt = $this->query($query);
		$result = $stmt->fetch(PDO::FETCH_ASSOC);
		$stmt->closeCursor();
		unset($stmt);
		return (is_array($result)) ? array_shift($result) : $result;
	}
	public function GetRow($query) {
		$stmt = $this->query($query.' LIMIT 1');
		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		$stmt->closeCursor();
		unset($stmt);
		return (!empty($results) && is_array($results)) ? array_shift($results) : false;
	}
	public function Execute($query) {
		$item = $this->exec($query);
		if($item === false) {
    			echo "\nPDO::errorInfo():\n";
    			print_r($this->errorInfo());
			return;
			$this->closeCursor();
		} else {
			return $item;
			$this->closeCursor();
		}
	}
	public function ErrorMsg() {
		$errormessage = array($this->errorInfo());
		return $errormessage[0][2];
	}
}
