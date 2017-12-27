<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ include file="../../comm/comm.jsp"%>--%>
<%
    String path = request.getContextPath();
%>
<script type="text/javascript" src="<%=path%>/account/statistics/js/statistics.js"></script>
<br>
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

<div id="table_div">

</div>
<nav id="page-bar">
</nav>

<script id="demo_users" type="text/html">
    <table class="table border_solid table-hover">
        <thead>
        <tr>
            <th>序号</th>
            <th>编号</th>
            <th>名称</th>
            <th>余额</th>
            <th>早餐总额</th>
            <th>午餐总额</th>
            <th>晚餐总额</th>
            <th>其他总额</th>
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
            <td><a href="javascript:void(0)" onclick="statistics.js.detail('{{value.username}}')">{{value.username}}</a></td>
            <td>{{value.nickname}}</td>
            <td>{{value.balance}}</td>
            <td>{{value.breakfastsum}}</td>
            <td>{{value.lunchsum}}</td>
            <td>{{value.dinnersum}}</td>
            <td>{{value.other}}</td>

        </tr>
        {{/each}}
        </tbody>
    </table>
</script>
