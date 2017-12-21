<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../comm/head.jsp"%>
<link href="<%=path%>/account/settings/css/addCardInfo.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/account/settings/css/maintainCard.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="<%=path%>/account/settings/js/entrance.js" ></script>

<div class="col-md-3" style="margin-top: 7px;" >
    <form role="form" id="main_form" style="padding: 16px;">
        <input type="hidden" id="uuid" name="uuid" value="${uuid}">
        <input type="hidden" id="cardColor" name="cardColor" value="${cardColor}">
        <div class="card_big card_color${cardColor}">
            <div class="">
                <input class="form-control" placeholder="饭卡名称" id="cardName" name="cardName"  validate="required,length[0-50]">
            <div class="card_balance_big">￥0</div>
            <div class="card_owner_big">
                <span style="float:left;height: 15px;font-size: 21px;margin-top: 3px;">卡主 : </span>
                <div style="float:left;margin-left: 5px;">
                    <select type="text" id="cardManager" class="form-control cardManager" data-live-search="true"></select>
                </div>
                <button type="button" class="btn btn-success full_button" onclick="addCardInfo.js.save()">保存</button>
            </div>
        </div>
    </form>
</div>
