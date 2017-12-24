<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<link href="<%=path%>/account/settings/css/maintainCard.css" rel="stylesheet" />
<script type="text/javascript" src="<%=path%>/account/settings/js/maintainCard_info.js"></script>
<h3>饭卡维护</h3>
<hr>
<div class="mb_15" style="margin-top:7px;">
    <form id="query_box" class="form-inline row" role="form">
        <div class="form-group col-md-4">
            <%--<input class="btn btn-default" type="button" value="Input">--%>
        </div>


    </form>
</div>

<div id="table_div">

</div>

<script id="demo_cards" type="text/html">
    {{each list as value i}}
        <div class="card card_color{{value.card_color}}">
            <div class="card_title">
                {{value.card_name}}
                <a class="glyphicon glyphicon-cog card_button" href="javascript:void(0)" onclick="maintainCard_info.js.changeCard('{{value.uuid}}')" ></a></div>
            <div class="card_balance">￥{{value.balance}}</div>
            <div class="card_owner">卡主 : {{value.card_manager}}</div>
        </div>
    {{/each}}
    <div class="card card_add_button" onclick="maintainCard_info.js.addCard()">
        <a class="glyphicon glyphicon-plus add_button" href="javascript:void(0)" ></a>
    </div>
</script>