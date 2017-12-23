jQuery.namespace("entrance");
$(function () {

    entrance.js.init();

    $(window).hashchange(function () {
        entrance.js.init();
    });
});

entrance.js = {};

entrance.js.init = function () {
    entrance.js.query();
};

entrance.js.query = function () {
    var collector = $("#query_box").collector();
    collector.cardId = $("#cardId").val();
    $.ajax({
        type:'POST',
        url:path+"/maintainCard/queryUsersWithOutThisCard.do",
        contentType:'application/json',
        data:JSON.stringify(collector),
        success:function (data) {
            var html = template('queryUsersWithOutThisCard_template',{'list':data.list});
            $("#table_div").html(html);
            // 初始化页码按钮
            $("#page-bar").page(data,'noPS');
        }
    });
};



entrance.js.save = function (userId) {
    var cardId = $("#cardId").val();
    $.post(path + "/maintainCard/saveMember.do",{userId:userId, cardId: cardId},function(data){
            if(data == 'true'){
              parent.layer.msg("保存成功！");
              parent.maintainCard_detail.js.init();
              comm.js.closeLayer();
            }else {
                layer.msg("操作失败,请联系管理员!");
            }
    });

};