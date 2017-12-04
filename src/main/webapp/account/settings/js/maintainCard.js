jQuery.namespace("maintainCard");
$(function () {

    maintainCard.js.init();
});

maintainCard.js = {};

maintainCard.js.init = function () {

    //初始化列表数据
    maintainCard.js.query();

};

maintainCard.js.query(){

    $.ajax({
        type:'POST',
        url:path+"/maintainCard/queryList.do",
        contentType:'application/json',
        data:JSON.stringify(""),
        success:function (data) {
            console.info(data);
            var html = template('demo_cards',{'list':data.list});
            console.info(html);
            $("#table_div").html(html);
            //初始化页码按钮
            $("#page-bar").page(data);
        }
    });

};

