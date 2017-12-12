jQuery.namespace("changePassword");
$(function () {

    changePassword.js.init();
});

changePassword.js = {};

changePassword.js.init = function () {

    $("#oldPassword").focus().focusout(function () {

    });

    $.post(path+'/settings/getLiveOptions.do',{},function (data) {
        for(var i=0;i<data.length;i++){
            $("#demo").append("<option value='"+data[i].key+"'>"+data[i].value+"</option>")

        }
        $("#demo").selectpicker("refresh");
    });

};

changePassword.js.checkPassword = function() {
    var password = $("#oldPassword").val();
    var result = {};

    $.ajax({
        type:'POST',
        async: false,
        url:path+'/settings/checkPassword.do',
        data:{password:password},
        success:function (res) {
            result = res;
        }

    });

    return result;

};

changePassword.js.validatePassword = function () {
    var password = $("#newPassword").val();
    var password2 = $("#newPasswordTwice").val();
    if(password != password2){
        return {result:false, info:"两次输入的密码不一致!"};
    }else {
        return {result:true, info:""};
    }
};

changePassword.js.save = function () {
    var param = $("#main_form").validate();
    if(param) {
        $.ajax({
            type:'POST',
            url:path+'/settings/saveNewPassword.do',
            contentType:'application/json',
            data:JSON.stringify(param),
            success:function (data) {
                if("true" == data){
                    $.post(path+"/index/logout.do",{},function (ret) {
                        if(ret == "true"){
                            layer.alert('修改成功!请重新登录!',{icon:1,end:function () {
                                location.href = path+"/index/index.do";
                            }});
                        }
                    });
                }
            }

        });
    }
};
