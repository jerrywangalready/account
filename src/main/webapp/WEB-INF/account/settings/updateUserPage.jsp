<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../comm/head.jsp"%>

<script type="text/javascript" src="<%=path%>/account/settings/js/addUserPage.js" ></script>

<div class="layer_box">
    <form id="main_form">
        <div class="form-group">
            <label for="username">账号</label>
            <span class="form-control" id="username" name="username" >${username}</span>
            <input type="hidden" name="uuid" value="${uuid}">
        </div>
        <div class="form-group">
            <label for="nickname">昵称</label>
            <input type="text" class="form-control" id="nickname" name="nickname" value="${nickname}" placeholder="系统中显示的名字" validate="required,length[1-25]">
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" class="form-control" id="password" name="password" value="${password}" placeholder="登录中使用的密码" validate="required">
        </div>
        <div class="form-group">
            <label for="rePassword">密码确认</label>
            <input type="password" class="form-control" id="rePassword" placeholder="再次输入密码" value="${password}" validate="required,addUserPage.js.validatePassword()">
        </div>
        <hr>
        <div class="form-group">
            <button type="button" class="btn btn-success full_button right" onclick="addUserPage.js.save()">保存</button>
        </div>

    </form>

</div>