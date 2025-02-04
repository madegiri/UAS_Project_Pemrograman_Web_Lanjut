<?php 
session_start();
function acakCaptcha(){
    $alphabet = "abcdefghjkmnpqrtwxyzABCDEFGHJKMNPQRSTWXYZ2346789";

    $pass = array();
    $panjangAlpha = strlen($alphabet) - 2;
    for($i = 0; $i < 5; $i++){
        $n = rand(0, $panjangAlpha);
        $pass[] = $alphabet[$n];
    }

    return implode($pass);
}

$code = acakCaptcha();
$_SESSION["code"] = $code;

$wh = imagecreatetruecolor(170, 50);
$bgc = imagecolorallocate($wh, 22, 86, 165);
$fc = imagecolorallocate($wh, 223, 230, 233);
imagefill($wh, 0, 0, $bgc);
imagestring($wh, 10, 50, 15, $code, $fc);

header('content-type: image/jpg');
imagejpeg($wh);
imagedestroy($wh);
?>