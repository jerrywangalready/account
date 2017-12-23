<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../comm/head.jsp"%>

<script type="text/javascript" src="<%=path%>/account/settings/js/recharge.js"></script>

<hr>
<div class="col-md-3">
    <form id="main_form">
        <input type="hidden" id="cardId" name="cardId" value="${cardId}">
        <div>
            <label for="username">账号</label>
            <input type="hidden" class="form-control disabled" id="username" name="userName" value="${username}" >
            <span>${username}</span>
        </div>
        <div>
            <label >姓名</label>
            <span>${nickname}</span>
        </div>
        <div>
            <label >余额</label>
            <span>${balance}</span>
        </div>
        <div>
            <label for="rechargeMoney">充值金额</label>
            <input type="text" class="form-control" id="rechargeMoney" name="rechargeMoney" validate="required,recharge.js.validateMoney(this)">
        </div>
        <br>
        <br>
        <div>
            <button type="button" style="width: 100%;" class="btn btn-primary full_button" onclick="recharge.js.save()">保存</button>
        </div>
        <br>
    </form>
</div>