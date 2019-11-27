<?php 

session_start();

require "captcha.class.php"; //Подключаем класс капчи

//Инициализируем капчу
$captcha = new Captcha();

$_POST['keystring'] = $captcha->getKeyString();

echo $captcha->draw();

?>