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
					用户管理 <span class="divider">/</span>
					</li>
			<li class="active">
					查看所有用户
					</li>
	</ul>
	<!-- -->
	<BR>

	<table id="ReportGrid"  title="人员组织信息">
		<thead>
			<tr>
			    <th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'id',align:'center',width:30">id</th>
				<th data-options="field:'fullName',align:'center',width:100">用户名</th>
				<th data-options="field:'userName',align:'center',width:100">账户</th>
				<th data-options="field:'email',align:'center',width:100">邮箱</th>
				<th data-options="field:'city',align:'center',width:100">城市</th>
				<th data-options="field:'address',align:'center',width:150">住址</th>
				<th data-options="field:'role',align:'center',width:100 , formatter:ResourceApp.operatorFmt2">角色</th>
				
			</tr>
		</thead>
	</table>

		<div id="reportDialog" class="easyui-dialog" style="width:420px;padding:10px;" 
		data-options="inline:true,modal:true,closed:true,buttons:'#reportDialogBtns'">
		<div style="margin-bottom:20px" id="mes">
		<input type="text" disabled="disabled"  id="reportDialogMsg" style="width:100%;height:32px" >
		</div>
		<div style="margin-bottom:20px">
			<div>用户名:
			<input id="fullName2" type="text"   style="width:100%;height:32px"></div>
		</div>
		<div style="margin-bottom:20px">
			<div>账户名:</div>
			<input id="userName2"  style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div>Email:</div>
			<input  id="email2"   style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div>住址:</div>
			<input id="address2"   style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div>城市:</div>
			<input id="city2"   style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div>密码:</div>
			<input id="password2" class="easyui-textbox" style="width:100%;height:32px">
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
			ResourceApp.addReport = function() {
				$("#mes").hide();
				$("#fullName2").val('');
				$("#userName2").val('');
				$("#password2").val('');
				$("#city2").val('');
				$("#address2").val('');
				$("#email2").val('');
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
				EasyuiUtil.Messager.showConfirm('确定删除所选中的人员？', function(cr) {
					if (cr) {
						EasyuiUtil.Messager.showWaiting();
						$.post(basePath + "/rest/user/deleteuser", {
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
				var _fullName1 = $.trim($("#fullName2").val());
				var _userName1 = $.trim($("#userName2").val());
				var _password1 = $.trim($("#password2").val());
				var _city1 = $.trim($("#city2").val());
				var _address1 = $.trim($("#address2").val());
				var _email1 = $.trim($("#email2").val());

				if (_fullName1 == null || _fullName1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入用户名");
					return;
				}
				if (_userName1 == null || _userName1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入账号");
					return;
				}
				if (_password1 == null || _password1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入用户密码 ");
					return;
				}
				if (_email1 == null || _email1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入邮箱 ");
					return;
				}
				if (_city1== null || _city1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入用户所在城市 ");
					return;
				}
				if (_address1== null || _address1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入用户地址 ");
					return;
				}
				$("#mes").hide();// ??
				var _data = {
						"address" : _address1,
						"city" : _city1,
						"email" : _email1,
						"userName" : _userName1,
						"fullName" : _fullName1,
						"password" : _password1
				};
				EasyuiUtil.Messager.showWaiting();
				$.post(basePath + "/rest/user/register2", _data, function(r) {
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
					url : basePath + "/rest/user/alluserlist",
					toolbarConfig : {
						add : {
							text : "新增人员",
							handler : ResourceApp.addReport
						},
						remove : {
							text : "删除人员",
							handler : ResourceApp.deleteAllReport
						}
					}  
				});
				
			});
		})(window, jQuery);

</script>  
</body>
</html>