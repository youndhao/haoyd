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
					销售管理 <span class="divider">/</span>
					</li>
			<li class="active">
					查看产品库
					</li>
	</ul>
	<!-- -->
	<BR>

	<table id="ReportGrid"  title="产品库信息">
		<thead>
			<tr>
			    <th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'pid',align:'center',width:100">产品编码</th>
				<th data-options="field:'name',align:'center',width:50">产品名</th>
				<th data-options="field:'salemoney',align:'center',width:50">售价</th>
				<th data-options="field:'cost',align:'center',width:50">成本</th>
			</tr>
		</thead>
	</table>

		<div id="reportDialog" class="easyui-dialog" style="width:420px;padding:10px;" data-options="inline:true,modal:true,closed:true,buttons:'#reportDialogBtns'">
		<div style="margin-bottom:20px" id="mes">
		<input type="text" disabled="disabled"  id="reportDialogMsg" style="width:100%;height:32px" >
		</div>
		<div style="margin-bottom:20px">
			<div>产品名:
			<input id="name2" type="text"   style="width:100%;height:32px"></div>
		</div>
		<div style="margin-bottom:20px">
			<div>售价:</div>
			<input id="sale2"  style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div>成本:
			<input id="cost2" type="text"   style="width:100%;height:32px"></div>
		</div>
		
	<div id="reportDialogBtns">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="ResourceApp.save()" data-options="iconCls:'icon-ok'">保存</a>
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
			// 添加人员
			ResourceApp.addReport = function() {
				$("#mes").hide();
				$("#name2").val('');
				$("#sale2").val('');
				$("#cost2").val('');
				$('#reportDialog').dialog({
					title : "新增产品"
				}).dialog('open');
			};


			// 关闭 弹出窗口
			ResourceApp.closeResourceDialog = function() {
				$("#reportDialog").dialog('close');
			}
			// 保存信息
			ResourceApp.save = function() {
				var _name1 = $.trim($("#name2").val());
				var _sale1 = $.trim($("#sale2").val());
				var _cost1 = $.trim($("#cost2").val());
				
				if (_name1 == null || _name1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入产品名");
					return;
				}
				if (_sale1 == null || _sale1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入产品售价");
					return;
				}
				if (_cost1 == null || _cost1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入产品成本");
					return;
				}
				
				$("#mes").hide();// ??
				var _data = {
						
						"name" : _name1,
						"salemoney" : _sale1,
						"cost" : _cost1
				};
				EasyuiUtil.Messager.showWaiting();
				$.post(basePath + "/rest/sale/addProduct", _data, function(r) {
					if (r.result) {
						EasyuiUtil.Messager.closeWaiting();
						ResourceApp.closeResourceDialog();
						ResourceApp.reloadData();
					} else {
						alert(r.message);
					}
				}, "json");
			}
			
		
			window.ResourceApp = ResourceApp;
			$(function() {
				EasyuiUtil.Grid.initGrid(_gridId, {
					url : basePath + "/rest/sale/productlist",
					toolbarConfig : {
						add : {
							text : "新增产品",
							handler : ResourceApp.addReport
						},
					
					}  
				});
				
			});
		})(window, jQuery);

</script>  
</body>
</html>