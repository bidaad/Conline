//-----------------------------------------------------------
String.prototype.replaceAll = function (strTarget, strSubString) {
    var strText = this;
    var intIndexOfMatch = strText.indexOf(strTarget);
    while (intIndexOfMatch != -1) {
        strText = strText.replace(strTarget, strSubString)
        intIndexOfMatch = strText.indexOf(strTarget);
    }
    return (strText);
}

// این قسمت مختصات اشاره گر موس را ذخیره میکند
// Detect if the browser is IE or not.
// If it is not IE, we assume that the browser is NS.
var IE = document.all ? true : false
// If NS -- that is, !IE -- then set up for mouse capture
if (!IE) document.captureEvents(Event.MOUSEMOVE)
// Set-up to use getMouseXY function onMouseMove
document.onmousemove = getMouseXY;
// Temporary variables to hold mouse x-y pos.s
var mouseX = 0
var mouseY = 0
// Main function to retrieve mouse x-y pos.s
function getMouseXY(e) {
    try {
        if (IE) { // grab the x-y pos.s if browser is IE
            mouseX = event.clientX + document.body.scrollLeft
            mouseY = event.clientY + document.body.scrollTop
        } else {  // grab the x-y pos.s if browser is NS
            mouseX = e.pageX
            mouseY = e.pageY
        }
        // catch possible negative values in NS4
        if (mouseX < 0) { mouseX = 0 }
        if (mouseY < 0) { mouseY = 0 }
    }
    catch (e) {mouseX = 300;mouseY = 300; }
    return true
}

var AppName = "ConLine";

 
function isChild(s,d) {
	while(s) {
		if (s==d) 
			return true;
		s=s.parentNode;
	}
	return false;
}

function IsOnlyNumber()
{

var returnValue = false;
var keyCode = (window.event.which) ? window.event.which : window.event.keyCode;
if ( ((keyCode >= 48) && (keyCode <= 57)) ||
(keyCode == 8) ||
(keyCode == 9) ||
(keyCode == 46) || 
(keyCode == 46) || 
(keyCode == 13) ) 
returnValue = true;

if ( window.event.returnValue )
window.event.returnValue = returnValue;
return returnValue;
}
function IsOnlyNumberAndSlash()
{
var returnValue = false;
var keyCode = (window.event.which) ? window.event.which : window.event.keyCode;
if ( ((keyCode >= 47) && (keyCode <= 57)) ||
(keyCode == 8) || 
(keyCode == 9) || 
(keyCode == 13) ) 
returnValue = true;

if ( window.event.returnValue )
window.event.returnValue = returnValue;

return returnValue;
}

function GotoUrl(Url)
{
    window.location.href = Url
}

function getObj(objID)
{
    if (document.getElementById) {return document.getElementById(objID);}
    else if (document.all) {return document.all[objID];}
    else if (document.layers) {return document.layers[objID];}
}
function ShowNews(NewsCode)
{
    window.open("Forms/News/ShowNews.aspx?Code=" + NewsCode, 'News','width=700,height=600,top=10')
}
/****************************************** LookUpTree ************************************************/



function OpenTree(BaseID, ImgObj, parameters) {
    //        FormFieldCode = ImgObj.parentNode.parentNode.parentNode.parentNode.rows[0].cells[1].childNodes[0].name;
    //        FormFieldName = ImgObj.parentNode.parentNode.parentNode.parentNode.rows[0].cells[0].childNodes[1].name;

    //		whList = window.open('../GetTree.aspx?GetVal=1&BaseID=' + BaseID + '&FFC=' + FormFieldCode + '&FFN=' + FormFieldName ,'','width=450,height=450,menubar=no,status=no,titlebar=no,resizable=no,top=200,left=150');
    FormFieldCode = ImgObj.parentNode.parentNode.parentNode.parentNode.rows[0].cells[1].childNodes[0].name;
    FormFieldName = ImgObj.parentNode.parentNode.parentNode.parentNode.rows[0].cells[0].childNodes[0].name;
    if (parameters) {
        if (parameters.length > 0) parameters = "&" + parameters;
    }
    whList = window.open('../../GetTree.aspx?GetVal=1&BaseID=' + BaseID + '&FFC=' + FormFieldCode + '&FFN=' + FormFieldName + parameters, '', 'width=450,height=450,menubar=no,status=no,titlebar=no,scrollbars,resizable,top=200,left=150');
}
/****************************************** LookUpTree ************************************************/

