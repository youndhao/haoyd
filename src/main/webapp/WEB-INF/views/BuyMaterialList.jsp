<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息</title>

<script type="text/javascript"
	src="${js_path}/jquery-easyui/1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${js_path}/jquery-easyui/1.4.3/easyui.util.js"></script>
	 <link
	href="${js_path}/jquery-easyui/1.4.3/themes/metro/easyui.css"
	rel="stylesheet" /> 
</head>
<body>
<BR>
<BR>
	<ul class="breadcrumb">
			<li>
					首页 <span class="divider">/</span>
					</li>
			<li>
					原材料采购<span class="divider">/</span>
					</li>
			<li class="active">
					录入原材料库
					</li>
	</ul>
	<!-- -->
	<BR>

	<table id="ReportGrid"  title="原材料采购清单">
		<thead>
			<tr>
				<th data-options="field:'bid',width:100">采购单编码</th>
				<th data-options="field:'year',align:'center',width:50">年份</th>
				<th data-options="field:'time',align:'center',width:50,formatter:ResourceApp.operatorFmt1">季度</th>
				<th data-options="field:'isPass',align:'center',width:50,formatter:ResourceApp.operatorFmt2">状态</th>
				<th data-options="field:'advice',width:100">领导意见</th>
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
			
			ResourceApp.operatorFmt1 = function(value, row, index) {

				if (value == '1') {
					return "第一季度";
				}
				if (value == '2') {
					return "第二季度";
				}
				if (value == '3') {
					return "第三季度";
				}
				if (value == '4') {
					return "第四季度";
				}
			};
			ResourceApp.operatorFmt2 = function(value, row, index) {

				if (value == '0') {
					return "审批中";
				}
				if (value == '1') {
					return "通过";
				}
				if (value == '2') {
					return "未通过";
				}
			};
		
			// 根据信息查找
			ResourceApp.searchData = function() {
				var _TITLE = $.trim($('#_title').val());
				var _TYPE = $.trim($('#_type').val());
				var _CAL = $.trim($('#_cal').val());
				var _USER = $.trim($('#_user').val());
				var _COMMON = $.trim($('#_common').val());
				ResourceApp.reloadData({
					title : _TITLE,
					type : _TYPE,
					cal : _CAL,
					userid : _USER,
					common : _COMMON
				});
			};
			
			
		
			window.ResourceApp = ResourceApp;
			$(function() {
				EasyuiUtil.Grid.initGrid(_gridId, {
					url : basePath + "/rest/buy/BuyOrderList",
				 
				});
				
			});
		})(window, jQuery);

</script>  
</body>
</html>