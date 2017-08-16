<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ include file="../../comm/comm.jsp"%>--%>
<%
    String path = request.getContextPath();
%>
<link href="<%=path%>/account/index/css/indexInit.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="<%=path%>/account/index/js/indexInit.js"></script>
<div>
    <br>
    <div class="row">
        <div class="col-md-9" style="border-right:1px dashed #ddd">
            <div>
                <form id="query_box" class="form-inline row" role="form">
                    <div class="form-group col-md-4">
                        <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd"
                             data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                            <input class="form-control" size="16" id="startTime" name="startTime" readonly
                                   placeholder="开始时间">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                        <input type="hidden" id="dtp_input" value=""/>
                    </div>
                    <div class="form-group col-md-4">
                        <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd"
                             data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                            <input class="form-control" size="16" id="finishTime" name="finishTime" readonly
                                   placeholder="结束时间">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                        <input type="hidden" id="dtp_input1" value=""/>
                    </div>
                    <div class="form-group col-md-4">
                    </div>

                </form>
            </div>
            <hr>
            <div id="table_div" style="min-height: 430px;">

            </div>
            <nav id="page-bar">
            </nav>
        </div>
        <div class="col-md-3">
            <div class="mb_15" style="height:50px">
                <div class="left" style="width:50px;padding: 22px 0 0 0;">
                    <h4>余额:</h4>
                </div>
                <div class="left">
                    <span id="balance" style="font-size: 46px;">0</span>
                </div>
            </div>
            <hr>
            <form role="form" id="main_form">
                <input type="hidden" id="uuid" name="uuid">
                <div class="mb_15">
                    <label for="recordTime">记账日期</label>
                    <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd"
                         data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                        <input class="form-control" size="16" id="recordTime" name="recordTime" readonly
                               placeholder="时间">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <input type="hidden" id="dtp_input2" value=""/>
                </div>
                <div class="mb_15">
                    <label for="breakfast">早餐</label>
                    <input class="form-control" id="breakfast" name="breakfast" placeholder="0.0" validate="required">
                </div>
                <div class="mb_15">
                    <label for="lunch">午餐</label>
                    <input class="form-control" id="lunch" name="lunch" placeholder="0.0">
                </div>
                <div class="mb_15">
                    <label for="dinner">晚餐</label>
                    <input class="form-control" id="dinner" name="dinner" placeholder="0.0">
                </div>
                <div class="mb_15" id="moreButtonDiv">
                    <a class="right" style="margin-right:8px" onclick="indexInit.js.showMore()">more</a>
                </div>
                <div class="mb_15" name="moreDiv" style="display: none">
                    <label for="other">其它</label>
                    <input class="form-control" id="other" name="other" placeholder="0.0">
                </div>
                <div class="mb_15" name="moreDiv" style="display: none">
                    <label for="remark">备注</label>
                    <textarea class="form-control" id="remark" name="remark" rows="3"></textarea>
                </div>
                <br>
                <div class="mb_15" style="padding:15px 0">
                    <button type="button" class="btn btn-primary full_button" onclick="indexInit.js.save()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
<br>

<script id="queryList_template" type="text/html">
    <table class="table border_solid table-hover">
        <thead>
        <tr>
            <th>记账日期</th>
            <th>早餐</th>
            <th>午餐</th>
            <th>晚餐</th>
            <th>其它</th>
            <th>备注</th>
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
            <td>{{value.recordtime}}</td>
            <td {{if value.breakfast == '0'}} class="grey" {{/if}}>{{value.breakfast}}</td>
            <td {{if value.lunch == '0'}} class="grey" {{/if}}>{{value.lunch}}</td>
            <td {{if value.dinner == '0'}} class="grey" {{/if}}>{{value.dinner}}</td>
            <td {{if value.other == '0'}} class="grey" {{/if}}>{{value.other}}</td>
            <td>{{value.remark}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>