var http_request = null;
var DelObj = null;
function startRequest(url, Func, Method, Param, UpdateObj) { 
    DelObj = UpdateObj;
    if (window.XMLHttpRequest) { 
       http_request = new XMLHttpRequest(); 
    } 
    else if (window.ActiveXObject) { 
       http_request = new ActiveXObject('Microsoft.XMLHTTP'); 
    } 
    url = url + '&rnd=' + Math.random();
    http_request.onreadystatechange = Func;
    http_request.open(Method, url, true); 
    if( Method == 'GET')
       http_request.send(null); 
    else
       http_request.send(Param); 
} 


function CallPrint(strid)
{
 var prtContent = document.getElementById(strid);
 var WinPrint = window.open('','','letf=0,top=0,width=1,height=1,toolbar=0,scrollbars=1,status=0');
 WinPrint.document.write("<link href=\"../styles/main.css\" rel=\"stylesheet\" type=\"text/css\">" +  prtContent.innerHTML);
 WinPrint.document.close();
 WinPrint.focus();
 WinPrint.resizeTo(document.getElementById("ctl00_cphMain_tblList").offsetWidth + 30,document.getElementById("ctl00_cphMain_tblList").offsetHeight + 180 );
 WinPrint.print();
 WinPrint.close();
}
function OpenWin(Link, Width, Height)
{
  leftVal = (screen.width - Width) / 2;
  topVal = (screen.height - Height) / 2;
  window.open(Link,'','width=' + Width + ',height=' + Height + ',menubar=no,status=no,titlebar=no,scrollbars=yes,resizable=yes,top=' + topVal + ',left=' + leftVal );
}

function CorrectText(str)
{
    return str.replace('ی', 'ی').replace('ی', 'ی').replace('ى', 'ی').replace('ك', 'ک')
            .replace('٠', '۰').replace('١', '۱').replace('٢', '۲').replace('٣', '۳').replace('٤', '۴')
            .replace('٥', '۵').replace('٦', '۶').replace('٧', '۷').replace('٨', '۸').replace('٩', '۹')
}

function UnEnc(str) {
    str = str.replaceAll("۰", "0")
    str = str.replaceAll("۱", "1")
    str = str.replaceAll("۲", "2")
    str = str.replaceAll("۳", "3")
    str = str.replaceAll("۴", "4")
    str = str.replaceAll("۵", "5")
    str = str.replaceAll("۶", "6")
    str = str.replaceAll("۷", "7")
    str = str.replaceAll("۸", "8")
    str = str.replaceAll("۹", "9")
    return str;

}
function ChangeEnc(str) {
    str = str.replaceAll("0", "۰")
    str = str.replaceAll("1", "۱")
    str = str.replaceAll("2", "۲")
    str = str.replaceAll("3", "۳")
    str = str.replaceAll("4", "۴")
    str = str.replaceAll("5", "۵")
    str = str.replaceAll("6", "۶")
    str = str.replaceAll("7", "۷")
    str = str.replaceAll("8", "۸")
    str = str.replaceAll("9", "۹")
    return str;
}


function PrintStr()
{
    CallPreviewPrint('PrintArea');
}


function createCookie(name,value,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}

function eraseCookie(name) {
	createCookie(name,"",-1);
}

