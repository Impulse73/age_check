<?php

use Tygh\Development;
use Tygh\Registry;
use Tygh\Helpdesk;
use Tygh\Tools\Url;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if ($mode == "check") {
        $date_form = new DateTime($_POST['age_user']);
        $date_form = $date_form->format('U');
        $date_now = time();
        $age = ($date_now - $date_form) / 3600 / 365 /24;
        setcookie("age",$age,time() + 3600);
    }
    if ($mode == "accept") {
        setcookie("accept","Y",time() + 3600);
    }
    return array(CONTROLLER_STATUS_REDIRECT, "index.php");
}
