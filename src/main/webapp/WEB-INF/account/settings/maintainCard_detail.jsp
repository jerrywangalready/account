<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<link href="<%=path%>/account/settings/css/addCardInfo.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/account/settings/css/maintainCard.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/account/settings/css/maintainCard_detail.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="<%=path%>/account/settings/js/maintainCard_detail.js" ></script>
<h3>饭卡维护 / 详细信息</h3>
<hr>
<div class="layer_box" style="margin-top:-20px">
    <div class="left" style="width: 100%">
        <div class="left">
            <form role="form" id="main_form" style="padding: 16px;">
                <input type="hidden" id="uuid" name="uuid" value="${uuid}">
                <input type="hidden" id="cardColor" name="cardColor" value="${card_color}">
                <div class="card_big card_color${card_color}">
                    <div class="">
                        <div class="left" style="width: 100%;">
                            <span class="card_title_span left">${card_name}</span>
                            <input class="form-control" placeholder="饭卡名称" style="display: none;" id="cardName" name="cardName" value="${card_name}" validate="required,length[0-50]">
                        </div>
                        <div class="card_balance_big">￥${balance}</div>
                        <div class="card_owner_big">
                            <span style="float:left;height: 15px;font-size: 21px;margin-top: 3px;">卡主 : </span>
                            <div id="cardManagerNameDiv" style="float: left;padding: 8px 10px;font-size: 14px;">
                                <span >${card_manager}</span>
                            </div>
                            <div id="cardManagerSelectDiv" style="float:left;margin-left: 5px;display: none">
                                <select type="text" id="cardManager" name="cardManager" value="${username}" class="form-control cardManager" data-live-search="true"></select>
                            </div>
                            <button type="button" id="saveButton" style="display: none" class="btn btn-success full_button" onclick="maintainCard_detail.js.save()">保存</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="right">
            <div style="margin-top:190px">
                <a id="updateButton" class="glyphicon glyphicon-pencil" style="display: none;" onclick="maintainCard_detail.js.forUpdate()"></a>
                <a id="deleteButton" class="glyphicon glyphicon-trash" style="display: none;" onclick="maintainCard_detail.js.forDeleteCard('${uuid}')"></a>
                <a id="backButton" class="glyphicon glyphicon-log-out" onclick="maintainCard_detail.js.forBack()"></a>
            </div>
        </div>
    </div>
    <hr group="search" style="display: none;">
    <div group="search" class="mb_15" style="margin-top:7px;display: none;">
        <form id="query_box" class="form-inline row" role="form">
            <div class="form-group col-md-4">
                <input type="text" class="form-control" id="queryCode" name="queryCode" placeholder="账号" >
            </div>
            <div class="form-group col-md-4">
                <input type="text" class="form-control" id="queryName" name="queryName" placeholder="昵称">
            </div>

        </form>
    </div>
    <hr>
    <div id="table_div">

    </div>
    <nav id="page-bar">
    </nav>

</div>
<script id="member_grid" type="text/html">
    <table class="table border_solid table-hover">
        <thead>
        <tr>
            <th>序号</th>
            <th>账号</th>
            <th>昵称</th>
            <th>余额</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        {{if list.length == 0}}
        <tr>
            <td>未查询到任何数据!</td>
        </tr>
        {{/if}}
        {{each list as value i}}
        <tr>
            <td>{{i+1}}</td>
            <td>{{value.username}}</td>
            <td>{{value.nickname}}</td>
            <td>{{value.balance}}</td>
            <td>
                <a class="glyphicon glyphicon-yen table_oper_button" onclick="maintainCard_detail.js.updateUserInfo('{{value.username}}')"></a>
                <a class="glyphicon glyphicon-menu-hamburger table_oper_button" onclick="maintainCard_detail.js.updateUserInfo('{{value.username}}')"></a>
                <a class="glyphicon glyphicon-remove table_oper_button" style="display: none;" onclick="maintainCard_detail.js.removeUser('{{value.username}}')"></a>
            </td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>
