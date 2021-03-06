/**
 * Created by Vasyl Danylyuk on 17.11.2014.
 */
var xmlhttp;            //AJAX request
var user;               //Instance of current loaded user

//Установка полів вводу дозволеними/блокованими в залежності від вибору параметру пошуку
function SelectFindType() {
    if (document.getElementById("byName").checked == true) {
        document.getElementById("findName").disabled = false;
        document.getElementById("findEmail").disabled = true;
    } else {
        document.getElementById("findName").disabled = true;
        document.getElementById("findEmail").disabled = false;
    }
};

//Створення запиту на пошук користувача
function FindUser(){
    //Об'єкт AJAX запиту
    xmlhttp=GetXmlHttpObject();
    //Перевірка на підтримку AJAX браузером
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }

    //Параметри запиту
    var findBy;
    var findValue;

    //Отримання параметрів запиту з форми
    if(document.getElementById("byName").checked == true){
        findBy = "name";
        findValue = document.getElementById("findName").value;
    } else {
        findBy = "email";
        findValue = document.getElementById("findEmail").value;
    }

    //Створення запиту
    var url = "/findUser?findBy="+findBy+"&findValue="+findValue;

    //Відправка запиту та очікування на відповідь
    xmlhttp.open("GET", url, true);
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4) {
            if(xmlhttp.status == 200) {
                fillData();
            }
        }
    };
    xmlhttp.send(null);
};

//Creating GET HTTP request object
function GetXmlHttpObject(){
    if (window.XMLHttpRequest){
        return new XMLHttpRequest();
    }
    if (window.ActiveXObject){
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
    return null;
}

//Заповнення та демонстрація даних користувача
function fillData(){
    //Отримуємо обєкт користувача з JSON
    try {
        user = JSON.parse(xmlhttp.responseText);
    }catch (Exception){
        alert("Can't find user with this name or e-mail")
    }
    //Заповнюємо всі поля
    //Аватар
    document.getElementById("userAvatar").setAttribute("src", "/resources/images/"+user.avatar);
    //Ім'я
    document.getElementById("inputName").setAttribute("value", user.login);
    //E-mail
    document.getElementById("inputEmail").setAttribute("value", user.email);
    //Enabled
    if(user.enabled != 0){
        document.getElementById("enabled").setAttribute("checked", "true");
    } else {
        document.getElementById("enabled").setAttribute("checked", "false");
    }
    //Відображаємо форму
    document.getElementById("userData").style.display = "block";
};

//Відміна дій адміністратора
function cancel(){
    //Очищаємо всі поля
    //Аватар
    document.getElementById("userAvatar").setAttribute("src", "");
    //Ім'я
    document.getElementById("inputName").setAttribute("value", "");
    //E-mail
    document.getElementById("inputEmail").setAttribute("value", "");
    //Enabled
    document.getElementById("enabled").setAttribute("checked", "false");

    //Приховуємо форму
    document.getElementById("userData").style.display = "none";
}

//Видалення користувача
function deleteUser(){
    //Об'єкт AJAX запиту
    xmlhttp=GetXmlHttpObject();
    //Перевірка на підтримку AJAX браузером
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }

    //Створення запиту
    var url = "/deleteUser?id="+user.id;

    //Відправка запиту та очікування на відповідь
    xmlhttp.open("POST", url, true);
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4) {
            if(xmlhttp.status == 200) {
                document.getElementById("ModalLabel").setAttribute("value", "Deleting user");
                showModal();
            }
        }
    };
    xmlhttp.send(null);
}

function showModal(){
    response = JSON.parse(xmlhttp.responseText);
    document.getElementById("ModalBody").innerHTML = response.result;

    var options = {
        "backdrop" : "static"
    }

   // document.getElementById("resultModal").modal(options);
    $('#resultModal').modal(options);
};

function updateUser(){
    //Об'єкт AJAX запиту
    xmlhttp=GetXmlHttpObject();
    //Перевірка на підтримку AJAX браузером
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }

    //Request params
    var login = document.getElementById("inputName").value;
    var email = document.getElementById("inputEmail").value;
    var password = document.getElementById("inputPassword").value;
    if(document.getElementById("enabled").checked == true){
        var enabled = 1;
    }else{
        var enabled = 0;
    };

    //Створення запиту
    var url = "/updateUser?id="+user.id+"&login="+login+"&email="+email+"&password="+password+"&enabled="+enabled;

    //Відправка запиту та очікування на відповідь
    xmlhttp.open("POST", url, true);
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4) {
            if(xmlhttp.status == 200) {
                document.getElementById("ModalLabel").setAttribute("value", "Updating user");
                showModal();
            }
        }
    };
    xmlhttp.send(null);
};



