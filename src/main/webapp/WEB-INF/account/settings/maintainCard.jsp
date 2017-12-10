<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
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
<nav id="page-bar">
</nav>

<script id="demo_cards" type="text/html">
    <table class="table border_solid table-hover">
        <thead>
        <tr>
            <th>序号</th>
            <th>饭卡名称</th>
            <%--<th>创建时间</th>--%>
            <th>饭卡管理员</th>
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
            <td>{{value.card_name}}</td>
            <%--<td>{{value.createTime}}</td>--%>
            <td>{{value.card_manager}}</td>
            <td>
                <a onclick="maintainCard.js.changeCard('{{value.uuid}}')">修改</a>
                <a onclick="maintainCard.js.deleteCard('{{value.uuid}}')">删除</a>
            </td>

        </tr>
        {{/each}}
        </tbody>
    </table>
</script>