jQuery.namespace("statistics");
$(function () {
    statistics.js.init();
});

statistics.js = {};

statistics.js.init = function () {

    // 初始化列表数据
    statistics.js.query();
    // 初始化回车事件
    $("#queryCode,#queryName").enter(function () {
        $("#query_box").query();
    });

};

statistics.js.query = function () {
    var cardId = getParameter(location.hash, "obj", "");
    var collector = $("#query_box").collector();

    collector.cardId = cardId;

    $.ajax({
        type:'POST',
        url:path+"/statistics/queryList.do",
        contentType:'application/json',
        data:JSON.stringify(collector),
        success:function (data) {
            var html = template('demo_users',{'list':data.list});
            $("#table_div").html(html);
            // 初始化页码按钮
            $("#page-bar").page(data);
        }
    });
};


statistics.js.detail = function (userId) {
    var cardId = getParameter(location.hash, "obj", "");
    var collector = $("#query_box").collector();
    collector.cardId = cardId;

    setHash("on=statistics/detail&obj="+cardId+"&un="+userId);

};