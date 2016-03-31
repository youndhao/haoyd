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
					原材料采购<span class="divider">/</span>
					</li>
			<li class="active">
					采购流程追踪
					</li>
	</ul>
	     <div align="right">  <b>   请选择要查看的采购清单   </b><select id="yeartime" style="width:200px;" onchange="ResourceApp.searchData()">
					<option value="">---请选择---</option>
					<c:forEach items="${listB}" var="listb">
					<option value="${listb.yeartime}">${listb.formattime}</option>
					</c:forEach>
					</select>
					</div> 
	<BR>
	<table id="ReportGrid"  title="采购流程信息">
		<thead>
			<tr>
			    <th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'mid',width:140">原材料编号</th>
				<th data-options="field:'year',align:'center',width:40">年份</th>
				<th data-options="field:'time',width:40,align:'center',formatter:ResourceApp.operatorFmt1">季度</th>
				<th data-options="field:'name',align:'center',width:40">产品</th>
				<th data-options="field:'cost',align:'center',width:40">单价(/元)</th>
				<th data-options="field:'count',align:'center',width:40">采购数量(/个)</th>
				<th data-options="field:'money',align:'center',width:40 ">总金额</th>
				<th data-options="field:'address',width:100 ">采购地址</th>
				<th data-options="field:'state',align:'center',width:40 ">状态</th>
				<c:if test="${user.role>2}">
				 <th data-options="field:'stu',width:100 ,align:'center',formatter:ResourceApp.operatorFmt ">操作</th>
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
		<input type="text" disabled="disabled"  id="name2" style="width:100%;height:32px" >
		</div>
		
		<div style="margin-bottom:20px">
			<div>采购地址:</div>
			<textarea id="address2" style="width:100%;height:100px"></textarea>
		</div>
		<div style="margin-bottom:20px">
			<div>状态:
			<select id="state2" style="width:50%;height:32px"><option value="下单">下单</option>
			<option value="发运">发运</option><option value="撤销订单">撤销订单</option><option value="不能接收">不能接收</option><option value="接受">接收</option><option value="付款">付款</option><option value="入库">入库</option><option value="退货">退货</option></select></div>
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
			// 关闭 弹出窗口
			ResourceApp.closeResourceDialog = function() {
				$("#reportDialog").dialog('close');
			}
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
			// 编辑报告
			ResourceApp.editReport = function(_rowindex) {
				$("#" + _gridId).datagrid("clearSelections");
				// 获取分页中所选行，并将行信息填入修改的表单中
				_row1 = EasyuiUtil.Grid.getGridRowByIndex(_gridId, _rowindex);
				$("#mes").hide();
				$("#name2").val(_row1.name);
				$("#address2").val(_row1.address);
				$("#state2").val(_row1.state);
				$('#reportDialog').dialog({
					title : "产品详情"
				}).dialog('open');
			};
			// 编辑信息
			ResourceApp.updateReport = function() {
				var _address1 = $.trim($("#address2").val());
				var _state1 = $.trim($("#state2").val());
				var _data = {
					"mid" : _row1.mid,
					"year" : _row1.year,
					"time" :_row1.time,
					"address" : _address1,
					"state" : _state1
				};
				EasyuiUtil.Messager.showWaiting();
				$.post(basePath + "/rest/buy/buyeditstate", _data, function(r) {
					if (r.result) {
						alert(r.message);
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
					url : basePath + "/rest/buy/BuyMaterialjson",
					 toolbarConfig : {
						 /*
						add : {
							text : "新增人员",
							handler : ResourceApp.addReport
						},
						remove : {
							text : "删除人员",
							handler : ResourceApp.fabuAllReport
						}*/
					}  
				});
				
			});
		})(window, jQuery);

</script>  
</body>
</html>