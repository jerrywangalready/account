jQuery.namespace("settings");
$(function () {
    
    settings.js.init();
});

settings.js = {};

settings.js.init = function () {

    $(".left-box li").click(function () {
        var labelName = $(this).attr("labelName");
        comm.js.hashAppand("ln",labelName);
    });

    var label = getParameter(location.hash,"ln","changePassword");
    $(".right-box").load(path+"/settings/"+label+".do");

    $(".left-box li[labelName="+label+"]").addClass("cur-li");
    
};