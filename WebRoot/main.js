String.prototype.format = function(args) 
{
    var result = this;
    if (arguments.length > 0) 
    {
        if (arguments.length == 1 && typeof (args) == "object") 
        {
            for (var key in args) 
            {
                if(args[key]!=undefined)
                {
                    var reg = new RegExp("({" + key + "})", "g");
                    result = result.replace(reg, args[key]);
                }
            }
        }
        else 
        {
            for (var i = 0; i < arguments.length; i++) 
            {
                if (arguments[i] != undefined) 
                {
                    var reg= new RegExp("({)" + i + "(})", "g");
                    result = result.replace(reg, arguments[i]);
                }
            }
        }
    }
    return result;
}


function onChange()
{
    var _Target = $("#PraseData");
    _Target.html("<tr><td colspan='6'><p>Querying...</p></td></tr>");
    var Selected=$("option:selected");
    var Unselected=$("option").not("option:selected");
    Selected.addClass("OptionSelectStyle");
    Unselected.removeClass("OptionSelectStyle");

    querySubmit();
}

function querySubmit()
{
    var _level=$("select[name='level']").val();
    var _inputvoltage=$("select[name='inputvoltage']").val();
    var _ratedcapacity=$("select[name='ratedcapacity']").val();
    var _ratedcurrent=$("select[name='ratedcurrent']").val();
    var _ratedpower=$("select[name='ratedpower']").val();
    var _weight=$("select[name='weight']").val();
    
    var para = String(_level+"&"+_inputvoltage+"&"+_ratedcapacity+"&"+_ratedcurrent+"&"+_ratedpower+"&"+_weight);
    
    var result = para.format({
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
    
    ajaxSubmit(result);
}

function ajaxSubmit(strSubmit)
{
    $.ajax({
        type: 'GET',
        url: "findAllServlet",
        data: strSubmit,
        success: function(data, textStatus, jqXHR)
        {
            var _Target = $("#PraseData");
            _Target.html(data);
            if(data.indexOf('<')==-1)
            {
                _Target.html("<tr><td colspan='6'><p>No Data</p><a href='javascript:resetData()'>Reset</a></td></tr>");
            }
        },
        error: function()
        {
            var _Target = $("#PraseData");
            _Target.html("<tr><td colspan='6'><p>Failed to talk to server</p><a href='javascript:resetData()'>Reset</a></td></tr>");          
        }
    });
}


var FilterOn;
$( document ).ready(function() {
    onChange();
    FilterOn = true;
});

function resetData()
{
    $("select[name='level']").val("{level}=0");
    $("select[name='inputvoltage']").val("{inputvoltage}=0");
    $("select[name='ratedcapacity']").val("{ratedcapacitymin}=0&{ratedcapacitymax}=100000");
    $("select[name='ratedcurrent']").val("{ratedcurrentmin}=0&{ratedcurrentmax}=1000000");
    $("select[name='ratedpower']").val("{ratedpowermin}=0&{ratedpowermax}=100000");
    $("select[name='weight']").val("{weightmin}=0&{weightmax}=100000");
    onChange();
}

function ToggleFilter()
{
    var linkObj = $("#FilterLink");
    var selectObj = $("#FilterRow");

    if(FilterOn)
    {
        FilterOn = false;
        selectObj.fadeOut();
        linkObj.html("Show Filter");
    }
    else
    {
        FilterOn = true;
        selectObj.fadeIn();
        linkObj.html("Hide Filter");
    }
}
