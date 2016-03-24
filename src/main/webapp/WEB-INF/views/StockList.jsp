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
	<script type="text/javascript" src="${js_path}/jquery-1.9.1.min.js"></script>
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
					库存管理 <span class="divider">/</span>
					</li>
			<li class="active">
					商品入库管理
					</li>
	</ul>
	<!-- -->
	<BR>

	<table id="ReportGrid"  title="商品入库信息">
		<thead>
			<tr>
			    <th data-options="field:'ck',checkbox:true"></th>
			    <th data-options="field:'id',width:30">id</th>
				<th data-options="field:'productNumber',align:'center',width:150">商品编号</th>
				<th data-options="field:'productName',align:'center',width:100">商品名称</th>
				<th data-options="field:'cost',align:'center',width:100">商品进价</th>
				<th data-options="field:'retail',align:'center',width:100">商品零售价</th>
				<th data-options="field:'category',align:'center',width:100">商品类别</th>
				<th data-options="field:'privider',align:'center',width:100">商品供应商</th>
				<th data-options="field:'stockAmount',align:'center',width:100">商品库存量</th>
				
				
			</tr>
		</thead>
	</table>

		<div id="reportDialog" class="easyui-dialog" style="width:420px;padding:10px;" 
		data-options="inline:true,modal:true,closed:true,buttons:'#reportDialogBtns'">
		<div style="margin-bottom:20px" id="mes">
		<input type="text" disabled="disabled"  id="reportDialogMsg" style="width:100%;height:32px" >
		</div>
		
		<div style="margin-bottom:20px">
			<div>商品名称:
			<input id="productName2" type="text"   style="width:100%;height:32px"></div>
		</div>
		<div style="margin-bottom:20px">
			<div>商品进价:</div>
			<input id="cost2"  style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div>商品零售价:</div>
			<input  id="retail2" style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div>商品类别:</div>
			<input id="category2"   style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div>商品供应商:</div>
			<input id="privider2"   style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div>商品库存量:</div>
			<input id="stockAmount2"   style="width:100%;height:32px">
		</div>
	<div id="reportDialogBtns">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="ResourceApp.save()" data-options="iconCls:'icon-ok'">添加</a>
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
			// 状态 显示
			ResourceApp.operatorFmt2 = function(value, row, index) {

				if (value == '4') {
					return "管理员";
				}
				if (value == '0') {
					return "员工";
				}
				if (value == '3') {
					return "领导";
				}
				if (value == '2') {
					return "采购人员";
				}
				if (value == '1') {
					return "财务人员";
				}
			};
			ResourceApp.operatorFmt = function(value, row, index) {
				return "<a href='#' class='grid-linkbutton' iconCls='icon-delete' plain='true' "
						+ "onclick='ResourceApp.editReport(\"" + index + "\")'>编辑</a>";
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
			//增加库存种类
			ResourceApp.addReport = function() {
				$("#mes").hide();
				
				$("#productName2").val('');
				$("#cost2").val('');
				$("#retail2").val('');
				$("#category2").val('');
				$("#privider2").val('');
				$("#stockAmount2").val('');
				$('#reportDialog').dialog({
					title : "新增人员"
				}).dialog('open');
			};


			// 删除多个报告
			ResourceApp.deleteAllReport = function() {
				var checked = $("#" + _gridId).datagrid("getChecked");
				if (checked.length == 0) {
					alert("请选中需要删除的数据");
					return;
				} else {
					$("#reportSuccessMessager").hide();
				}
				var _RId = new Array();
				for (var i = 0; i < checked.length; i++) {
					_RId.push(checked[i].id);
				}
				EasyuiUtil.Messager.showConfirm('确定删除所选中的商品？', function(cr) {
					if (cr) {
						EasyuiUtil.Messager.showWaiting();
						$.post(basePath + "/rest/stock/deletestock", {
							id : _RId
						}, function(result) {
							EasyuiUtil.Messager.closeWaiting();
							if (result.result) {
								alert("数据已删除");
								ResourceApp.closeResourceDialog();
								ResourceApp.reloadData();
							} else {
								EasyuiUtil.Messager.showError(result.message);
								ResourceApp.closeResourceDialog();
							}
						}, "json");
					}
				});
			};

			// 关闭 弹出窗口
			ResourceApp.closeResourceDialog = function() {
				$("#reportDialog").dialog('close');
			}
			// 保存信息
			ResourceApp.save = function() {
				
				var _productName1 = $.trim($("#productName2").val());
				var _cost1 = $.trim($("#cost2").val());
				var _retail1 = $.trim($("#retail2").val());
				var _category1 = $.trim($("#category2").val());
				var _privider1 = $.trim($("#privider2").val());
				var _stockAmount1 = $.trim($("#stockAmount2").val());
				
				
				if (_productName1 == null || _productName1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入商品名称");
					return;
				}
				if (_cost1 == null || _cost1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入商品进价");
					return;
				}
				if (_retail1 == null || _retail1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入商品零售价 ");
					return;
				}
				if (_category1== null || _category1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入商品类别 ");
					return;
				}
				if (_privider1== null || _privider1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入供货商 ");
					return;
				}
				
				if (_stockAmount1== null || _stockAmount1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入商品库存量 ");
					return;
				}
				$("#mes").show();// ???
				var _data = {
					
					"productName" : _productName1,
					"cost" : _cost1,
					"retail" : _retail1,
					"category" : _category1,
					"privider" : _privider1,
					"stockAmount" : _stockAmount1
				};
				EasyuiUtil.Messager.showWaiting();
				$.post(basePath + "/rest/stock/insertstock", _data, function(r) {
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
					url : basePath + "/rest/stock/allstocklist",
					toolbarConfig : {
						add : {
							text : "添加商品",
							handler : ResourceApp.addReport
						},
						remove : {
							text : "删除商品",
							handler : ResourceApp.deleteAllReport
						}
					}  
				});
				
			});
		})(window, jQuery);

</script>  
</body>
</html>