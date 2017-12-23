<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../comm/head.jsp"%>
<link href="<%=path%>/account/settings/css/addCardInfo.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/account/settings/css/maintainCard.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="<%=path%>/account/settings/js/entrance.js" ></script>

<div class="mb_15" style="margin-top:7px;">
    <input type="hidden" id="cardId" name="cardId" value="${cardId}">
    <form id="query_box" class="form-inline row" role="form">
        <div class="form-group col-md-2">
            <input type="text" class="form-control" id="queryCode" name="queryCode" placeholder="编号" >
        </div>
        <div class="form-group col-md-6">
            <input type="text" class="form-control" id="queryName" name="queryName" placeholder="名称">
        </div>

    </form>
</div>
<hr>
<div id="table_div">

</div>
<nav id="page-bar">
</nav>

<script id="queryUsersWithOutThisCard_template" type="text/html">
    <table class="table border_solid table-hover">
        <thead>
        <tr>
            <th>账号</th>
            <th>昵称</th>
        </tr>
        </thead>
        <tbody>
        {{if list.length == 0}}
        <tr>
            <td>未查询到任何数据!</td>
        </tr>
        {{/if}}
        {{each list as value i}}
        <tr onclick="entrance.js.save('{{value.username}}')">
            <td>{{value.username}}</td>
            <td>{{value.nickname}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>
