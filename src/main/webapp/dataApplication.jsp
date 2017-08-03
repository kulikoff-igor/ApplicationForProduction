<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//RU" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ru">
<head>
    <title>Даннаые о заявке</title>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/dataApplication.js"></script>
    <script type="text/javascript">
        var pipeType;
        var pe;
        var sdr;
        var pipeWall;
        var pipeDiameter;
        var unit;
        var amount;
        var segments;
        $(document).ready(function () {
            var orderingInformation;
            var dataList;
            var idApplication = window.sessionStorage.getItem("idApplication");
            orderingInformation = "Данные о заказе №" + idApplication;
            $("#orderingInformation").html(orderingInformation);
            $("#nameWindow").html("Организация заявки на заказ №" + idApplication)
            $.post("ViewingApplicationData", {
                "idApplication": idApplication
            }, function (dataListApplication) {
                dataList = dataListApplication;
                outputDataApplications(dataListApplication)
                click()
            });
            $("#remove").click(function () {
                $.post("RemoveApplicationData", {"idApplication": idApplication,"pipeType": pipeType,"pe":pe ,"sdr":sdr ,"pipeWall":pipeWall ,"pipeDiameter":pipeDiameter ,"unit":unit ,"amount": amount,"segments": segments }, function () {
                    $.post("ViewingApplicationData", {
                        "idApplication": idApplication
                    }, function (dataListApplication) {
                        dataList = dataListApplication;
                        outputDataApplications(dataListApplication)
                        click()
                        $('#removeApplicationData').modal('toggle')
                    });
                });
            })
            $("#preview").click(function () {
                if ($("#inputDate").val() == "" || $("#inputAccord").val() == "" || $("#inputDeliveryTime").val() == "") {
                    $("#error2").html(createError("Поля ввода НЕ должны быть пустыми!!!!!!!!"))
                } else {
                    $('#addingApplicationShop').modal('toggle')
                    window.sessionStorage.setItem("idApplication", idApplication);
                    window.sessionStorage.setItem("date", $("#inputDate").val());
                    window.sessionStorage.setItem("accord", $("#inputAccord").val());
                    window.sessionStorage.setItem("deliveryTime", $("#inputDeliveryTime").val());
                    window.open("printingApplication.jsp", "_parent", "");
                }
            });
            $.post("ViewingPe", function (ListPe) {
                autocompletionPe(ListPe)
            });
            $.post("ViewingSdr", function (ListSdr) {
                autocompletionSdr(ListSdr)
            });
            $.post("ViewingPipeType", function (ListPipeType) {
                autocompletionPipeType(ListPipeType)
            });
            $("#addingDataForOrder").click(function () {
                if (isNumber($("#inputPipeWall").val()) == false ||
                        $("#inputPipeWall").val() == "" ||
                        isNumber($("#inputPipeDiameter").val()) == false ||
                        $("#inputPipeDiameter").val() == "" ||
                        isNumber($("#inputAmount").val()) == false ||
                        $("#inputAmount").val() == "") {
                    $("#error1").html(createError("Поля ввода НЕ должны быть пустыми, и дробные значения пишуться через , !!!!!!!!"))
                }
                else {
                    $.post("AddingDataForOrder", {
                        "idApplication": idApplication,
                        "pipeType": $("#inputPipeType").val(),
                        "pe": $("#inputPE").val(),
                        "sdr": $("#inputSDR").val(),
                        "pipeWall": $("#inputPipeWall").val(),
                        "pipeDiameter": $("#inputPipeDiameter").val(),
                        "unit": $("#inputUnit").val(),
                        "amount": $("#inputAmount").val(),
                        "segments": $("#inputSegments").val()
                    }, function () {
                        $.post("ViewingApplicationData", {
                            "idApplication": idApplication
                        }, function (dataListApplication) {
                            outputDataApplications(dataListApplication)
                        });
                        $("#inputPipeWall").val("");
                        $("#inputPipeDiameter").val("");
                        $("#inputUnit").val("");
                        $("#inputAmount").val("");
                        $("#inputSegments").val("");
                    });
                }
            });
        });
        function isNumber(n) {
            return !isNaN(parseFloat(n)) && isFinite(n);
        }
        function click() {
            $("table tbody tr").click(function () {
                pipeType = $(this).children("#pipeType").html();
                pe = $(this).children("#pe").html();
                sdr = $(this).children("#sdr").html();
                pipeWall = $(this).children("#pipeWall").html();
                pipeDiameter = $(this).children("#pipeDiameter").html();
                unit = $(this).children("#unit").html();
                amount = $(this).children("#amount").html();
                segments = $(this).children("#segments").html();
            });
        }
        function createError(error) {
            var Div;
            Div = "<div class='alert alert-danger fade in' > <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>" + error + " </div>"
            return Div;
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
            <h4 id="orderingInformation" style="text-align: center"></h4>
        </div>
    </div>
    <div class="row ">
        <div class="col-md-3 col-lg-3">
            <table>
                <tr>
                    <td>
                        <button class="btn btn-lg btn-success" role="button" data-toggle="modal"
                                data-target="#addingApplicationShop">
                            Подача заявки производству
                        </button>
                    </td>
                </tr>
                <tr>
                    <td> &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="inputPipeType" class="col-sm-6 control-label">Тип трубы</label>

                                <div class="col-sm-6">
                                    <select class="form-control" id="inputPipeType">

                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPE" class="col-sm-6 control-label">ПЭ</label>

                                <div class="col-sm-6">
                                    <select class="form-control" id="inputPE">

                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputSDR" class="col-sm-6 control-label">SDR</label>

                                <div class="col-sm-6">
                                    <select class="form-control" id="inputSDR">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPipeWall" class="col-sm-6 control-label">Стенка</label>

                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="inputPipeWall" placeholder="Стенка">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPipeDiameter" class="col-sm-6 control-label">Диаметр трубы</label>

                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="inputPipeDiameter"
                                           placeholder="Диаметр трубы">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputUnit" class="col-sm-6 control-label">Единицы</label>

                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="inputUnit" placeholder="Единицы">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputAmount" class="col-sm-6 control-label">Количество</label>

                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="inputAmount" placeholder="Количество">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputSegments" class="col-sm-6 control-label">Отрезки</label>

                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="inputSegments" placeholder="Отрезки">
                                </div>
                            </div>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button class="btn btn-lg btn-success" id="addingDataForOrder">
                            &nbsp;&nbsp;Добавьть данные о заказе&nbsp;&nbsp;
                        </button>
                        <error id="error1"></error>
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-md-9 col-lg-9">
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
    </div>

    <div id="removeApplicationData" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="Application"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <h4 id="delApplication" style="float: left; margin: 2%">Удалить данную строку</h4>
                    <button type="button" class="btn btn-success" data-dismiss="modal">Отмена</button>
                    <button type="button" id="remove" class="btn btn-danger">Удалить безаозвратно</button>
                </div>
            </div>
        </div>
    </div>

    <div id="addingApplicationShop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="Application"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="nameWindow"></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputAccord" class="col-sm-3 control-label">Согласссвано</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputAccord" placeholder="Согласссвано с">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputDate" class="col-sm-3 control-label">Дата</label>

                            <div class="col-sm-9">
                                <input type="date" class="form-control" id="inputDate">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputDeliveryTime" class="col-sm-3 control-label">Срок поставки на склад</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputDeliveryTime"
                                       placeholder="Срок поставки на склад">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <error id="error2"></error>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Отмена</button>
                    <button type="button" id="preview" class="btn btn-success">Просмотр заявки
                    </button>
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