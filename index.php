<?
//Подключаем файл с запросами
require_once "app.php";
 session_start();

?>

<!doctype html>
<html lang="ru">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->



   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="script.js"></script> 
    <title>Hello, world!</title>
  </head>
  <body>



  <div class="row ">
    <div id="carouselExampleControls" class="carousel slide col-6 offset-3 pt-4 " data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="content/1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="content/2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="content/3.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

 </div>

 <div class="card m-4 ">
  <div class="card-header">
    Коментарии
   </div>
  <div class="card-body">
    <blockquote class="blockquote mb-0">
     

 <form name="uploader" class="col" id="addcomm" enctype="multipart/form-data" method="POST"> 
  <div class="form-group col-6">

    <label for="exampleFormControlInput1">Имя</label>
    <input type="text" class="form-control" id="nameCom" name="nameCom" required  placeholder="Введите Имя">
    <br>
    <label for="exampleFormControlTextarea1">Комментарий</label>
    <textarea  class="form-control" required id="textCom" name="textCom" rows="3"></textarea> 
    <input type="file" class="form-control-file" name='userfile' id="fileCom">
  </div>

  <p>Введите числа с картинки: <br> 
<!--Подключаем капчу -->
 <?php require 'captcha.php';?> 
 <input name="pr" id="captcha" style=" margin-bottom:11px" type="text" size="6" maxlength="5"></p>
  <button type="button" id="btn" class="btn btn-primary">Комментировать</button>

<hr >
</form>

<div class="col-12" id="comm">

  <script>
      //Определяется переменная, которая будет доступна для 
      // всех JavaScript, подключаемых на данной странице
      var keystring = '<?php echo $_POST["keystring"]; ?>';
    
    </script>
<?
//Выводим коментарии из базы при загрузке страницы 
$comments = getComments();
// print_r($comments);
  for($i = 0; $i < count($comments); $i++){
              echo '<p>&nbsp'.$comments[$i]['NameCom'].'<small class="text-muted">&nbsp' .$comments[$i]['DateCom']. ' в ' .$comments[$i]['TimeCom']. ' </small> &nbsp<button type="submit" value="' .$comments[$i]['Id']. '" class="btn badge badge-danger"  id="del-'.$comments[$i]['Id'].'" name="BtnDellCom" ><span aria-hidden="true">&times;</span></button> </p>  <p><small >'.$comments[$i]['TextCom'].'</small></p>  ';
               if ($comments[$i]['FileCom'] != null){
               echo '<img src="imgComments/'.$comments[$i]['FileCom'].'" class="col-4" alt="">';
              }
             echo '<br><br><br>';
              
            }
?>
</div>



    </blockquote>
  </div>
</div>

  </body>

<script type="text/javascript">
  


</script>>

</html>