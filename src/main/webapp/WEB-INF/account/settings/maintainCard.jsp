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
            <input type="button" class="form-control" id="addCode" name="addCode" placeholder="增加" >
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
            <th>创建时间</th>
            <th>饭卡管理员</th>
            <th>修改</th>
            <th>删除</th>
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
            <td>{{value.cardName}}</td>
            <td>{{value.createTime}}</td>
            <td>{{value.cardManager}}</td>
            <td onclick="maintainCard.js.changeCard('{{value.cardName}}')">修改</td>
            <td onclick="maintainCard.js.deleteCard('{{value.cardName}}')">删除</td>

        </tr>
        {{/each}}
        </tbody>
    </table>
</script>