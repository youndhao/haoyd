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
					个人中心 <span class="divider">/</span>
					</li>
			<li class="active">
					查看个人信息
					</li>
	</ul>
	<!-- -->
	<BR>
	<table id="dataGrid" class="easyui-datagrid" >
		<thead>
			<tr>
				<th data-options="field:'fullName',align:'center',width:150">用户名</th>
				<th data-options="field:'email',align:'center',width:100">邮箱</th>
				<th data-options="field:'address',align:'center',width:150">住址</th>
				<th data-options="field:'city',align:'center',width:150">城市</th>
				<th data-options="field:'role',width:150 , align:'center',formatter:applyList.operatorFmt2">角色</th>
				<th data-options="field:'userName',align:'center',width:150" >账户</th><!-- , formatter:ResourceApp.operatorFmt2 -->
			</tr>
		</thead>
	</table>
	
	  <script type="text/javascript">
	 (function(window, $){
			var _baseOperatePath = basePath+'/rest/user';
			var _queryPath = _baseOperatePath+'/infolist';
			var _dataGridId = "dataGrid";

			applyList = {};

			applyList.operate = {
				search:function(){
					EasyuiUtil.Messager.showWaiting();
					applyList.Grid.reload({
					});
					EasyuiUtil.Messager.closeWaiting(); 
				}
		
			}
			// 状态 显示
			applyList.operatorFmt2 = function(value, row, index) {

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
			applyList.Grid = {
				getGrid: function(){
					return $('#' + _dataGridId);
				},
				init: function(){
					EasyuiUtil.Grid.initGrid(_dataGridId, {
						url: _queryPath, 
						onLoadSuccess:function(){
							$(".grid-button").linkbutton();
						}
					});
				},
				reload: function(_queryParams){
					applyList.Grid.getGrid().datagrid('load', _queryParams);
				},
				getRowData: function(_rowIndex){
					return EasyuiUtil.Grid.getGridRowByIndex(_dataGridId, _rowIndex);
				},
				getCheckedData: function(){
					return applyList.Grid.getGrid().datagrid('getChecked');
				},
				clearSelections: function(){
					applyList.Grid.getGrid().datagrid("clearSelections");
				},
				getSelectedAllRowId: function(){
					applyList.Grid.getGrid().datagrid("selectAll");
					var _checked = applyList.Grid.getCheckedData();
					var _ids = "";
					for(var i = 0; i < _checked.length; i++){
						_ids += _checked[i].id + ",";
					}
					return _ids.substring(0,_ids.length-1);
				}
				
			};
			
			window.applyList = applyList;
			
			
			$(function(){
				applyList.Grid.init();
				$('#query').click(function(){
					applyList.operate.search();
				});
			
				$('#add').click(function(){
					applyList.operate.add();
				});
			});
		})(window, jQuery);

</script>  
</body>
</html>