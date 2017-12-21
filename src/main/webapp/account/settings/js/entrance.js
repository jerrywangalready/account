jQuery.namespace("entrance");
$(function () {

    entrance.js.init();
});

entrance.js = {};

entrance.js.init = function () {
    // 初始化查询项(必须先初始化字典表)

    //$("#cardManager").dict({table:"s_users",key:"username",value:"nickname"});

    $.post(path+'/maintainCard/getManagerOptions.do',{},function (data) {
        for(var i=0;i<data.length;i++){
            $("#cardManager").append("<option value='"+data[i].username+"'>"+data[i].nickname+"</option>")

        }
        $("#cardManager").selectpicker("refresh");
    });

};



entrance.js.save = function () {
    var param = $("#main_form").validate();

    $.ajax({
        type:'POST',
        url:path+'/maintainCard/save.do',
        contentType:'application/json',
        data:JSON.stringify(param),
        success:function (uuid) {
            //$("#uuid").val(uuid);
          parent.layer.msg("保存成功！");
          parent.maintainCard.js.init();
          comm.js.closeLayer();
        }

    });

};