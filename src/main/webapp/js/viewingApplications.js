/**
 * Created by IT-1 on 14.02.14.
 */
$(document).ready(function () {
     $.post("ViewingApplications", function (data) {
         alert("sdsdds")
        formation(data)
    });
});
function formation(data) {
    var createDiv = "";
    var permit = JSON.parse(data);
    for (i = 0; i < permit.length; i++) {
        createDiv += create(permit)
    }
    $("#tablebody").html(" ");
    $("#tablebody").html(createDiv);
}
function create(permit) {
    var Div = "";
    Div = "<tr class='active' data-toggle='modal' data-target='#applicationData'><td  id='idApplication'>" + permit[i].idApplication + "</td><td>"
        + permit[i].date + "</td><td>" + permit[i].organization
        + "</td><td>" + permit[i].terms + "</td><td>"
        + permit[i].performer + "</td></tr>";
    return Div
}