function ChangeEnc2(str)
{
    var Result = str;
/*
    Result = Result.replaceAll("0", "۰");
    Result = Result.replaceAll("1", "۱");
    Result = Result.replaceAll("2", "۲");
    Result = Result.replaceAll("3", "۳");
    Result = Result.replaceAll("4", "۴");
    Result = Result.replaceAll("5", "۵");
    Result = Result.replaceAll("6", "۶");
    Result = Result.replaceAll("7", "۷");
    Result = Result.replaceAll("8", "۸");
    Result = Result.replaceAll("9", "۹");
    */

    return Result;
} 


function ShowPrintNews(Code) {
    window.open('PrintNews.aspx?Code=' + Code, 'PrintPage', '');
}


function PrintNews() {
    document.p
}

var OpenPrint = function (Code) {
    //var win = window.print();

};
var OpenEmail = function (Code) {
    var win = window.open('/News/SendTo.aspx?Code=' + Code, 'Print', 'width=330,height=270,menubar=no,scrollbars=no');
    if (!win) {
        alert("پنجره باز نشد");
    };
    return false;
};

function ActivateTextBox(objTextBox) {
    objTextBox.className = 'ActiveTextBox'
    if (objTextBox.value == 'جستجو ...')
        objTextBox.value = '';
}

function updateClock() {
    var currentTime = new Date();

    var currentHours = currentTime.getHours();
    var currentMinutes = currentTime.getMinutes();
    var currentSeconds = currentTime.getSeconds();

    // Pad the minutes and seconds with leading zeros, if required
    currentMinutes = (currentMinutes < 10 ? "0" : "") + currentMinutes;
    currentSeconds = (currentSeconds < 10 ? "0" : "") + currentSeconds;

    // Choose either "AM" or "PM" as appropriate
    var timeOfDay = (currentHours < 12) ? "AM" : "PM";

    // Convert the hours component to 12-hour format if needed
    currentHours = (currentHours > 12) ? currentHours - 12 : currentHours;

    // Convert an hours component of "0" to "12"
    currentHours = (currentHours == 0) ? 12 : currentHours;

    // Compose the string for display
    var currentTimeString = ChangeEnc(currentHours) + ":" + ChangeEnc(currentMinutes) + ":" + ChangeEnc(currentSeconds); //  + " " + timeOfDay;

    // Update the time display
    //document.getElementById("clock").innerHTML = currentTimeString;
}

function loadBack2Up() {
    var pxShow = 300;
    var fadeInTime = 1000;
    var fadeOutTime = 1000;
    var scrollSpeed = 1000;
    $(window).scroll(function () {
        if ($(window).scrollTop() >= pxShow) {
            $("#backtotop").fadeIn(fadeInTime);
        } else {
            $("#backtotop").fadeOut(fadeOutTime);
        }
    });

    $('#backtotop a').click(function () {
        $('html, body').animate({ scrollTop: 0 }, scrollSpeed);
        return false;
    });
}

$(function () {
    $(document).ready(function () {
        loadBack2Up();

        $("area[rel^='prettyPhoto']").prettyPhoto();

        $(".gallery:first a[rel^='prettyPhoto']").prettyPhoto({ animation_speed: 'normal', theme: 'light_square', slideshow: 3000, autoplay_slideshow: false });
        $(".gallery:gt(0) a[rel^='prettyPhoto']").prettyPhoto({ animation_speed: 'fast', slideshow: 10000, hideflash: true });

        $("#custom_content a[rel^='prettyPhoto']:first").prettyPhoto({
            custom_markup: '<div id="map_canvas" style="width:260px; height:265px"></div>',
            changepicturecallback: function () { initialize(); }
        });

        $("#custom_content a[rel^='prettyPhoto']:last").prettyPhoto({
            custom_markup: '<div id="bsap_1259344" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div><div id="bsap_1237859" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6" style="height:260px"></div><div id="bsap_1251710" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div>',
            changepicturecallback: function () { _bsap.exec(); }
        });

        window.focus();

    });
});

