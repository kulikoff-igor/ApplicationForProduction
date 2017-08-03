<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
    <title>Предворительный просмотр</title>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/dataApplication.js"></script>
    <script type="text/javascript" <%--src="js/viewingApplications.js"--%>>
        $(document).ready(function () {
            var str = document.referrer;
            var idApplication = window.sessionStorage.getItem("idApplication");
            $("#namerApplication").html(idApplication)
            $.post("ViewingApplicationData", {
                "idApplication": idApplication
            }, function (dataListApplication) {
                dataList = dataListApplication;
                outputDataApplications(dataListApplication)
            });
            $.get("ViewingApplications", {"idApplication": idApplication}, function (application) {
                var data = JSON.parse(application);
                $("#organization").html(data[0].organization);
                $("#terms").html(data[0].terms);
                $("#performer").html(data[0].performer)
            });
            $("#date").html(window.sessionStorage.getItem("date"));
            $("#deliveryTime").html(window.sessionStorage.getItem("deliveryTime"));
            $("#accord").html(window.sessionStorage.getItem("accord"));

            $("#print").click(function () {
                window.print();
                window.sessionStorage.clear();
                if (str.match(/applications.jsp/) != null) {
                }
                if (str.match(/dataApplication.jsp/) != null) {
                    $.post("AddingApplicationProduction", {
                        "idApplication": $("#namerApplication").html(),
                        "date": $("#date").html(),
                        "accord": $("#accord").html(),
                        "deliveryTime": $("#deliveryTime").html()
                    }, function () {
                    });
                }
            });
        });

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
                <li class="active"><a id="print">Печать</a></li>
                <li><a href="home.jsp">База данных</a></li>
                <li><a href="applications.jsp">Заявки</a></li>

            </ul>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <table width="100%">
            <tr>
                <td width="80%"></td>
                <td><h4>Утверждаю</h4></td>
            </tr>
            <tr>
                <td width="80%"></td>
                <td><h4>"____"_______________2014г.</h4></td>
            </tr>
        </table>
    </div>
    <div class="row " onload="window.print()">
        <h4 style="text-align: center"><strong>Заявка на изготовление №
            <namder id="namerApplication"></namder>
            от
            <date id="date"></date>
            .</strong></h4>

        <div class="col-md-4 col-lg-4">
            <table width="100%">
                <tr>
                    <td width="50%">Заказчик:</td>
                    <td id="organization"></td>
                </tr>
                <tr>
                    <td width="50%">Срок поставки на склад:</td>
                    <td id="deliveryTime"></td>
                </tr>
                <tr>
                    <td width="50%">Особые Условия:</td>
                    <td id="terms"></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row ">
        <div class="col-md-12 col-lg-12">
            <table class="table table-hover" id="tableDataApplication">
                <thead>
                <tr>
                    <th>№</th>
                    <th>Тип Трубы</th>
                    <th>ПЭ</th>
                    <th>SDR</th>
                    <th>Стенка</th>
                    <th>Диаметр</th>
                    <th>Единицы</th>
                    <th>Количество</th>
                    <th>Отрезки</th>
                </tr>
                </thead>
                <tbody id="tablebodyDataApplication">

                </tbody>
            </table>
        </div>
        <div class="col-md-12 col-lg-12">
            <table width="100%">
                <tr>
                    <td> &nbsp;</td>
                </tr>
                <tr>
                    <td width="50%">Подготовил:</td>
                    <td id="performer"></td>
                </tr>
                <tr>
                    <td> &nbsp;</td>
                </tr>
                <tr>
                    <td width="50%">Согласовано:</td>
                    <td id="accord"></td>
                </tr>
                <tr>
                    <td> &nbsp;</td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td width="100%">Принял:</td>
                </tr>
                <tr>
                    <td width="100%"> ___________"____________" "___"___________20____г. в "__"ч. "__"мин.</td>
                </tr>
                <tr>
                    <td width="100%"> Фамилия&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Подпись</td>
                </tr>
            </table>
        </div>
    </div>
    <hr>
    <footer>
        <p>&copy; Пассат-Пласт 2014</p>
    </footer>

</div>
</div>
</body>
</html>