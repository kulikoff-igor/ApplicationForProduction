<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
    <title>Заявки от покупателей</title>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" <%--src="js/viewingApplications.js"--%>>
        var i = 0;
        var applications;
        var idApplication;
        $(document).ready(function () {

            $("#remove").click(function(){
                $.post("RemoveApplication",{"idApplication": $("#deldApplication").val()}, function () {
                    $.post("ViewingApplications", function (databaseList) {
                        outputApplications(databaseList)
                        click();
                        $('#removeApplication').modal('toggle')
                    });
                });
            })
            $("#searchById").click(function () {
                if ($("#searchId").val() == false || $("#searchId").val() == "") {

                }
                else {
                    $.get("ViewingApplications", {"idApplication": $("#searchId").val()}, function (databaseList) {
                        outputApplications(databaseList)
                        click();
                    });
                }
            });
            $("#allApplications").click(function () {
                $.post("ViewingApplications", function (databaseList) {
                    outputApplications(databaseList)
                    click();
                });
            });

            $("#addingApplication").click(function () {
                if(applications.length==0){addingNewApplication();}
                else{
                if ($("#inputIdApplication").val() < applications[applications.length - 1].idApplication + 1 || $("#inputIdApplication").val() == "" || $("#inputDate").val() == "" || $("#inputOrganization").val() == "" || $("#inputTerms").val() == "" || $("#inputPerformer").val() == "") {
                    $("#error").html(createError("Поля ввода НЕ должны быть пустыми, и номер заказа НЕ должен быть повторяющимся числом !!!!!!!!"))
                } else {
                    addingNewApplication();
                }}
            });
            $.post("ViewingApplications", function (databaseList) {
                outputApplications(databaseList)
               click();
            });

        });
        function addingNewApplication(){
            $.post("AddingNewApplication", {
                "idApplication": $("#inputIdApplication").val(),
                "date": $("#inputDate").val(),
                "organization": $("#inputOrganization").val(),
                "terms": $("#inputTerms").val(),
                "perfomer": $("#inputPerformer").val()
            }, function () {
                $.post("ViewingApplications", function (databaseList) {
                    outputApplications(databaseList)
                    click();
                    $('#addApplication').modal('toggle')
                    $("#inputPerformer").val("");
                    $("#inputOrganization").val("");
                    $("#inputTerms").val("");
                    $("#inputDate").val("");
                    $("#inputIdApplication").val("");
                });
            });
        }
        function click(){
            $("#tablebodyApplication tr").click(function () {
                idApplication = $(this).children("td").html();
                window.sessionStorage.setItem("idApplication", idApplication);
                window.open("dataApplication.jsp", "_blank", "");
            });
        }
        function outputApplications(databaseList) {
            var createDiv = "";
            applications = JSON.parse(databaseList);

            for (i = applications.length - 1; i >= 0; i--) {
                createDiv += applicationCreatesString(applications, i)
            }
            $("#tablebodyApplication").html(" ");
            $("#tablebodyApplication").html(createDiv);
        }
        function applicationCreatesString(permit, i) {

            var Div = "";
            Div = "<tr class='active'><td  id='idApplication'>" + permit[i].idApplication + "</td><td>"
                    + permit[i].date + "</td><td>" + permit[i].organization
                    + "</td><td>" + permit[i].terms + "</td><td>"
                    + permit[i].performer + "</td></tr>";
            return Div;
        }
        function createError(error) {
            var Div;
            Div = "<div class='alert alert-danger fade in' > <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>" + error + " </div>"
            return Div;
        }
        function isNumber(n) {
            return !isNaN(parseFloat(n)) && isFinite(n);
        }
    </script>

    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="css/styles.css">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="css/bootstrap-responsive.css">
    <link type="text/css" rel="stylesheet" href="css/styles.css">

</head>
<body>
<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand">Служба Сбыта</a>
        </div>
        <div class="collapse navbar-collapse  pull-right">
            <ul class="nav navbar-nav">
                <li class="active"><a href="home.jsp">База данных</a></li>
                <li><a href="applications.jsp">Заявки</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="container">
    <div class="row ">
        <div class="col-md-12 col-lg-12">
            <table id="tableApplication" class="table table-hover">
                <thead>
                <tr>
                    <th>№</th>
                    <th>Дата</th>
                    <th>Организация</th>
                    <th>Условия</th>
                    <th>Исполнитель</th>
                </tr>
                </thead>
                <tbody id="tablebodyApplication">
                </tbody>
            </table>

            <div class="row">
                <div class="col-lg-6">
                    <button class="btn btn-lg btn-success" role="button" data-toggle="modal"
                            data-target="#addApplication"> Добавьть заказ
                    </button>
                    <button class="btn btn-lg btn-danger" role="button" data-toggle="modal"
                            data-target="#removeApplication"> Удалить заказ
                    </button>
                </div>
                <div class="col-lg-6">
                    <div class="input-group">
                        <span class="input-group-btn">
                             <button class="btn btn-default" id="searchById" type="button">Поиск по номеру</button>
                         </span>
                        <input type="text" id="searchId" class="form-control">
                        <span class="input-group-btn">
                             <button class="btn btn-default" id="allApplications" type="button">Просмотреть все заявки
                             </button>
                         </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="addApplication" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="Application"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="Application">Регистрация заявки от покупателя</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputOrganization" class="col-sm-3 control-label">№ Заказа</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputIdApplication" placeholder="№ Заказа">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputDate" class="col-sm-3 control-label">Дата</label>

                            <div class="col-sm-9">
                                <input type="date" class="form-control" id="inputDate">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputOrganization" class="col-sm-3 control-label">Организация</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputOrganization"
                                       placeholder="Организация">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputTerms" class="col-sm-3 control-label">Условия</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputTerms" placeholder="Условия">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPerformer" class="col-sm-3 control-label">Исполнитель</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputPerformer" placeholder="Исполнитель">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <error id="error"></error>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Отмена</button>
                    <button type="button" id="addingApplication" class="btn btn-success">Добавить</button>
                </div>
            </div>
        </div>
    </div>
    <div id="removeApplication" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="Application"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="delApplication">Удаление заявки от покупателя</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="deldApplication" class="col-sm-4 control-label">№ Заказа для удаления</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="deldApplication"
                                       placeholder="№ Заказа для удаления">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <error id="error"></error>
                    <button type="button" class="btn btn-success" data-dismiss="modal">Отмена</button>
                    <button type="button" id="remove" class="btn btn-danger">Удалить безаозвратно</button>
                </div>
            </div>
        </div>
    </div>
    <hr>

    <footer>
        <p>&copy; Пассат-Пласт 2013</p>
    </footer>

</div>

</body>
</html>