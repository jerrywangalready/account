jQuery.namespace("changeCardInfo");
$(function () {

    changeCardInfo.js.init();
});

changeCardInfo.js = {};

changeCardInfo.js.init = function () {
    console.info("123");
    //初始化卡片数据
    changeCardInfo.js.query();

    // 初始化查询项(必须先初始化字典表)

    //$("#cardManager").dict({table:"s_users",key:"username",value:"nickname"});

    $.post(path+'/maintainCard/getManagerOptions.do',{},function (data) {
        for(var i=0;i<data.length;i++){
            $("#cardManager").append("<option value='"+data[i].username+"'>"+data[i].nickname+"</option>")

        }
        $("#cardManager").selectpicker("refresh");
    });

};

changeCardInfo.js.query = function(){
    var uuid = $("#uuid").val();
    console.info(uuid);
    $.ajax({
        type:'POST',
        url:path+"/maintainCard/queryCardInfoByUuid.do",
        //contentType:'application/json',
        data:{"uuid":uuid},
        success:function (data) {
            console.info(data);
            var html = template('demo_cards',{'list':data});
            console.info(html);
            $("#table_div").html(html);
            //初始化页码按钮
            //$("#page-bar").page(data);
        }
    });
};


changeCardInfo.js.save = function () {
    var param = $("#main_form").validate();
    var managerName = $("#cardManager").val();
    param.cardManager = managerName;
    var cardColor = $("#cardColor").val();
    param.cardColor = cardColor;
    console.info(param);

    $.ajax({
        type:'POST',
        url:path+'/maintainCard/save.do',
        contentType:'application/json',
        data:JSON.stringify(param),
        success:function () {
            //$("#uuid").val(uuid);
          parent.layer.msg("保存成功！");
          parent.maintainCard.js.init();
          comm.js.closeLayer();
        }

    });

};