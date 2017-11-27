<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>

<%--<link href="<%=path%>/account/index/css/indexInit.css" type="text/css" rel="stylesheet">--%>
<script trpe="text/javascript" src="<%=path%>/account/statistics/js/statisticsDetail.js"></script>
<audio id="coin"></audio>

    <div class="mb_15" style="margin-top:7px;">
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
