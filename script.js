var res
 $(document).ready(function() {
    //Если нажали на кнопку "Коментировать" выполняеться данная функция
    $("#btn").click(function(e) {
      //Берем значения форм для последующей их проверки
       var nameCom = $('#nameCom').val();
       var textCom = $('#textCom').val();
       var captcha = $('#captcha').val();

       //Проверяем поля формы и капчу
        if (nameCom==""){
          alert('Введите имя');
          }
        else if (textCom=="")
        {
          alert('Введите текст коментария');
          }
       else if (captcha == keystring) {
         //Если все врено берем все значения формы и отправляем из на обработчик ajax запросом
        var formData = new FormData($('#addcomm')[0]);
    //console.log(formData);
        $.ajax({
            url: 'file.php',
            type: "POST",
            data:formData,
            dataType: "json",
            async: false,
            success: function (result) {
           // alert(result);
           //Получаем обьект со всеми коментариями (в том числе новым) и выводим их 
               $('#comm').html(function(){
         var res = '';
          for(var i = 0; i < result.length; i++){
            res += '<p>&nbsp' + result[i].NameCom + '<small class="text-muted">&nbsp' + result[i].DateCom + ' в ' + result[i].TimeCom + '</small> &nbsp<button type="button" value="' + result[i].Id + '" class="btn badge badge-danger" id="del-' + result[i].Id + '"  name="BtnDellCom" ><span aria-hidden="true">&times;</span></button> </p>  <p><small >' + result[i].TextCom + '</small></p> ';
           if (result[i].FileCom != null){
              res += '<img src="imgComments/'+ result[i].FileCom +'" class="col-4" alt="" ><br><br><br>'
             }
            else{
               res += '<br><br><br>'
            }
          }
           return res;
          });
            },
            error: function(result) {
              //Ошибка призодит в случае если файл не соотвецтвует формату
                alert('файл не соответствует формату');
            },
            cache: false,
            contentType: false,
            processData: false
        });
        e.preventDefault();
        }
        else {
            //Ошибка при введении неверной капчи
             alert('Цифры с кртинки указанны не верно');
        }
    });
      //При нажатии кнопки удаления коментария (краснй крестик) выполняеться данная функция
     $("body").on("click", "#comm .btn", function(e) {
         //Берем id кнопки (в которм указан уникальный ключ для коментария)
        var clickedID = this.id.split("-"); //Разбиваем строку (Split работает аналогично PHP explode)
        var DbNumberID = clickedID[1]; //и получаем номер из массива
     
        var formData = new FormData();
        formData.append("recordToDelete", DbNumberID);


    //Сформировав данные отправляем их ajax запросом на обработчик
        $.ajax({
            url: 'file.php',
            type: "POST",
            data:formData,
            dataType: "json",
            success: function (result) {
               //В ответ на запрос полуаем массив с коментариями (без удаленного)
              $('#comm').html(function(){
         var res = '';
          for(var i = 0; i < result.length; i++){
            res += '<p>&nbsp' + result[i].NameCom + '<small class="text-muted">&nbsp' + result[i].DateCom + ' в ' + result[i].TimeCom + '</small> &nbsp<button type="button" value="' + result[i].Id + '" class="btn badge badge-danger" id="del-' + result[i].Id + '"  name="BtnDellCom" ><span aria-hidden="true">&times;</span></button> </p>  <p><small >' + result[i].TextCom + '</small></p> ';
           if (result[i].FileCom != null){
              res += '<img src="imgComments/'+ result[i].FileCom +'" class="col-4" alt="" ><br><br><br>'
             }
            else{
               res += '<br><br><br>'
            }
          }
           return res;
          });
            },
            error: function(result) {
                alert('Ошибка!');
            },
            cache: false,
            contentType: false,
            processData: false
        });
        e.preventDefault();
    });


  });