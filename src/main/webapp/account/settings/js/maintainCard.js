jQuery.namespace("maintainCard");
$(function () {

    maintainCard.js.init();
});

maintainCard.js = {};

maintainCard.js.init = function () {

    //初始化列表数据
    //maintainCard.js.query();
    var mc = getParameter(location.hash,"mc","");
    if(mc == ""){
        $("#maintainCard_box").load(path+"/maintainCard/maintainCardInfo.do");
    }else{
        $("#maintainCard_box").load(path+"/maintainCard/maintainCardDetail.do?uuid="+mc);
    }

};


