
<?php
//Подключаем файл с запросами
require_once "app.php";
//Проверка данных
if(isset($_POST['nameCom']) &&  isset($_POST['textCom'])) {
	if( !empty( $_FILES['userfile']['name'] ) ) {
		if ( $_FILES['userfile']['error'] == 0 ) {
			if( substr($_FILES['userfile']['type'], 0, 5)=='image' ) {
				// $test = $_POST['BtnDellCom'];
				//Перевод названий загруженных картинок в транслит
				function translit($st)
				    {
				        $st = mb_strtolower($st, "utf-8");
				        $st = str_replace([
				            '?', '!', '.', ',', ':', ';', '*', '(', ')', '{', '}', '[', ']', '%', '#', '№', '@', '$', '^', '-', '+', '/', '\\', '=', '|', '"', '\'',
				            'а', 'б', 'в', 'г', 'д', 'е', 'ё', 'з', 'и', 'й', 'к',
				            'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х',
				            'ъ', 'ы', 'э', ' ', 'ж', 'ц', 'ч', 'ш', 'щ', 'ь', 'ю', 'я'
				        ], [
				            '_', '_', '.', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_',
				            'a', 'b', 'v', 'g', 'd', 'e', 'e', 'z', 'i', 'y', 'k',
				            'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'h',
				            'j', 'i', 'e', '_', 'zh', 'ts', 'ch', 'sh', 'shch',
				            '', 'yu', 'ya'
				        ], $st);
				        $st = preg_replace("/[^a-z0-9_.]/", "", $st);
				        $st = trim($st, '_');

				        $prev_st = '';
				        do {
				            $prev_st = $st;
				            $st = preg_replace("/_[a-z0-9]_/", "_", $st);
				        } while ($st != $prev_st);

				        $st = preg_replace("/_{2,}/", "_", $st);
				        return $st;
				    }
	    		 //Загрузка файла на сервер
				$image  =  mt_rand(0, 10000) .translit($_FILES['userfile']['name']);
				$uploaddir = $_SERVER['DOCUMENT_ROOT'].DIRECTORY_SEPARATOR.'imgComments'.DIRECTORY_SEPARATOR;
				$uploadfile = $uploaddir .  basename($image);
				$image = mysql_escape_string( $image );
			}
		}
	}
	else {
		 $image = NULL;//Картинки нету
	}
	//Выполняеться функция с запросом на добавление нового коментария с данными в виде параметров функции
	addComment($_POST['nameCom'], $_POST['textCom'], $image);
	if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
	    $out = 'Работает' ;
	} else {
	    $out = "Возможная атака с помощью файловой загрузки!\n";
	}
}
//Если данные по новому каментарию не пришли ,выполняеться проверка на данные об удалении
elseif(isset($_POST["recordToDelete"]) && strlen($_POST["recordToDelete"])>0 && is_numeric($_POST["recordToDelete"]))
 {


    // очищаем значение переменной, PHP фильтр FILTER_SANITIZE_NUMBER_INT
    // Удаляет все символы, кроме цифр и знаков плюса и минуса
    $idToDelete = filter_var($_POST["recordToDelete"],FILTER_SANITIZE_NUMBER_INT);

  	//По полченому уникальному ключу выполняем запрос на вывод названия картинки у данного коментария
    $file = getFileComments ($idToDelete);
    if ($file[0]['FileCom']!=0){
    //Если котринка есть то удаяем ее с сервера	
     unlink('imgComments/'.$file[0]['FileCom']);
    }
     //Удаляем коментарий	
   dellComment($idToDelete);
}
// }else{

//     //Output error
//     header('HTTP/1.1 500 Error occurred, Could not process request!');
//     exit();
// }

//После всех операций выплянем запрос на вывод всех коментариев
$commets =  getComments();
//Отправляем 
echo json_encode($commets);
?>