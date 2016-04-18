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
					库存管理<span class="divider">/</span>
					</li>
			<li class="active">
					商品信息修改
					</li>
	</ul>
	<!-- -->
	<BR>

	<table id="ReportGrid"  title="商品信息修改">
		<thead>
			<tr>
			    <th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'id',width:30">id</th>
				<th data-options="field:'productNumber',align:'center',width:100">商品编号</th>
				<th data-options="field:'productName',align:'center',width:100">商品名称</th>
				<th data-options="field:'cost',align:'center',width:100">商品进价</th>
				<th data-options="field:'retail',align:'center',width:100">商品零售价</th>
				<th data-options="field:'category',align:'center',width:150">商品类别</th>
				<th data-options="field:'privider',align:'center',width:150">商品供应商</th>
				<th data-options="field:'stockAmount',align:'center',width:150">商品库存量</th>
				<th data-options="field:'stu',width:100 ,align:'center',formatter:ResourceApp.operatorFmt ">操作</th>
				
			</tr>
		</thead>
	</table>

		<div id="reportDialog" class="easyui-dialog" style="width:420px;padding:10px;" 
		data-options="inline:true,modal:true,closed:true,buttons:'#reportDialogBtns'">
		<div style="margin-bottom:20px" id="mes">
		<input type="text" disabled="disabled"  id="reportDialogMsg" style="width:100%;height:32px" >
		</div>
		<div style="margin-bottom:20px">
			<div>商品编号:
			<input id="productNumber2" type="text"   style="width:100%;height:32px"></div>
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
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="ResourceApp.updateReport()" data-options="iconCls:'icon-ok'">更新</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="ResourceApp.closeResourceDialog()" data-options="iconCls:'icon-close'">关闭</a>
		
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
						+ "onclick='ResourceApp.editReport(\"" + index + "\")'>点击修改</a>";
			};
	
			// 编辑报告
			ResourceApp.editReport = function(_rowindex) {
				$("#" + _gridId).datagrid("clearSelections");
				// 获取分页中所选行，并将行信息填入修改的表单中
				_row1 = EasyuiUtil.Grid.getGridRowByIndex(_gridId, _rowindex);
				$("#mes").hide();
				$("#productNumber2").val(_row1.productNumber);
				$("#productName2").val(_row1.productName);
				$("#cost2").val(_row1.cost);
				$("#retail2").val(_row1.retail);
				$("#category2").val(_row1.category);
				$("#privider2").val(_row1.privider);
				$("#stockAmount2").val(_row1.stockAmount);
				$('#reportDialog').dialog({
					title : "编辑人员信息"
				}).dialog('open');
			};
			

			// 关闭 弹出窗口
			ResourceApp.closeResourceDialog = function() {
				$("#reportDialog").dialog('close');
			}
		
			// 编辑信息
			ResourceApp.updateReport = function() {
				var _productNumber1 = $.trim($("#productNumber2").val());
				var _productName1 = $.trim($("#productName2").val());
				var _cost1 = $.trim($("#cost2").val());
				var _retail1 = $.trim($("#retail2").val());
				var _category1 = $.trim($("#category2").val());
				var _privider1 = $.trim($("#privider2").val());
				var _stockAmount1 = $.trim($("#stockAmount2").val());
				
				if (_productNumber1 == null || _productNumber1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val('请输入商品编号');
					return;
				}
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
					"id" : _row1.id,
					"productNumber" : _productNumber1,
					"productName" : _productName1,
					"cost" : _cost1,
					"retail" : _retail1,
					"category" : _category1,
					"privider" : _privider1,
					"stockAmount" : _stockAmount1
				};
				EasyuiUtil.Messager.showWaiting();
				$.post(basePath + "/rest/stock/updatestock", _data, function(r) {
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
					/* toolbarConfig : {
						add : {
							text : "新增人员",
							handler : ResourceApp.addReport
						},
						remove : {
							text : "删除人员",
							handler : ResourceApp.fabuAllReport
						}
					}  */
				});
				
			});
		})(window, jQuery);

</script>  
</body>
</html>