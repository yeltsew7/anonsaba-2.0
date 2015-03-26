<?php
class AnonsabaCore {
//Anonsaba 2.0 core public static functions.
	public static function Encrypt($val) {
		$salt = salt;
		$encrypt_text = base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, md5($salt), $val, MCRYPT_MODE_CBC, md5(md5($salt))));
		return($encrypt_text);
	}
	//Credits to Baba from stack overflow for this code
	public static function GetSize($dir) {
		$ritit = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($dir, RecursiveDirectoryIterator::SKIP_DOTS));
		$bytes = 0;
		foreach ($ritit as $v) {
			$bytes += $v->GetSize();
		}
		$units = array('B','KB','MB','GB','TB');
		$bytes = max($bytes, 0);
		$pow = floor(($bytes ? log($bytes) : 0) / log(1024));
		$pow = min($pow, count($units) - 1);
		$bytes /= pow(1024, $pow);
		return round($bytes, 2) . ' ' . $units[$pow];
	}
	//
	public static function Log($val1, $val2, $val3) {
		global $db;
		$db->Execute('INSERT INTO `'.prefix.'logs` (`user`, `message`, `time`) VALUES ('.$db->quote($val1).', '.$db->quote($val2).', '.$db->quote($val3).')');
	}
	public static function trip($data){
		$trip = explode("#",$data);
		$name = array_shift($trip);
		$count = count($trip);
		if ($count > 1) {
			$tripcombine = implode("", $trip);
			return $name."!!".substr(crypt($trip[1],self::Encrypt($tripcombine)),-10);
		} elseif($count == 1) {
			return $name."!".substr(crypt($trip[1],self::Encrypt($trip[0])),-10);
		} else {
			return $name;
		}
	}
	public static function Error($val, $val2='') {
		global $twig_data, $twig, $db;
		$twig_data['sitename'] = self::GetConfigOption('sitename');
		$twig_data['version'] = self::GetConfigOption('version');
		$twig_data['errormsg'] = $val;
		$twig_data['errormsgext'] = '';
		if ($val2 != '') {
			$twig_data['errormsgext'] = '<br /><div style="text-align: center;font-size: 1.25em;">' . $val2 . '</div>';
		}
		self::Output('/error.tpl', $twig_data);
		die();
	}
	public static function GetConfigOption($val) {
		global $db;
		return $db->GetOne('SELECT `config_value` FROM `'.prefix.'siteconfig` WHERE `config_name` = '.$db->quote($val));
	}
	public static function Output($val1, $val2) {
		global $twig;
		echo $twig->display($val1, $val2);
	}
	public static function print_page($filename, $contents, $board) {
	global $db;
		$tempfile = tempnam(fullpath . $board . '/res', 'tmp'); /* Create the temporary file */
		$fp = fopen($tempfile, 'w');
		fwrite($fp, $contents);
		fclose($fp);
		if (!@rename($tempfile, $filename)) {
			copy($tempfile, $filename);
			unlink($tempfile);
		}
		chmod($filename, 0664); /* it was created 0600 */
	}
	public static function rrmdir($dir) {
		foreach(new RecursiveIteratorIterator(new RecursiveDirectoryIterator($dir, FilesystemIterator::SKIP_DOTS), RecursiveIteratorIterator::CHILD_FIRST) as $path) {
			$path->isFile() ? unlink($path->getPathname()) : rmdir($path->getPathname());
		}
		rmdir($dir);
	}
	public static function ParsePost($msg, $board) {
		global $db;
		$wordfilters = $db->GetAll('SELECT * FROM `'.prefix.'wordfilters`');
		foreach ($wordfilters as $filter) {
			if ($filter['boards'] == 'all' or $filter['boards'] == $board) {
				$word = $filter['word'];
				$replace = $filter['replace'];
				$msg = str_ireplace($word, $replace, $msg);
			}
		}
		return $msg;
	}
	public static function Banned($board='', $ip, $appealed='') {
		global $db, $twig, $twig_date;
		$twig_data['sitename'] = self::GetConfigOption('sitename');
		$twig_data['version'] = self::GetConfigOption('version');
		$twig_data['bans'] = $db->GetAll('SELECT * FROM `'.prefix.'bans` WHERE `ip` = '.$db->quote($ip));
		$twig_data['time'] = time();
		$twig_data['loc'] = isset($_GET['board']) ? url.$_GET['board'] : '';
		$twig_data['location'] = url.$board;
		if ($board != '' ) {
			$twig_data['board'] = $board;
		}
		if ($appealed != '') {
			$twig_data['msg'] = '<font color="green">Appeal successfully sent!</font>';
		}
		self::Output('/banned.tpl', $twig_data);
		die();
	}	
}
