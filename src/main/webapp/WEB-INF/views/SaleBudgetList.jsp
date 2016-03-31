<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息</title>
 <link
	href="${js_path}/jquery-easyui/1.4.3/themes/metro/easyui.css"
	rel="stylesheet" /> 
<script type="text/javascript"
	src="${js_path}/jquery-easyui/1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${js_path}/jquery-easyui/1.4.3/easyui.util.js"></script>
</head>
<body>
<BR>
<BR>
	<ul class="breadcrumb">
			<li>
					首页 <span class="divider">/</span>
					</li>
			<li>
					销售预算 <span class="divider">/</span>
					</li>
			<li class="active">
					查看销售预算详情
					</li>
	</ul>
	<!-- -->
	<BR>
	     <div align="right">  <b>   请选择要查看的销售预算   </b><select id="yeartime" style="width:200px;" onchange="ResourceApp.searchData()">
					<option value="">---请选择---</option>
					<c:forEach items="${listB}" var="listb">
					<option value="${listb.yeartime}">${listb.formattime}</option>
					</c:forEach>
					</select>
					</div> 
	<BR>

	<table id="ReportGrid"  title="销售预算详情">
		<thead>
			<tr>
			    <th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'pid',align:'center',width:120">产品编号</th>
				<th data-options="field:'year',align:'center',width:40">年份</th>
				<th data-options="field:'time',align:'center',width:40">季度</th>
				<th data-options="field:'name',align:'center',width:60">产品名称</th>
				<th data-options="field:'cost',align:'center',width:40">产品售价</th>
				<th data-options="field:'count',align:'center',width:40">销售数量</th>
				<th data-options="field:'money',align:'center',width:50 ">销售总额</th>
				<!-- <th data-options="field:'stu',width:100 ,align:'center',formatter:ResourceApp.operatorFmt ">操作</th> -->
				
			</tr>
		</thead>
	</table>

		
	  <script type="text/javascript">
	  (function(window, $) {
			var _gridId = 'ReportGrid';
			var ResourceApp = {};
			// 加载数据
			ResourceApp.reloadData = function(p_queryParams) {
				$("#" + _gridId).datagrid('clearSelections').datagrid("load",
						p_queryParams);
			};
			// 状态 显示
			ResourceApp.operatorFmt2 = function(value, row, index) {

				if (value == 'admin') {
					return "管理员";
				}
				if (value == 'nommal') {
					return "员工";
				}
				if (value == 3) {
					return "已取消发布";
				}
			};
			ResourceApp.searchData = function() {
				var _yeartime = $.trim($('#yeartime').val());
				ResourceApp.reloadData({
					bid : _yeartime
					
				});
			};
			
			ResourceApp.operatorFmt = function(value, row, index) {
				return "<a href='#' class='grid-linkbutton' iconCls='icon-delete' plain='true' "
						+ "onclick='ResourceApp.editReport(\"" + index + "\")'>编辑</a>";
			};
	

			window.ResourceApp = ResourceApp;
			$(function() {
				EasyuiUtil.Grid.initGrid(_gridId, {
					url : basePath + "/rest/sale/SaleBudgetList",
					
				});
				
			});
		})(window, jQuery);

</script>  
</body>
</html>