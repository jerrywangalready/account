<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../comm/head.jsp"%>
<link href="<%=path%>/account/settings/css/entrance.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="<%=path%>/account/settings/js/entrance.js" ></script>

<div class="mb_15" style="margin-top:7px;padding: 5px">
    <input type="hidden" id="cardId" name="cardId" value="${cardId}">
    <form id="query_box" class="form-inline row" role="form">
        <div class="form-group col-md-2">
            <input type="text" class="form-control" id="queryCode" name="queryCode" placeholder="帐号" >
        </div>
        <div class="form-group col-md-2">
            <input type="text" class="form-control" id="queryName" name="queryName" placeholder="名称">
        </div>
    </form>
    <hr style="margin-top: 1px; margin-bottom: 10px;">
    <div id="table_div">

    </div>
    <nav id="page-bar">
    </nav>
</div>

<script id="queryUsersWithOutThisCard_template" type="text/html">
        {{if list.length == 0}}
        <span>未查询到任何数据!</span>
        {{/if}}
        {{each list as value i}}
        <button class="btn btn-default" type="submit" onclick="entrance.js.save('{{value.username}}')">
            {{value.nickname}}
            ({{value.username}})
        </button>
        {{/each}}
</script>
