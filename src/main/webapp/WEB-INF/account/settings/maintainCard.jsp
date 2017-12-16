<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<link href="<%=path%>/account/settings/css/maintainCard.css" rel="stylesheet" />
<script type="text/javascript" src="<%=path%>/account/settings/js/maintainCard.js"></script>
<h3>饭卡维护</h3>
<hr>
<div class="mb_15" style="margin-top:7px;">
    <form id="query_box" class="form-inline row" role="form">
        <div class="form-group col-md-4">
            <%--<input class="btn btn-default" type="button" value="Input">--%>
            <a class="glyphicon glyphicon-plus" href="javascript:void(0)" onclick="maintainCard.js.addCard()" >新增</a>
        </div>


    </form>
</div>

<div id="table_div">

</div>

<script id="demo_cards" type="text/html">
    {{if list.length == 0}}
    <span>未查询到任何数据!</span>
    {{/if}}
    {{each list as value i}}
        <div class="card card_color{{value.card_color}}">
            <div class="card_title">
                {{value.card_name}}
                <a class="glyphicon glyphicon-cog card_button" href="javascript:void(0)" onclick="" ></a></div>
            <div class="card_balance">{{value.balance}}</div>
            <div class="card_owner">卡主:{{value.card_manager}}</div>
        </div>
    {{/each}}
</script>