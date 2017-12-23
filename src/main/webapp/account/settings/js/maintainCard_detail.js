jQuery.namespace("maintainCard_detail")
$(function () {
    maintainCard_detail.js.init();
});

maintainCard_detail.js = {};

maintainCard_detail.js.init = function(){

    var mc = getParameter(location.hash, "mc", "");
    var cardManager = $("#cardManager").attr("value");
    $.post(path+'/maintainCard/getManagerOptions.do',{},function (data) {
        for(var i=0;i<data.length;i++){
            $("#cardManager").append("<option value='"+data[i].username+"'>"+data[i].nickname+"</option>")
        }
        $("#cardManager").selectpicker("val",cardManager);
        $("#cardManager").selectpicker("refresh");
    });

    if(mc == "new") {
        maintainCard_detail.js.forUpdate();
    }else {
        $("[group=search]").show();
        $("#updateButton").show();
        $("#deleteButton").show();
        $("#entranceButton").show();
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
            var html = template('member_grid',{'list':data.list});
            $("#table_div").html(html);
            // 初始化页码按钮
            $("#page-bar").page(data);
        }
    });
};

maintainCard_detail.js.forUpdate = function () {
    $(".card_title_span").hide();
    $("#cardManagerNameDiv").hide();
    $("#cardName").show().focus();
    $("#cardManagerSelectDiv").show();
    $("#saveButton").show();
};
maintainCard_detail.js.forDeleteCard = function (uuid) {
    layer.confirm("确认删除此张饭卡?", function (index) {
        $.post(path + "/maintainCard/deleteCardInfo.do",{uuid: uuid},function(data){
            if(data == "true"){
                layer.close(index);
                maintainCard_detail.js.forBack();
            }else {
                layer.msg("操作失败,请联系管理员!");
            }
        });
    })
};
maintainCard_detail.js.forBack = function () {
    comm.js.hashRemove("mc")
};
maintainCard_detail.js.save = function () {
    var param = $("#main_form").validate();
    var ran = Math.random() * 100000;
    $.ajax({
        type:'POST',
        url:path+'/maintainCard/save.do',
        contentType:'application/json',
        data:JSON.stringify(param),
        success:function (uuid) {
            layer.msg("保存成功！");
            var obj = getParameter(location.hash, "obj", "");
            setHash("#on=settings/init&obj="+obj+"&ln=maintainCard&mc="+uuid+"&ran="+ran);
        }

    });

};
maintainCard_detail.js.updateUserInfo = function (userId) {

};

maintainCard_detail.js.removeUser = function (userId) {

};

maintainCard_detail.js.entrance = function (cardId) {
    layer.open({
        type:2,
        title:"增加成员",
        area:['375px','580px'],
        scrollbar:false,
        content:[path + '/maintainCard/entrance.do?cardId='+cardId, 'no']
    });
};
