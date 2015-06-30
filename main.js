var RequestPara = "";
var Page = 0;
var MaxProduct = 0;
$(document).ready(function() {
    $.ajax({
        type: 'GET',
        url: "query.php",
        data: "",
        success: function(data, textStatus, jqXHR) {
            $("#QueryResult").html(data);
            onChange();
        }
    });
});

Array.prototype.each = function(fn) {
    return this.length ? [fn(this.slice(0, 1))].concat(this.slice(1).each(fn)) : [];
};
String.prototype.format = function(args) {
    var result = this;
    if (arguments.length > 0) {
        if (arguments.length == 1 && typeof(args) == "object") {
            for (var key in args) {
                if (args[key] != undefined) {
                    var reg = new RegExp("({" + key + "})", "g");
                    result = result.replace(reg, args[key]);
                }
            }
        } else {
            for (var i = 0; i < arguments.length; i++) {
                if (arguments[i] != undefined) {
                    var reg = new RegExp("({)" + i + "(})", "g");
                    result = result.replace(reg, arguments[i]);
                }
            }
        }
    }
    return result;
}

function changeQueryText() {
    $("#PraseData").html("<tr><td colspan='6' style = 'text-align: center;'><h4>Querying...</h4><</td></tr>");
}

function onChange() {
    changeQueryText();
    Page = 0;
    RequestPara = generateURL();
    submitRequest();
}


function onPgUp() {
    Page--;
    changeQueryText();
    RequestPara = generateURL();
    submitRequest();
}

function onPgDown() {
    Page++;
    changeQueryText();
    RequestPara = generateURL();
    submitRequest();
}

function onQuerySuccess() {
    $("#PageDiv").html("<div><div id = 'UpControl' class = 'PageControlDiv'></div> \
    <div id = 'PageControl'  class = 'PageControlDiv'></div> \
    <div id = 'DownControl' class = 'PageControlDiv'></div></div>");
    $("div[id=PageDiv][class*=pgUp]").each(function(index, Target) {
        $("#UpControl").html("<button class = 'btn' onclick = 'onPgUp()'>Prev Page</button>");
    });
    $("div[id=PageDiv][class*=pgDown]").each(function(index, Target) {
        $("#DownControl").html("<button class = 'btn' onclick = 'onPgDown()'>Next Page</button>");
    });
    __ProductStart = Page * 20 + 1;
    __ProductEnd = __ProductStart + 19;
    if (__ProductEnd > MaxProduct) __ProductEnd = MaxProduct;
    if(__ProductStart == __ProductEnd) $("#PageControl").html("<h4>" + __ProductStart.toString() + " of " + MaxProduct.toString() + "</h4>");
    else $("#PageControl").html("<h4>" + __ProductStart.toString() + "~" + __ProductEnd.toString() + " of " + MaxProduct.toString() + "</h4>");
}

function submitRequest() {
    $.ajax({
        type: 'GET',
        url: "findProducts.php",
        data: RequestPara,
        success: function(data, textStatus, jqXHR) {
            $("#PraseData").html(data);
            if (MaxProduct == 0) {
                $("#PraseData").html("<tr><td colspan='6' style = 'text-align: center;'><h4>No Data</h4><button class = 'btn' onclick = 'resetData()'>Reset</button></td></tr>");
            }
            onQuerySuccess();
        },
        error: function() {
            $("#PraseData").html("<tr><td colspan='6' style = 'text-align: center;'><h4>Failed to talk to server</h4><button class = 'btn' onclick = 'onChange()'>Refresh</button></td></tr>");
        }
    });
}

function generateURL() {
    var level = $("select[name='level']").val();
    var inputvoltage = $("select[name='inputvoltage']").val();
    var ratedcapacity = $("select[name='ratedcapacity']").val();
    var ratedcurrent = $("select[name='ratedcurrent']").val();
    var ratedpower = $("select[name='ratedpower']").val();
    var weight = $("select[name='weight']").val();
    var request = String(level + "&" + inputvoltage + "&" + ratedcapacity + "&" + ratedcurrent + "&" + ratedpower + "&" + weight);

    var result = request.format({
        level: "a",
        inputvoltage: "c",
        ratedcapacitymin: "d",
        ratedcapacitymax: "e",
        ratedcurrentmin: "f",
        ratedcurrentmax: "g",
        ratedpowermin: "h",
        ratedpowermax: "i",
        weightmin: "j",
        weightmax: "k"
    });

    return result + "&p=" + Page;
}

function resetData() {
    $("select[name='level']").val("{level}=0");
    $("select[name='inputvoltage']").val("{inputvoltage}=0");
    $("select[name='ratedcapacity']").val("{ratedcapacitymin}=0&{ratedcapacitymax}=100000");
    $("select[name='ratedcurrent']").val("{ratedcurrentmin}=0&{ratedcurrentmax}=1000000");
    $("select[name='ratedpower']").val("{ratedpowermin}=0&{ratedpowermax}=100000");
    $("select[name='weight']").val("{weightmin}=0&{weightmax}=100000");
    onChange();
}
