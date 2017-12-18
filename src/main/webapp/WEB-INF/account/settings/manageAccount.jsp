<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<script type="text/javascript" src="<%=path%>/account/settings/js/manageAccount.js"></script>
<h3>账号管理</h3>
<hr>
<div class="mb_15" style="margin-top:7px;">
    <form id="query_box" class="form-inline row" role="form">
        <div class="form-group col-md-4">
            <input type="text" class="form-control" id="queryCode" name="queryCode" placeholder="编号" >
        </div>
        <div class="form-group col-md-4">
            <input type="text" class="form-control" id="queryName" name="queryName" placeholder="名称">
        </div>

    </form>
</div>
<hr>
<a class="glyphicon glyphicon-plus" onclick="manageAccount.js.addUser()"></a>
<hr>
<div id="table_div">

</div>
<nav id="page-bar">
</nav>

<script id="users_grid" type="text/html">
    <table class="table border_solid table-hover">
        <thead>
        <tr>
            <th>序号</th>
            <th>账号</th>
            <th>昵称</th>
            <th>创建时间</th>
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
            <td>{{value.create_time}}</td>
            <td>
                <a class="glyphicon glyphicon-pencil table_oper_button" onclick="manageAccount.js.updateUserInfo('{{value.uuid}}')"></a>
                <a class="glyphicon glyphicon-trash table_oper_button" onclick="manageAccount.js.removeUser('{{value.uuid}}')"></a>
            </td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>