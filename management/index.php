<?php
//Anonsaba 2.0 Management panel
require realpath(dirname(__DIR__)).'/config/config.php';
require fullpath.'modules/manage.php';
require fullpath.'modules/anonsaba.php';
require fullpath.'modules/board.php';

session_set_cookie_params(3600); //1 hour
session_start();
	$twig_data['pass'] = AnonsabaCore::Encrypt('password');


$management = new Management();
//Management panel

if ($management->ValidateSession(true)) {
	$twig_data['name'] = $_SESSION['manageusername'];
	$twig_data['version'] = AnonsabaCore::GetConfigOption('version');
	$twig_data['sitename'] = AnonsabaCore::GetConfigOption('sitename');
	$twig_data['stafflevel'] = $management->GetStaffLevel($_SESSION['manageusername']);
	$twig_data['privmsg'] = $db->GetOne('SELECT COUNT(*) FROM `'.prefix.'pms` WHERE `read` = 0 AND `to` = '.$db->quote($_SESSION['manageusername']));
	$twig_data['current'] = $_GET['side'];
	$twig_data['action'] = $_GET['action'];
	if ($_GET['side'] == 'main' || $_GET['side'] == '') {
		$twig_data['sectionname'] = 'Main';
		$twig_data['names'] = array('Statistics' , 'Graph', 'Private Messages', 'Show Posting Password', 'Change Account Password');
		$twig_data['arraynum'] = count($twig_data['names']);
		$twig_data['url'] = array('&action=stats', '&action=graph', '&action=pms', '&action=pp', '&action=changepass');
	} elseif ($_GET['side'] == 'site') {
		$twig_data['sectionname'] = 'Site Administration';
		$twig_data['names'] = array('News' , 'Rules', 'FAQ', 'Staff', 'Logs', 'Clean up', 'Site configuration');
		$twig_data['arraynum'] = count($twig_data['names']);
		$twig_data['url'] = array('&action=news', '&action=rules', '&action=faq', '&action=staff', '&action=logs', '&action=clean', '&action=siteconfig');
	} elseif ($_GET['side'] == 'boards') {
		$twig_data['sectionname'] = 'Boards Administration';
		$twig_data['names'] = array('Add/Delete boards' , 'Board Options', 'Edit filetypes', 'Edit Sections', 'Word filter', 'Spam filter', 'Manage Ads', 'Move threads', 'Rebuild board', 'Rebuild all boards');
		$twig_data['arraynum'] = count($twig_data['names']);
		$twig_data['url'] = array('&action=adddelboard', '&action=boardopt', '&action=filetypes', '&action=sections', '&action=wf', '&action=sf', '&action=ads', '&action=movethread', '&action=rebuildboard', '&action=rebuildall');
	} elseif ($_GET['side'] == 'mod') {
		$twig_data['sectionname'] = 'Moderation';
		$twig_data['names'] = array('View/Add/Delete Bans', 'View Reports', 'View Appeals', 'View Recent Posts');
		$twig_data['arraynum'] = count($twig_data['names']);
		$twig_data['url'] = array('&action=bans', '&action=reports', '&action=appeal', '&action=recentpost');
	}
}
//Run this each time someone logs in...
$management->ExpireBans();
//Don't touch this
$action = isset($_GET['action']) ? $_GET['action'] : 'stats';
$side = isset($_GET['side']) ? $_GET['side'] : 'main';
if (isset($_GET['act'])) {
	$management->CheckLogin($side, $action);
	$management->ValidateSession();
}
switch ($action) {
	case 'logout':
		$management->Logout();
		break;
	case 'getip':
		$management->ValidateSession(true);
		page($action);
		break;
	default:
		$management->ValidateSession();
		page($action);
		break;
}
function page($action) {
	global $management, $twig_data;
	if (is_callable(array($management, $action))) {
		$management->$action();
	} else {
		echo sprintf('%s not implemented.', $action);
	}
}
