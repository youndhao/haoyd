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
					领导审核<span class="divider">/</span>
					</li>
			<li class="active">
					销售预算审核
					</li>
	</ul>
	<!-- -->
	<BR>

	<table id="ReportGrid"  title="销售预算清单" >
		<thead>
			<tr>
				<c:if test="${user.role>3}">
				<th data-options="field:'ck',checkbox:true"></th>
				</c:if>
				<th data-options="field:'hid',align:'center',width:100">销售预算编码</th>
				<th data-options="field:'year',align:'center',width:50">年份</th>
				<th data-options="field:'time',align:'center',width:50,formatter:ResourceApp.operatorFmt1">季度</th>
				<th data-options="field:'isPass',align:'center',width:50,formatter:ResourceApp.operatorFmt2">状态</th>
				<th data-options="field:'advice',align:'center',width:100">领导意见</th>
				<c:if test="${user.role>3}">
				<th data-options="field:'stu',width:50 ,align:'center',formatter:ResourceApp.operatorFmt ">操作</th>
				</c:if>
			</tr>
		</thead>
	</table>
	<div id="reportDialog" class="easyui-dialog" style="width:420px;padding:10px;" 
		data-options="inline:true,modal:true,closed:true ,buttons:'#reportDialogBtns'">
		<div style="margin-bottom:20px" id="mes">
		<input type="text" disabled="disabled"  id="reportDialogMsg" style="width:100%;height:32px" >
		</div>
		<div style="margin-bottom:20px">
			<div>是否通过:
			<select id="ispass2" style="width:50%;height:32px"><option value="0">会商</option>
			<option value="1">审核</option><option value="2">签发</option><option value="3">注发</option></select></div>
		</div>
		<div style="margin-bottom:20px">
			<div>填写意见:</div>
			<textarea id="advice2" style="width:100%;height:100px"></textarea>
		</div>
	<div id="reportDialogBtns">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="ResourceApp.updateReport()" data-options="iconCls:'icon-ok'">更新</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="ResourceApp.closeResourceDialog()" data-options="iconCls:'icon-close'">关闭</a>
		
	</div>
	</div>
		
	
	  <script type="text/javascript">
	  (function(window, $) {
			var _gridId = 'ReportGrid';
			var ResourceApp = {};
			// 加载数据
			ResourceApp.reloadData = function(p_queryParams) {
				$("#" + _gridId).datagrid('clearSelections').datagrid("load",
						p_queryParams);
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
					return "会商";
				}
				if (value == '1') {
					return "审核";
				}
				if (value == '2') {
					return "签发";
				}
				if (value == '3') {
					return "注发";
				}
			};
			ResourceApp.operatorFmt = function(value, row, index) {
				return "<a href='#' class='grid-linkbutton' iconCls='icon-delete' plain='true' "
						+ "onclick='ResourceApp.editReport(\"" + index + "\")'>编辑</a>";
			};

			// 编辑报告
			ResourceApp.editReport = function(_rowindex) {
				$("#" + _gridId).datagrid("clearSelections");
				// 获取分页中所选行，并将行信息填入修改的表单中
				_row1 = EasyuiUtil.Grid.getGridRowByIndex(_gridId, _rowindex);
				$("#mes").hide();
				$("#ispass2").val(_row1.isPass);
				$("#advice2").val(_row1.advice);
				$('#reportDialog').dialog({
					title : "审批采购清单"
				}).dialog('open');
			};
			

			// 关闭 弹出窗口
			ResourceApp.closeResourceDialog = function() {
				$("#reportDialog").dialog('close');
			}
		
			// 编辑信息
			ResourceApp.updateReport = function() {
				var _advice1 = $.trim($("#advice2").val());
				var _hid1 = $.trim($("#hid1").val());
				var _ispass1 = $.trim($("#ispass2").val());
				var _data = {
					"bid" : _row1.hid,
					"advice" : _advice1,
					"ispass" : _ispass1
				};
				EasyuiUtil.Messager.showWaiting();
				$.post(basePath + "/rest/manage/updatesale", _data, function(r) {
					if (r.result) {
						EasyuiUtil.Messager.closeWaiting();
						ResourceApp.closeResourceDialog();
						ResourceApp.reloadData();
					} else {
						alert(r.message);
						EasyuiUtil.Messager.closeWaiting();
						ResourceApp.closeResourceDialog();
						ResourceApp.reloadData();
					}
				}, "json");
			}
		 
		
			window.ResourceApp = ResourceApp;
			$(function() {
				EasyuiUtil.Grid.initGrid(_gridId, {
					url : basePath + "/rest/manage/salebudgetjson",
				 
				});
				
			});
		})(window, jQuery);

</script>  
</body>
</html>