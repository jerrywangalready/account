jQuery.namespace("addCardInfo");
$(function () {
    addCardInfo.js.init();
});

addCardInfo.js = {};

addCardInfo.js.init = function () {
    console.info("123");
    // 初始化查询项(必须先初始化字典表)

    $("#cardManager").dict({table:"s_users",key:"username",value:"nickname"});

};

addCardInfo.js.save = function () {

    var param = $("#main_form").validate();

    $.ajax({
        type:'POST',
        url:path+'/maintainCard/save.do',
        contentType:'application/json',
        data:JSON.stringify(param),
        success:function (uuid) {
            //$("#uuid").val(uuid);
           layer.msg("保存成功！")
        }

    });

};