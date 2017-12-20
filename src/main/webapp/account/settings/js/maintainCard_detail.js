jQuery.namespace("maintainCard_detail")
$(function () {
    maintainCard_detail.js.init();
});

maintainCard_detail.js = {};

maintainCard_detail.js.init = function(){
    $.post(path+'/maintainCard/getManagerOptions.do',{},function (data) {
        console.info(data)
        for(var i=0;i<data.length;i++){
            $("#cardManager").append("<option value='"+data[i].username+"'>"+data[i].nickname+"</option>")

        }
        $("#cardManager").selectpicker("refresh");
    });
    maintainCard_detail.js.queryGrid();
};

maintainCard_detail.js.queryGrid = function () {
    var collector = $("#query_box").collector();
    var uuid = $("#uuid").val();
    collector.uuid = uuid;
    console.info(collector);
    $.ajax({
        type:'POST',
        url:path+"/maintainCard/queryCardUserInfo.do",
        contentType:'application/json',
        data:JSON.stringify(collector),
        success:function (data) {
            console.info(data)
            var html = template('users_info',{'list':data.list});
            $("#table_div").html(html);
            // 初始化页码按钮
            $("#page-bar").page(data);
        }
    });
};

maintainCard_detail.js.forUpdate = function () {
    $(".card_title_span").hide();
    $("#cardName").show().focus();
};
maintainCard_detail.js.forDeleteCard = function () {

};
maintainCard_detail.js.forBack = function () {
    comm.js.hashRemove("mc")
};

maintainCard_detail.js.updateUserInfo = function (userId) {

};

maintainCard_detail.js.removeUser = function (userId) {

};
