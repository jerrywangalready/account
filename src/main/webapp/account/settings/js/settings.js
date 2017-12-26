jQuery.namespace("settings");
$(function () {
    
    settings.js.init();
});

settings.js = {};

settings.js.init = function () {
    var obj = getParameter(location.hash, "obj", "");
    $(".left-box li").click(function () {
        var labelName = $(this).attr("labelName");
        setHash("#on=settings/init&obj="+obj+"&ln="+labelName);
    });
    // 获取登录用户权限
    $.ajax({
        type:'POST',
        url:path+'/settings/getRole.do',
        async: false,
        data:{},
        success:function (data) {
            for(var i=0;i<data.length;i++){
                if(data[i] == "superadmin"){
                    $("li[labelName=maintainCard],li[labelName=manageAccount]").removeClass("hidden");
                    return false;
                }
                if(data[i] == "card_owner"){
                    $("li[labelName=maintainCard]").removeClass("hidden");
                }
            }
        }

    });

    var initLable = $(".left-box li:visible:eq(0)").attr("labelName");
    var label = getParameter(location.hash,"ln",initLable);
    $(".right-box").load(path+"/settings/"+label+".do");

    $(".left-box li[labelName="+label+"]").addClass("cur-li");
    
};
