<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
    <title>Заявки на изготовление</title>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" <%--src="js/viewingApplications.js"--%>>
        var i = 0;
        $(document).ready(function () {
            $.post("ViewingApplicationProduction", function (databaseList) {
                outputApplications(databaseList)
                $("table tbody tr").click(function () {
                    window.sessionStorage.setItem("idApplication",  $(this).children("#idApplication").html());
                    window.sessionStorage.setItem("date",  $(this).children("#date").html());
                    window.sessionStorage.setItem("accord", $(this).children("#accord").html());
                    window.sessionStorage.setItem("deliveryTime",$(this).children("#deliveryTime").html());
                    window.open("printingApplication.jsp", "_parent", "");
                });
            });

        });
        function outputApplications(databaseList) {
            var createDiv = "";
            var data = JSON.parse(databaseList);
            for (i = data.length-1; i >=0; i--) {
                createDiv += applicationCreatesString(data, i)
            }
            $("#tablebodyApplicationProduction").html(" ");
            $("#tablebodyApplicationProduction").html(createDiv);
        }
        function applicationCreatesString(permit, i) {
            var Div = "";
            Div = "<tr class='active'><td id='idApplicationProduction'>" + permit[i].idApplicationProduction + "</td><td id='date'>"
                    + permit[i].date + "</td><td id='idApplication'>" + permit[i].idApplication
                    + "</td><td id='accord'>" + permit[i].acord + "</td><td id='deliveryTime'>"
                    + permit[i].deliveryTime + "</td></tr>";
            return Div
        }
    </script>
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
                <li><a href="home.jsp">База данных</a></li>
                <li class="active"><a href="printingApplication.jsp">Заявки</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container">
    <div class="row ">
        <div class="col-md-12 col-lg-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>№</th>
                    <th>Дата</th>
                    <th>№ Заявки покупателя</th>
                    <th>Согласовано</th>
                    <th>Сорок поставки на склад</th>
                </tr>
                </thead>
                <tbody id="tablebodyApplicationProduction">


                </tbody>
            </table>
        </div>
    </div>

    <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Регистрация заявки от покупателя</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="date" class="col-sm-3 control-label">Дата</label>

                            <div class="col-sm-9">
                                <input type="date" class="form-control" id="date">
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
                            <label for="inputPipeType" class="col-sm-3 control-label">Тип трубы</label>

                            <div class="col-sm-9">
                                <select class="form-control" id="inputPipeType">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPE" class="col-sm-3 control-label">ПЭ</label>

                            <div class="col-sm-9">
                                <select class="form-control" id="inputPE">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputSDR" class="col-sm-3 control-label">SDR</label>

                            <div class="col-sm-9">
                                <select class="form-control" id="inputSDR">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPipeWall" class="col-sm-3 control-label">Стенка трубы</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputPipeWall" placeholder="Стенка трубы">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPipeDiameter" class="col-sm-3 control-label">Диаметр трубы</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputPipeDiameter"
                                       placeholder="Диаметр трубы">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputUnit" class="col-sm-3 control-label">Единицы</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputUnit" placeholder="Единицы">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputAmount" class="col-sm-3 control-label">Количество</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputAmount" placeholder="Количество">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputSegments" class="col-sm-3 control-label">Отрезки</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputSegments" placeholder="Отрезки">
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
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Отмена</button>
                    <button type="button" class="btn btn-success">Добавить</button>
                </div>
            </div>
        </div>
    </div>

    <hr>

    <footer>
        <p>&copy; Пассат-Пласт 2013</p>
    </footer>

</div>
</div>
</body>
</html>