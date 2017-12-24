jQuery.namespace("addUserPage");
$(function () {
    addUserPage.js.init();
});

addUserPage.js = {};
addUserPage.js.init = function () {
    $("#username").focus();

    $("#main_form input").enter(function () {
        addUserPage.js.save();
    });
};

addUserPage.js.save = function () {
    var param = $("#main_form").validate();
    $.ajax({
        type:'POST',
        url:path+'/manageAccount/save.do',
        contentType:'application/json',
        data:JSON.stringify(param),
        success:function (data) {
            if(data == "true"){
                comm.js.closeLayer();
                parent.manageAccount.js.query();
                parent.layer.msg("保存成功!");
            }
        }

    });
};

addUserPage.js.checkUsername = function () {
    var username = $("#username").val();
    var result = {};

    $.ajax({
        type:'POST',
        async: false,
        url:path+'/manageAccount/checkUsername.do',
        data:{username:username},
        success:function (res) {
            result = res;
        }

    });

    return result;
};

addUserPage.js.validatePassword = function () {
    var password = $("#password").val();
    var rePassword = $("#rePassword").val();
    if(password != rePassword){
        return {result:false, info:"两次输入的密码不一致!"};
    }else {
        return {result:true, info:""};
    }
};