jQuery.namespace("maintainCard");
$(function () {

    maintainCard.js.init();
});

maintainCard.js = {};

maintainCard.js.init = function () {

    //初始化列表数据
    maintainCard.js.query();

};

maintainCard.js.query = function(){

    var collector = $("#query_box").collector();
    $.ajax({
        type:'POST',
        url:path+"/maintainCard/queryList.do",
        contentType:'application/json',
        data:JSON.stringify(collector),
        success:function (data) {
            console.info(data);
            var html = template('demo_cards',{'list':data});
            console.info(html);
            $("#table_div").html(html);
            //初始化页码按钮
            //$("#page-bar").page(data);
        }
    });

};

//增加
maintainCard.js.addCard = function () {
    layer.open({
        type:2,
        title:" 新增饭卡",
        area:['375px','280px'],
        scrollbar:false,
        content:[path + '/maintainCard/addCardInfo.do', 'no']
    });
};

//修改
maintainCard.js.changeCard = function(uuid){
    layer.open({
        type:2,
        title:" 新增饭卡",
        area:['500px','450px'],
        scrollbar:false,
        content:[path + '/maintainCard/addCardInfo.do?uuid='+uuid, 'no']
    });
};

//删除
maintainCard.js.deleteCard = function (uuid) {
    var param = {};
    param.uuid = uuid;
    console.info(param);

    $.ajax({
        type:'POST',
        url:path+"/maintainCard/deleteCardInfo.do",
        //contentType:'application/json',
       // data:JSON.stringify(param),
        data:{uuid:uuid},
        success:function (data) {

            if (data == "success"){
                layer.msg("删除成功！");
                maintainCard.js.init();
            }else{
                layer.msg("删除失败！");
            }
        }
    });
};
