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
    // 获取登录用户权限
    $.post(path+"/settings/getRole.do",{},function (data) {
        for(var i=0;i<data.length;i++){
            if(data[i] == "superadmin"){
                $("li[labelName=maintainCard],li[labelName=manageAccount],li[labelName=memberMaintain]").removeClass("hidden");
                return false;
            }
            if(data[i] == "card_owner"){
                $("li[labelName=memberMaintain]").removeClass("hidden");
            }
        }
    });

    var label = getParameter(location.hash,"ln","changePassword");
    $(".right-box").load(path+"/settings/"+label+".do");

    $(".left-box li[labelName="+label+"]").addClass("cur-li");
    
};

settings.js.test =function(uuid){
    alert("ojojojj");
};