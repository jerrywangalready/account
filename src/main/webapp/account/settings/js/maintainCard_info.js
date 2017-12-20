jQuery.namespace("maintainCard_info");
$(function () {

    maintainCard_info.js.init();
});

maintainCard_info.js = {};

maintainCard_info.js.init = function () {

    //初始化列表数据
    maintainCard_info.js.query();

};

maintainCard_info.js.query = function(){

    var collector = $("#query_box").collector();
    $.ajax({
        type:'POST',
        url:path+"/maintainCard/queryList.do",
        contentType:'application/json',
        data:JSON.stringify(collector),
        success:function (data) {
            var html = template('demo_cards',{'list':data});
            $("#table_div").html(html);
            //初始化页码按钮
            //$("#page-bar").page(data);
        }
    });

};

//增加
maintainCard_info.js.addCard = function () {
    // layer.open({
    //     type:2,
    //     title:" 新增饭卡",
    //     area:['375px','280px'],
    //     scrollbar:false,
    //     content:[path + '/maintainCard/addCardInfo.do', 'no']
    // });
    comm.js.hashAppand("mc","new");
};

//修改
maintainCard_info.js.changeCard = function(uuid){
/*    console.info("xiugai yemian ");
    layer.open({
        type:2,
        title:" 新增饭卡",
        area:['500px','450px'],
        scrollbar:false,
        content:[path + '/maintainCard_info/changeCardInfo.do?uuid='+uuid, 'no']
    });*/
    //comm.js.hashAppand("mc","cardDetail");
    comm.js.hashAppand("mc",uuid);
};

//删除
maintainCard_info.js.deleteCard = function (uuid) {
    var param = {};
    param.uuid = uuid;
    $.ajax({
        type:'POST',
        url:path+"/maintainCard_info/deleteCardInfo.do",
        //contentType:'application/json',
       // data:JSON.stringify(param),
        data:{uuid:uuid},
        success:function (data) {

            if (data == "success"){
                layer.msg("删除成功！");
                maintainCard_info.js.init();
            }else{
                layer.msg("删除失败！");
            }
        }
    });
};
