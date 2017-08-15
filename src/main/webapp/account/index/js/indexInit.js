jQuery.namespace("indexInit");
$(function () {

  indexInit.js.init();

});

indexInit.js = {};

indexInit.js.init = function () {
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

    var cardId = getParameter(location.hash, "obj", "");

    $.ajax({
        // 查询余额和当前日期
        type: 'POST',
        url: path + '/index/getBalance.do',
        async: false,
        // contentType: 'application/json',
        data: {cardId: cardId},
        success: function (data) {
            $("#balance").text(data.balance);
            $("#recordTime").val(data.today);
        }
    });

    indexInit.js.getInfo();

    // 修改日期重新获取信息
    $("#recordTime").change(function () {
        indexInit.js.getInfo();
    });

    indexInit.js.queryList();

    $("#breakfast,#lunch,#dinner,#other,#remark").enter(function () {
        indexInit.js.save();
    }).focus(function () {
        $(this).select();
    });

    // 初始化回车事件
    $("#startTime,#finishTime").change(function () {
        $("#query_box").query();
    });
};

indexInit.js.queryList = function () {
    var cardId = getParameter(location.hash, "obj", "");
    var collector = $("#query_box").collector();
    collector.cardId = cardId;
    $.ajax({
        type:'POST',
        url:path+"/index/queryList.do",
        contentType:'application/json',
        data:JSON.stringify(collector),
        success:function (data) {
            var html = template('queryList_template',{'list':data.list});
            $("#table_div").html(html);
            // 初始化页码按钮
            $("#page-bar").page(data);
        }
    });

};

indexInit.js.getInfo = function () {
    // 获取日期对应信息
    var recordTime = $("#recordTime").val();
    var cardId = getParameter(location.hash, "obj", "");
    $.ajax({
        type:'POST',
        async: false,
        url:path+'/index/getInfo.do',
        data:{cardId:cardId, recordTime:recordTime},
        success:function (data) {
            $("#uuid").val(data.uuid);
            $("#breakfast").val(data.breakfast);
            $("#lunch").val(data.lunch);
            $("#dinner").val(data.dinner);
            $("#other").val(data.other);
            $("#remark").val(data.remark);
        }

    });

};

indexInit.js.save = function () {

    var cardId = getParameter(location.hash, "obj", "");

    var param = $("#main_form").validate();
    param.cardId = cardId;
    $.ajax({
        type:'POST',
        url:path+'/index/save.do',
        contentType:'application/json',
        data:JSON.stringify(param),
        success:function (uuid) {
            $("#uuid").val(uuid);
            $.ajax({
                // 查询余额和当前日期
                type: 'POST',
                url: path + '/index/getBalance.do',
                async: false,
                // contentType: 'application/json',
                data: {cardId: cardId},
                success: function (data) {
                    var margeBalance = (data.balance - $("#balance").text()).toFixed(2);

                    $("#balance").text(data.balance);
                    var colorClass = "minus";
                    if(margeBalance > 0){
                        margeBalance = "+" + margeBalance;
                        colorClass = "plus";
                    }

                    indexInit.js.queryList();

                    if(margeBalance != 0){

                        // 上浮动画效果
                        var scrollT = $(document).scrollTop();
                        var bo = $("#balance").offset();
                        $("body").append("<div id='marge-balance' class='to-move' style='top:"+(bo.top-scrollT-10)+"px;left:"+(bo.left+60)+"px;position: fixed;z-index: 99999;'><span class='"+colorClass+"' style='font-size:20px;'>"+margeBalance+"</span></div>");
                        $("#marge-balance").animate({top:bo.top-scrollT-30},2000,"linear");
                        setTimeout(function () {
                            $("#marge-balance").remove();
                        },2100);
                    }

                }
            });
        }

    });



};

indexInit.js.showMore = function () {
    $("#moreButtonDiv").hide();
    $("div[name=moreDiv]").slideDown();
};