<?
date_default_timezone_set('UTC+3');

function getConnection()
{
	
	//Параметры для подключения к бд
	$params =  [
		"host" => "127.0.0.1",
		"dbname" => "db",
		"user" => "root",
		'password' => ""
	];
//Выполняем соединение 
	$dsn = "mysql:host={$params["host"]};dbname={$params['dbname']}"; 
	$db = new PDO($dsn, $params['user'], $params['password']); 
	// Задаем кодировку 
	$db->exec("set names utf8");
	//var_dump(echo $db); 
	return $db; 
}



function getComments ()
{
	$newConnect = getConnection();
	
	$sql = "SELECT
Id,
NameCom,
TextCom,
DATE_FORMAT(DateCom, '%d/%m/%Y') as DateCom,
TIME(DateCom) as TimeCom,
FileCom
FROM
`comment`
ORDER BY
comment.DateCom DESC
";
	if ($arreyComments  = $newConnect -> query($sql)) {
	//Получаем результаты и преобразуем это все в массив

		return $arreyComments-> fetchAll();
	}else{
		return "Не работает";
	}
} 


function getFileComments ($id_comment)
{
	$newConnect = getConnection();
	
	$sql = "SELECT
`comment`.FileCom
FROM
`comment`
WHERE
`comment`.Id = '$id_comment'";
	if ($arreyComments  = $newConnect -> query($sql)) {
	//Получаем результаты и преобразуем это все в массив

		return $arreyComments-> fetchAll();
	}else{
		return "Не работает";
	}
} 




function dellComment($id_comment)
{
	$newConnect = getConnection();
	
	$sql = "DELETE FROM
comment
WHERE
comment.Id='$id_comment'";
	$result=$newConnect -> query($sql);
	if ($result==true)
		return 1;
	else
		return 0;
}




function addComment($name, $textCom, $img)
{
	$link = mysqli_connect("127.0.0.1", "root", "", "db");
	$newConnect = getConnection();
	$nameb =mysqli_real_escape_string($link,$name);
	$textComb =mysqli_real_escape_string($link,$textCom);
	$imgb = mysqli_real_escape_string($link,$img);
	$sql = "INSERT INTO comment (NameCom, TextCom, DateCom, FileCom) VALUES ('$nameb', '$textComb', NOW(),'$imgb')";
	$result=$newConnect -> query($sql);
	if ($result==true)
		return 1;
	else
		return 0;
}



?>