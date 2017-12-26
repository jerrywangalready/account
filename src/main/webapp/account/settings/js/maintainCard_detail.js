jQuery.namespace("maintainCard_detail")
$(function () {
    maintainCard_detail.js.init();
});

maintainCard_detail.js = {};

maintainCard_detail.js.role = "";

maintainCard_detail.js.init = function(){

    // 获取登录用户权限
    $.ajax({
        type:'POST',
        url:path+'/settings/getRole.do',
        async: false,
        data:{},
        success:function (data) {
            for(var i=0;i<data.length;i++){
                if(data[i] == "card_owner"){
                    maintainCard_detail.js.role = "card_owner";
                }
            }
        }

    });

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
        if(maintainCard_detail.js.role != "card_owner") {
            $("#deleteButton").show();
        }
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
    if(maintainCard_detail.js.role != "card_owner"){
        $(".card_title_span").hide();
        $("#cardManagerNameDiv").hide();
        $("#cardName").show().focus();
        $("#cardManagerSelectDiv").show();
        $("#saveButton").show();
    }else {
        $(".glyphicon-remove").show();
    }
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
maintainCard_detail.js.updateUserInfo = function (username) {
    var cardId = $("#uuid").val();
    layer.open({
        type:2,
        title:"充值",
        area:['305px','380px'],
        scrollbar:false,
        content:[path + '/maintainCard/recharge.do?username='+username+'&cardId='+cardId, 'no']
    });
};

maintainCard_detail.js.removeUser = function (username) {
    layer.confirm("此操作不可恢复，确认删除该成员吗？", function () {
        var cardId = $("#uuid").val();
        layer.confirm("确认删除吗?", function () {
            $.post(path + "/maintainCard/removeUser.do",{username:username,cardId:cardId},function(data){
                layer.msg(data=="true"?"操作成功!":"操作失败!");
                //maintainCard_detail.js.queryGrid();
                maintainCard_detail.js.reFresh();
            });
        });
    });
};

maintainCard_detail.js.entrance = function (cardId) {
    layer.open({
        type:2,
        title:"增加成员",
        area:['450px','430px'],
        scrollbar:false,
        content:[path + '/maintainCard/entrance.do?cardId='+cardId, 'no']
    });
};

maintainCard_detail.js.reFresh = function () {
    var hash = location.hash;
    var obj = getParameter(hash, "obj", "");
    var mc = getParameter(hash, "mc", "");
    var ran = Math.random() * 100000;
    setHash("#on=settings/init&obj="+obj+"&ln=maintainCard&mc="+mc+"&ran="+ran);
};