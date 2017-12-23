jQuery.namespace("recharge")

$(function () {
    recharge.js.init();
})

recharge.js = {};

recharge.js.init = function () {

};

recharge.js.validateMoney = function (obj) {
    var money = $(obj).val();
    var reg = new RegExp('^[0-9]+(\\.[0-9]{0,2}){0,1}$');
    var result = {};
    result.info = "请输入最多两位小数的正数";
    result.result = reg.test(money);
    return result;
};

recharge.js.save = function () {
    var param = $("#main_form").validate();
    console.info("save");
    console.info(param);
    $.ajax({
        type:'POST',
        url:path+'/maintainCard/rechargeSave.do',
        contentType:'application/json',
        data:JSON.stringify(param),
        success:function (mes) {
            if (mes =="true"){
                comm.js.closeLayer();
                parent.maintainCard_detail.js.queryGrid();
                parent.layer.msg("充值成功!");
            }else{
                layer.msg("充值失败！");
            }
        }

    })

};