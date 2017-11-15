jQuery.namespace("statistics");
$(function () {
    statistics.js.init();
});

statistics.js = {};

statistics.js.init = function () {
    var cardId = getParameter(location.hash, "obj", "");
    var collector = $("#query_box").collector();
    collector.cardId = cardId;

    // $.post(path + "/statistics/queryList.do",{cardId:cardId},function (data) {
    //     console.info(data);
    //     var html = template('demo_users',{'list':data.list});
    //     console.info(html);
    //     $("#table_div").html(html);
    //     // 初始化页码按钮
    //     $("#page-bar").page(data);
    // });
    console.info("12112121");
    $.ajax({
        type:'POST',
        url:path+"/statistics/queryList.do",
        contentType:'application/json',
        data:JSON.stringify(collector),
        success:function (data) {
            console.info(data);
            var html = template('demo_users',{'list':data.list});
            console.info(html);
            $("#table_div").html(html);
            // 初始化页码按钮
            $("#page-bar").page(data);
        }
    });
};
