
<?php
//���������� ���� � ���������
require_once "app.php";
//�������� ������
if(isset($_POST['nameCom']) &&  isset($_POST['textCom'])) {
	if( !empty( $_FILES['userfile']['name'] ) ) {
		if ( $_FILES['userfile']['error'] == 0 ) {
			if( substr($_FILES['userfile']['type'], 0, 5)=='image' ) {
				// $test = $_POST['BtnDellCom'];
				//������� �������� ����������� �������� � ��������
				function translit($st)
				    {
				        $st = mb_strtolower($st, "utf-8");
				        $st = str_replace([
				            '?', '!', '.', ',', ':', ';', '*', '(', ')', '{', '}', '[', ']', '%', '#', '�', '@', '$', '^', '-', '+', '/', '\\', '=', '|', '"', '\'',
				            '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
				            '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
				            '�', '�', '�', ' ', '�', '�', '�', '�', '�', '�', '�', '�'
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
	    		 //�������� ����� �� ������
				$image  =  mt_rand(0, 10000) .translit($_FILES['userfile']['name']);
				$uploaddir = $_SERVER['DOCUMENT_ROOT'].DIRECTORY_SEPARATOR.'imgComments'.DIRECTORY_SEPARATOR;
				$uploadfile = $uploaddir .  basename($image);
				$image = mysql_escape_string( $image );
			}
		}
	}
	else {
		 $image = NULL;//�������� ����
	}
	//������������ ������� � �������� �� ���������� ������ ���������� � ������� � ���� ���������� �������
	addComment($_POST['nameCom'], $_POST['textCom'], $image);
	if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
	    $out = '��������' ;
	} else {
	    $out = "��������� ����� � ������� �������� ��������!\n";
	}
}
//���� ������ �� ������ ���������� �� ������ ,������������ �������� �� ������ �� ��������
elseif(isset($_POST["recordToDelete"]) && strlen($_POST["recordToDelete"])>0 && is_numeric($_POST["recordToDelete"]))
 {


    // ������� �������� ����������, PHP ������ FILTER_SANITIZE_NUMBER_INT
    // ������� ��� �������, ����� ���� � ������ ����� � ������
    $idToDelete = filter_var($_POST["recordToDelete"],FILTER_SANITIZE_NUMBER_INT);

  	//�� ��������� ����������� ����� ��������� ������ �� ����� �������� �������� � ������� ����������
    $file = getFileComments ($idToDelete);
    if ($file[0]['FileCom']!=0){
    //���� �������� ���� �� ������ �� � �������	
     unlink('imgComments/'.$file[0]['FileCom']);
    }
     //������� ����������	
   dellComment($idToDelete);
}
// }else{

//     //Output error
//     header('HTTP/1.1 500 Error occurred, Could not process request!');
//     exit();
// }

//����� ���� �������� �������� ������ �� ����� ���� �����������
$commets =  getComments();
//���������� 
echo json_encode($commets);
?>