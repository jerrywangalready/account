<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../comm/head.jsp"%>
<%--<link href="<%=path%>/account/index/css/indexInit.css" type="text/css" rel="stylesheet">--%>
<script type="text/javascript" src="<%=path%>/account/settings/js/addCardInfo.js" ></script>

<h3>饭卡</h3>
<hr>

<div class="col-md-3" style="margin-top: 7px;" >
    <form role="form" id="main_form">
        <input type="hidden" id="uuid" name="uuid">
        <div class="mb_15">
            <label for="cardName">饭卡名称</label>
            <input class="form-control" id="cardName" name="cardName"  validate="required,length[0-50]">
        </div>
        <div class="form-group col-md-4">
            <label for="cardManager">饭卡管理员</label>
           <%-- <select class="form-control" id="cardManager" name="cardManager">
                <option value="">-- 选择饭卡管理员 --</option>
            </select>--%>
            <select type="text" id="cardManager" class="form-control" data-live-search="true"></select>
        </div>
        <br>
        <div class="mb_15" style="padding:15px 0">
            <button type="button" class="btn btn-primary full_button" onclick="addCardInfo.js.save()">保存</button>
        </div>
    </form>
</div>