var IsLoadingMoreNews = false;
var LatestPageNo = 1;
function LoadMoreNews() {
    //return;
    if(IsLoadingMoreNews)
    return;

    var PreviuousPage = LatestPageNo;
    LatestPageNo++;

    $("#LoadMoreArea" + PreviuousPage).html("<img src='images/bigloading.gif' />");
    IsLoadingMoreNews = true;
    $.ajax({
        type: "POST",
        async: true,
        cache: false,
        dataType: "html",
        data: { PageNo: LatestPageNo },
        url: "postback/MoreNews.aspx",
        success: function (data) {
            IsLoadingMoreNews = false;
            $("#LoadMoreArea" + PreviuousPage).html(data);

            $("area[rel^='prettyPhoto']").prettyPhoto();

            $(".gallery:first a[rel^='prettyPhoto']").prettyPhoto({ animation_speed: 'normal', theme: 'light_square', slideshow: 3000, autoplay_slideshow: false });
            $(".gallery:gt(0) a[rel^='prettyPhoto']").prettyPhoto({ animation_speed: 'fast', slideshow: 10000, hideflash: true });

            $("#custom_content a[rel^='prettyPhoto']:first").prettyPhoto({
                custom_markup: '<div id="map_canvas" style="width:260px; height:265px"></div>',
                changepicturecallback: function () { initialize(); }
            });

            $("#custom_content a[rel^='prettyPhoto']:last").prettyPhoto({
                custom_markup: '<div id="bsap_1259344" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div><div id="bsap_1237859" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6" style="height:260px"></div><div id="bsap_1251710" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div>',
                changepicturecallback: function () { _bsap.exec(); }
            });
            
        }
    });
}

function ScrollToItem(elementtoScrollToID) {
    $('html, body').animate({
        scrollTop: $("#News" + elementtoScrollToID).offset().top
    }, 2000);
}

function ShowMore(ContentID) {
    $("#" + ContentID).slideToggle("slow");
}


function GetNewsComment(NewsCode, LoadingPanel, LoadArea) {
    if (!$("#" + LoadArea).hasClass('Hidden')) {
        $("#" + LoadArea).slideUp("slow");
        $("#" + LoadArea).addClass('Hidden')
        $("#SendForm" + NewsCode).addClass('Hidden')

        return;
    }


    $("#" + LoadingPanel).html("<img src='images/bigloading.gif' />");
    var vpage, vperpage;
    vperpage = "20";
    var nextPage, prevPage, lastPage;
    nextPage = vpage + 1;
    prevPage = vpage - 1;


    var mainrow = "<div class=\"CommentReplyHeader\"><div class=\"Name\">{Name}</div><div class=\"SendDate\">{SDate}</div></div><div class=\"Clear\"></div><div class=\"Comment\"><img alt=\"\" src=\"/images/site/comments.gif\" style=\"padding-left: 3px;\">{TextComment}</div><div class=\"Clear\"></div>";

    var numStatus = 0;
    var t = 0;
    var Counter = 0;
    var row = ""; var allrow = "";
    $.ajax({
        type: "POST",
        async: true,
        cache: false,
        dataType: "json",
        data: { ActionType: 1, NewsCode: NewsCode },
        url: "postback/Comments.aspx",
        success: function (data) {
            $.each(data, function (index) {

                row = mainrow.replaceAll("{Name}", this['Name']);
                row = row.replaceAll("{SDate}", ChangeEnc(this['SDate']));
                row = row.replaceAll("{TextComment}", this['TextComment']);

                if (Counter % 2 == 0)
                    row = row.replaceAll("{CellClass}", "CellGrayLarge");
                else
                    row = row.replaceAll("{CellClass}", "CellWhiteLarge");

                allrow = allrow + row;
                t = 1;
                Counter++;
            }
        );


            var HTMLForm = $("#CommentSendForm").html();

            HTMLForm = HTMLForm.replace('txtComment', 'txtComment' + NewsCode)

            HTMLForm = HTMLForm.replace('txtName', 'txtName' + NewsCode)
            HTMLForm = HTMLForm.replace('txtEmail', 'txtEmail' + NewsCode)
            HTMLForm = HTMLForm.replace('btnSendComment', 'btnSendComment' + NewsCode)
            $("#SendForm" + NewsCode).html(HTMLForm);
            $("#SendForm" + NewsCode).removeClass('Hidden')


            $("#btnSendComment" + NewsCode).click(function () {
                Name = $("#txtName" + NewsCode).val();
                Email = $("#txtEmail" + NewsCode).val();
                SendComment = $("#txtComment" + NewsCode).val();

                $.ajax({
                    type: "POST",
                    async: true,
                    cache: false,
                    dataType: "json",
                    data: { ActionType: 2, NewsCode: NewsCode, Name: Name, Email: Email, Comment: SendComment },
                    url: "postback/Comments.aspx",
                    success: function (data) {

                        $("#SendForm" + NewsCode).addClass('Round');
                        $("#SendForm" + NewsCode).addClass('Farsi');
                        $("#SendForm" + NewsCode).html(data.result);
                    }
                });

            });

            if (t == 1) {
                $("#" + LoadArea).html(allrow);
                $("#" + LoadArea).slideDown("slow");
                $("#" + LoadingPanel).html("");

                $("#" + LoadArea).removeClass('Hidden')
            }
            else {
                $("#" + LoadArea).html("<div  class='Round'>هیچ نظری ثبت نشده است</div>");
                $("#" + LoadArea).slideDown("slow");
                $("#" + LoadingPanel).html("");
                $("#" + LoadArea).removeClass('Hidden')

            }

        }
    });


}



