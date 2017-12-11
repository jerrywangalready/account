<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
%>
<%--<link href="<%=path%>/account/index/css/indexInit.css" type="text/css" rel="stylesheet">--%>
<script type="text/javascript" src="<%=path%>/account/settings/js/addCardInfo.js" ></script>

<h3>饭卡</h3>
<hr>

<div class="col-md-3" style="margin-top: 7px;" >
    <form role="form" id="main_form">
        <input type="hidden" id="uuid" name="uuid">
        <div class="mb_15">
            <label for="cardName">饭卡名称</label>
            <input class="form-control" id="cardName" name="cardName"  validate="addCardInfo.js.checkMoney(this)">
        </div>
        <div class="mb_15">
            <label for="cardName">饭卡管理员</label>
            <input class="form-control" id="cardManager" name="cardManager"  validate="addCardInfo.js.checkMoney(this)">
        </div>
        <br>
        <div class="mb_15" style="padding:15px 0">
            <button type="button" class="btn btn-primary full_button" onclick="addCardInfo.js.save()">保存</button>
        </div>
    </form>
</div>
