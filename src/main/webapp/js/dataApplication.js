function autocompletionPipeType(dataPipeType) {
    var createDiv = "";
    var data = JSON.parse(dataPipeType);
    var i = 0;
    for (i = 0; i < data.length; i++) {
        createDiv += "<option>" + data[i].pipeType + "</option>"
    }
    $("#inputPipeType").html(" ");
    $("#inputPipeType").html(createDiv);
}
function autocompletionSdr(dataSdr) {
    var createDiv = "";
    var data = JSON.parse(dataSdr);
    var i = 0;
    for (i = 0; i < data.length; i++) {
        createDiv += "<option>" + data[i].sdr + "</option>"
    }
    $("#inputSDR").html(" ");
    $("#inputSDR").html(createDiv);
}
function autocompletionPe(dataPe) {
    var createDiv = "";
    var data = JSON.parse(dataPe);
    var i = 0;
    for (i = 0; i < data.length; i++) {
        createDiv += "<option>" + data[i].pe + "</option>"
    }
    $("#inputPE").html(" ");
    $("#inputPE").html(createDiv);
}
function outputDataApplications(dataListApplication) {
    var createDiv = "";
    var data = JSON.parse(dataListApplication);
    var i = 0;
    for (i = 0; i < data.length; i++) {
        createDiv += CreateStringDataApplications(data, i)
    }
    $("#tablebodyDataApplication").html(" ");
    $("#tablebodyDataApplication").html(createDiv);
}
function CreateStringDataApplications(permit, i) {
    var Div = "";
    var namberAplication = i + 1;
    Div = "<tr class='active' data-toggle='modal' data-target='#removeApplicationData'><td>" +
        namberAplication + "</td><td id='pipeType'>"
        + permit[i].pipeType + "</td><td id='pe'>"
        + permit[i].pe + "</td><td id='sdr'>"
        + permit[i].sdr + "</td><td id='pipeWall'> "
        + permit[i].pipeWall + "</td><td id='pipeDiameter'>"
        + permit[i].pipeDiameter + "</td><td id='unit'>"
        + permit[i].unit + "</td><td id='amount'>"
        + permit[i].amount + "</td><td id='segments'>"
        + permit[i].segments + "</td>"
        + "</tr>";
    return Div
}
/**
 * Created by IT-1 on 21.02.14.
 */
