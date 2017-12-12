<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<script type="text/javascript" src="<%=path%>/account/settings/js/changePassword.js"></script>
<h3>密码修改</h3>
<hr>
<div class="col-md-3">
    <form id="main_form">
        <div>
            <label for="oldPassword">原密码</label>
            <input type="password" class="form-control" id="oldPassword" name="oldPassword" validate="required,changePassword.js.checkPassword()">
        </div>
        <div>
            <label for="newPassword">新密码</label>
            <input type="password" class="form-control" id="newPassword" name="newPassword" validate="required">
        </div>
        <div>
            <label for="newPasswordTwice">验证密码</label>
            <input type="password" class="form-control" id="newPasswordTwice" name="newPasswordTwice" validate="required,changePassword.js.validatePassword()">
        </div>
        <br>
        <br>
        <div>
            <button type="button" style="width: 100%;" class="btn btn-primary full_button" onclick="changePassword.js.save()">保存</button>
        </div>
        <br>
        <select type="text" id="demo" class="form-control" data-live-search="true"></select>
    </form>
</div>