function SendLike(NewsCode, LoadingPanel) {
    $("#" + LoadingPanel).html("<img src='images/bigloading.gif' />");

    var CurLikeCount = $("#Like" + NewsCode).html()
    //intCurLikeCount = UnEnc(CurLikeCount);

    $.ajax({
        type: "POST",
        async: true,
        cache: false,
        dataType: "json",
        data: { ActionType: 3, NewsCode: NewsCode },
        url: "postback/Comments.aspx",
        success: function (data) {

            if (data.result == "OK") {
                CurLikeCount = parseInt(CurLikeCount, 10);
                CurLikeCount++;

                //PersianLikeNumber = ChangeEnc(intCurLikeCount + '');

                $("#Like" + NewsCode).html(CurLikeCount)
            }
            $("#" + LoadingPanel).html("");
        }
    });


}

$('img').bind('contextmenu', function (e) {
    return false;
});

var SubMenuLoaded = 0;
var StaticShow = 0;

$(document).ready(function () {
    $(".VMenuItem").mouseleave(function () {
        if (SubMenuLoaded != 1)
            $(".VMenuItem").removeClass('MenuSelected');
    });
    $(".SubMenu").mouseleave(function () {
        SubMenuLoaded = 0;
        $(".VMenuItem").removeClass('MenuSelected');
    });


    $("#mnuDelay").hoverIntent(function () {
        $(".VMenuItem").removeClass('MenuSelected');
        $("#mnuDelay").addClass('MenuSelected');
        $(".SubMenu").addClass('hide');
        $("#submenuCellPhone").removeClass('hide');
        $("#submenuCellPhone").fadeIn();

        SubMenuLoaded = 1;
    });
    $("#mnuHajmDehande").hoverIntent(function () {
        $(".VMenuItem").removeClass('MenuSelected');
        $("#mnuHajmDehande").addClass('MenuSelected');

        $(".SubMenu").addClass('hide');
        $("#submenuTablet").removeClass('hide');
        $("#submenuTablet").fadeIn();
        SubMenuLoaded = 1;
    });
    $("#mnuCondom").hoverIntent(function () {
        $(".VMenuItem").removeClass('MenuSelected');
        $("#mnuCondom").addClass('MenuSelected');

        $(".SubMenu").addClass('hide');
        $("#submenuMode").removeClass('hide');
        $("#submenuMode").fadeIn();
        SubMenuLoaded = 1;
    });
    $("#mnuAmzGel").hoverIntent(function () {
        $(".VMenuItem").removeClass('MenuSelected');
        $("#mnuAmzGel").addClass('MenuSelected');

        $(".SubMenu").addClass('hide');
        $("#submenuAmzGel").removeClass('hide');
        $("#submenuAmzGel").fadeIn();
        SubMenuLoaded = 1;
    });
    $("#mnuTightener").hoverIntent(function () {
        $(".VMenuItem").removeClass('MenuSelected');
        $("#mnuTightener").addClass('MenuSelected');

        $(".SubMenu").addClass('hide');
        $("#submenuCam").removeClass('hide');
        $("#submenuCam").fadeIn();
        SubMenuLoaded = 1;
    });
    $("#mnuOffice").hoverIntent(function () {
        $(".VMenuItem").removeClass('MenuSelected');
        $("#mnuOffice").addClass('MenuSelected');

        $(".SubMenu").addClass('hide');
        $("#submenuOffice").removeClass('hide');
        $("#submenuOffice").fadeIn();
        SubMenuLoaded = 1;
    });
    $("#mnuElec").hoverIntent(function () {
        $(".VMenuItem").removeClass('MenuSelected');
        $("#mnuElec").addClass('MenuSelected');

        $(".SubMenu").addClass('hide');
        $("#submenuElec").removeClass('hide');
        $("#submenuElec").fadeIn();
        SubMenuLoaded = 1;
    });
    $("#mnuHomeTools").hoverIntent(function () {
        $(".VMenuItem").removeClass('MenuSelected');
        $("#mnuHomeTools").addClass('MenuSelected');

        $(".SubMenu").addClass('hide');
        $("#submenuHomeTools").removeClass('hide');
        $("#submenuHomeTools").fadeIn();
        SubMenuLoaded = 1;
    });
    $("#mnuToy").hoverIntent(function () {
        $(".VMenuItem").removeClass('MenuSelected');
        $("#mnuToy").addClass('MenuSelected');

        $(".SubMenu").addClass('hide');
        $("#submenuToy").removeClass('hide');
        $("#submenuToy").fadeIn();
        SubMenuLoaded = 1;
    });
    $("#mnuLifeStyle").hoverIntent(function () {
        $(".VMenuItem").removeClass('MenuSelected');
        $("#mnuLifeStyle").addClass('MenuSelected');

        $(".SubMenu").addClass('hide');
        $("#submenuLifeStyle").removeClass('hide');
        $("#submenuLifeStyle").fadeIn();
        SubMenuLoaded = 1;
    });
    $("#mnuBook").hoverIntent(function () {
        $(".VMenuItem").removeClass('MenuSelected');
        $("#mnuBook").addClass('MenuSelected');

        $(".SubMenu").addClass('hide');
        $("#submenuBook").removeClass('hide');
        $("#submenuBook").fadeIn();
        SubMenuLoaded = 1;
    });

    /*
    $("#submenuCellPhone").mouseleave(function () {
    if ($("#submenuCellPhone").css('display') == 'block') {
    $("#submenuCellPhone").addClass('hide');
    $("#submenuCellPhone").fadeOut();
    SubMenuLoaded = 0;
    }
    });
    $("#submenuTablet").mouseleave(function () {
    if ($("#submenuTablet").css('display') == 'block') {
    $("#submenuTablet").addClass('hide');
    $("#submenuTablet").fadeOut();
    SubMenuLoaded = 0;
    }
    });
    */
    $(".SubMenuCont").mouseleave(function () {
        $(".SubMenu").addClass('hide');
        $(".SubMenu").fadeOut();
        SubMenuLoaded = 0;
        $(".VMenuItem").removeClass('MenuSelected');

    });


    $(".MenuContent").mouseleave(function () {
        $("#submenuCellPhone").addClass('hide');
        $("#submenuCellPhone").fadeOut();
    });

    $(".VerMenu").mouseleave(function () {
        if (StaticShow != 1)
            $(".MenuContent").addClass('hide');
    });

    $(".VerMenu").mouseenter(function () {
        MainMenuLoaded = 0;
        ToggleMainMenu();
    });

    $("#product-bestsales").trigger('click');

});


