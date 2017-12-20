jQuery.namespace("maintainCard_detail")
$(function () {
    maintainCard_detail.js.init();
});

maintainCard_detail.js = {};

maintainCard_detail.js.init = function(){

    var mc = getParameter(location.hash, "mc", "");

    $.post(path+'/maintainCard/getManagerOptions.do',{},function (data) {
        for(var i=0;i<data.length;i++){
            $("#cardManager").append("<option value='"+data[i].username+"'>"+data[i].nickname+"</option>")
        }
        $("#cardManager").selectpicker("refresh");
    });

    if(mc == "new") {
        maintainCard_detail.js.forUpdate();
    }else {
        $("[group=search]").show();
        maintainCard_detail.js.queryGrid();
    }

};

maintainCard_detail.js.queryGrid = function () {
    var collector = $("#query_box").collector();
    collector.uuid = $("#uuid").val();
    $.ajax({
        type:'POST',
        url:path+"/maintainCard/queryCardUserInfo.do",
        contentType:'application/json',
        data:JSON.stringify(collector),
        success:function (data) {
            console.info(data)
            var html = template('member_grid',{'list':data.list});
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
maintainCard_detail.js.save = function () {
    var param = $("#main_form").validate();

    $.ajax({
        type:'POST',
        url:path+'/maintainCard/save.do',
        contentType:'application/json',
        data:JSON.stringify(param),
        success:function (uuid) {
            parent.layer.msg("保存成功！");
            var obj = getParameter(location.hash, "obj", "");
            setHash("#on=settings/init&obj="+obj+"&ln=maintainCard&mc="+uuid);
        }

    });

};
maintainCard_detail.js.updateUserInfo = function (userId) {

};

maintainCard_detail.js.removeUser = function (userId) {

};
