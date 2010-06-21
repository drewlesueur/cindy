<?php
error_reporting(E_ALL & ~E_NOTICE); ini_set('display_errors', '1');

if (get_magic_quotes_gpc()) {
    $process = array(&$_GET, &$_POST, &$_COOKIE, &$_REQUEST);
    while (list($key, $val) = each($process)) {
        foreach ($val as $k => $v) {
            unset($process[$key][$k]);
            if (is_array($v)) {
                $process[$key][stripslashes($k)] = $v;
                $process[] = &$process[$key][stripslashes($k)];
            } else {
                $process[$key][stripslashes($k)] = stripslashes($v);
            }
        }
    }
    unset($process);
}




if ($_POST['pw'] != "bean") {
  echo ".";
  exit();
}

$data = $_POST['data'];

$contents = file_get_contents('tours.txt');
file_put_contents('tours_' . date('U') . ".txt", $contents);
file_put_contents('tours.txt', $data);
echo "true";

?>