$(document).click(function () {
    $(".SubMenu").addClass('hide');
});

var MainMenuLoaded = 0;
function ToggleMainMenu() {
    if (MainMenuLoaded == 0) {
        $(".MenuContent").removeClass('hide');
        MainMenuLoaded = 1;
    }
    else {
        if (StaticShow != 1) {
            $(".MenuContent").addClass('hide');
            MainMenuLoaded = 0;
        }
    }
}

function showPass(b) {
    var a = b.closest("div").find("input");
    a.get(0).type = "text";
    b.css("background-color", "#FCEC63") 
}
function hidePass(b) {
    var a = b.closest("div").find("input");
    a.get(0).type = "password";
    b.css("background-color", "") 
};


(function ($) {

    $.fn.extend({

        hoverZoom: function (settings) {

            var defaults = {
                overlay: true,
                overlayColor: '#2e9dbd',
                overlayOpacity: 0.7,
                zoom: 25,
                speed: 300
            };

            var settings = $.extend(defaults, settings);

            return this.each(function () {

                var s = settings;
                var hz = $(this);
                var image = $('img', hz);

                image.load(function () {

                    if (s.overlay === true) {
                        $(this).parent().append('<div class="zoomOverlay" />');
                        $(this).parent().find('.zoomOverlay').css({
                            opacity: 0,
                            display: 'block',
                            backgroundColor: s.overlayColor
                        });
                    }

                    var width = $(this).width();
                    var height = $(this).height();

                    $(this).fadeIn(1000, function () {
                        $(this).parent().css('background-image', 'none');
                        hz.hover(function () {
                            $('img', this).stop().animate({
                                height: height + s.zoom,
                                marginLeft: -(s.zoom),
                                marginTop: -(s.zoom)
                            }, s.speed);
                            if (s.overlay === true) {
                                $(this).parent().find('.zoomOverlay').stop().animate({
                                    opacity: s.overlayOpacity
                                }, s.speed);
                            }
                        }, function () {
                            $('img', this).stop().animate({
                                height: height,
                                marginLeft: 0,
                                marginTop: 0
                            }, s.speed);
                            if (s.overlay === true) {
                                $(this).parent().find('.zoomOverlay').stop().animate({
                                    opacity: 0
                                }, s.speed);
                            }
                        });
                    });
                });
            });
        }
    });
})(jQuery);

function ShowGroupProducts(ClassName, obj) {
    $(".option-set li a").removeClass('OptionActivated');
    $(".ProListItem").addClass('hide');
    $("." + ClassName).removeClass('hide');
    $("." + ClassName).fadeIn();
    var NewText = '';
    $(obj).addClass('OptionActivated');
    
    switch (ClassName) {
        case 'product-bestsales':
            NewText = 'پرفروش ترین ها';
            break;
        case 'product-new':
            NewText = 'جدیدترین ها';
            break;
        case 'product-sale':
            NewText = 'تخفیفها';
            break;
        case 'product-featured':
            NewText = 'پیشنهادات ویژه';
            break;
    default:
        
    }
    $(".Caption").html(NewText).fadeIn();


}



function checkBrowser(e) {
    if (window.event)
        key = window.event.keyCode;     //IE
    else
        key = e.which; //firefox
    return key;
}

function setEnterValue(e) {
    var key = checkBrowser(e);
    if (key == 13) {
        $("#txtKeyword").val($("#txtKeywordRight").val())
        window.location.href = '/Products/?Keyword=' + $("#txtKeywordRight").val();
        e.stopPropagation();
    }
}