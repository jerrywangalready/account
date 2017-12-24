$.namespace("manageAccount");
$(function () {
    manageAccount.js.init();
});

manageAccount.js = {};
manageAccount.js.init = function () {

    $("#query_box input").enter(function () {
        $("#query_box").query();
    });

    manageAccount.js.query();
};

manageAccount.js.query = function () {

    var collector = $("#query_box").collector();

    $.ajax({
        type:'POST',
        url:path+"/manageAccount/queryList.do",
        contentType:'application/json',
        data:JSON.stringify(collector),
        success:function (data) {
            var html = template('users_grid',{'list':data.list});
            $("#table_div").html(html);
            // 初始化页码按钮
            $("#page-bar").page(data);
        }
    });
};

manageAccount.js.addUser = function () {
    layer.open({
        type:2,
        title:"新增用户",
        area:['375px','460px'],
        scrollbar:false,
        content:[path + '/manageAccount/addUserPage.do', 'no']
    });
};

manageAccount.js.updateUserInfo = function (uuid) {
    layer.open({
        type:2,
        title:"修改用户",
        area:['375px','460px'],
        scrollbar:false,
        content:[path + '/manageAccount/updateUserPage.do?uuid='+uuid, 'no']
    });
};

manageAccount.js.removeUser = function (uuid) {
    layer.confirm("确认删除吗?", function () {
        $.post(path + "/manageAccount/removeUser.do",{uuid:uuid},function(data){
            layer.msg(data=="true"?"操作成功!":"操作失败!");
            manageAccount.js.query();
        });
    });
};