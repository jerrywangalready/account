<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ include file="../../comm/comm.jsp"%>--%>
<%
    String path = request.getContextPath();
%>
<link href="<%=path%>/account/settings/css/settings.css" rel="stylesheet"/>
<script type="text/javascript" src="<%=path%>/account/settings/js/settings.js"></script>
<div>
    <div class="left-box">
        <ul>
            <li labelName="manageAccount" class="hidden">账号管理</li>
            <li labelName="maintainCard" class="hidden">饭卡维护</li>
            <li labelName="changePassword">密码修改</li>
        </ul>
    </div>
    <div class="right-box">
    </div>
</div>