jQuery.namespace("statisticsDetail");
$(function () {
    statisticsDetail.js.init();
});

statisticsDetail.js = {};

statisticsDetail.js.init = function () {
    // 完成时间
    $('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        // todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

    // 初始化列表数据
    statisticsDetail.js.query();

    // 初始化回车事件
    $("#startTime,#finishTime").change(function () {
        $("#query_box").query();
    });

};

statisticsDetail.js.query = function () {
    var cardId = getParameter(location.hash, "obj", "");
    var userId = getParameter(location.hash, "un", "");
    var collector = $("#query_box").collector();
    collector.cardId = cardId;
    collector.userId = userId;

    /*var startTime = $("#startTime").val();
    var finishTime = $("#finishTime").val();
    collector.startTime = startTime;
    collector.finishTime = finishTime;*/
    console.info(collector);
    $.ajax({
        type:'POST',
        url:path+"/statistics/queryDetailList.do",
        contentType:'application/json',
        data:JSON.stringify(collector),
        success:function (data) {
            console.info(data);
            var html = template('queryList_template',{'list':data.list});
            console.info(html);
            $("#table_div").html(html);
            // 初始化页码按钮
            $("#page-bar").page(data);
        }
    });
};


