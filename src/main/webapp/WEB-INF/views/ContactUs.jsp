<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/views/common.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>联系我们</title>
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
<DIV id=demo style="BACKGROUND: #ffffff; OVERFLOW: hidden; WIDTH: 950px; COLOR: #0000ff; HEIGHT: 600px"> 
        <div id="ww">ddd</div>
        <div align="center" > 
         <table width="100%" border="0">
        <tr>
        <td><img src="${css_path }/images/xiaotu/mapp1.jpg" width="950" height="300" border="0"></td>
         </tr> 
         <tr>
        <td><img border="0" src="${css_path }/images/xiaotu/mapp2.jpg" width="950" height="300" border="0"></td>
         </tr> 
        </table>
        </div> 
    </DIV> 
    <BR>
<BR>
	<ul class="breadcrumb">
			<li>
					首页 <span class="divider">/</span>
					</li>
			<li>
					联系我们 <span class="divider">/</span>
					</li>
			<li class="active">
					大区负责人管理
					</li>
	</ul>
	<!-- -->
	<BR>

	<table id="ReportGrid"  title="大区负责人信息">
		<thead>
			<tr>
			    <th data-options="field:'ck',checkbox:true"></th>
			    <th data-options="field:'id',width:30">id</th>
				<th data-options="field:'region',width:100 , align:'center',formatter:ResourceApp.operatorFmt2">角色</th>
				<th data-options="field:'head',align:'center',width:100">大区负责人</th>
				<th data-options="field:'mobile',align:'center',width:100">移动电话</th>
				<th data-options="field:'phone',align:'center',width:100">固定电话</th>
				<th data-options="field:'mail',align:'center',width:100">邮箱地址</th>
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
			<div>销售大区:</div>
			<select id="region2" style="width:100%;height:32px"><option value="0" >华北地区</option>
			<option value="1">东北地区</option><option value="2">华中地区</option><option value="3">华东地区</option>
			<option value="4">华南地区</option><option value="5">西南地区</option><option value="6">西北地区</option>
			</select>
		</div>
		<div style="margin-bottom:20px">
			<div>大区负责人:</div>
			<input id="head2"  style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div>移动电话:</div>
			<input  id="mobile2" style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div>固定电话:</div>
			<input id="phone2"   style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div>邮箱地址:</div>
			<input id="mail2"   style="width:100%;height:32px">
		</div>
		
	<div id="reportDialogBtns">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="ResourceApp.save()" data-options="iconCls:'icon-ok'">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="ResourceApp.closeResourceDialog()" data-options="iconCls:'icon-close'">关闭</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="ResourceApp.update()" data-options="iconCls:'icon-ok'">修改</a>
		
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

				if (value == '0') {
					return "华北地区";
				}
				if (value == '1') {
					return "东北地区";
				}
				if (value == '2') {
					return "华中地区";
				}
				if (value == '3') {
					return "华东地区";
				}
				if (value == '4') {
					return "华南地区";
				}
				if (value == '5') {
					return "西南地区";
				}
				if (value == '6') {
					return "西北地区";
				}
			};
			ResourceApp.operatorFmt = function(value, row, index) {
				return "<a href='#' class='grid-linkbutton' iconCls='icon-delete' plain='true' "
						+ "onclick='ResourceApp.editReport(\"" + index + "\")'>修改人员信息</a>";
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
				
				$("#region2").val('');
				$("#head2").val('');
				$("#mobile2").val('');
				$("#phone2").val('');
				$("#mail2").val('');
				$('#reportDialog').dialog({
					title : "新增负责人"
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
						$.post(basePath + "/rest/about/deletecontact", {
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
			// 编辑报告
			ResourceApp.editReport = function(_rowindex) {
				$("#" + _gridId).datagrid("clearSelections");
				// 获取分页中所选行，并将行信息填入修改的表单中
				_row1 = EasyuiUtil.Grid.getGridRowByIndex(_gridId, _rowindex);
				$("#mes").hide();
				$("#region2").val(_row1.region);
				$("#head2").val(_row1.head);
				$("#mobile2").val(_row1.mobile);
				$("#phone2").val(_row1.phone);
				$("#mail2").val(_row1.mail);
				$('#reportDialog').dialog({
					title : "编辑人员信息"
				}).dialog('open');
			};
			
			// 关闭 弹出窗口
			ResourceApp.closeResourceDialog = function() {
				$("#reportDialog").dialog('close');
			}
			// 保存信息
			ResourceApp.save = function() {
				
				var _region1 = $.trim($("#region2").val());
				var _head1 = $.trim($("#head2").val());
				var _mobile1 = $.trim($("#mobile2").val());
				var _phone1 = $.trim($("#phone2").val());
				var _mail1 = $.trim($("#mail2").val());
				
				
				
				if (_region1 == null || _region1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入销售大区");
					return;
				}
				if (_head1 == null || _head1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入负责人姓名");
					return;
				}
				if (_mobile1 == null || _mobile1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入移动电话 ");
					return;
				}
				if (_phone1== null || _phone1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入固定电话 ");
					return;
				}
				if (_mail1== null || _mail1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入邮箱地址 ");
					return;
				}
				
			
				$("#mes").show();// ???
				var _data = {
					
					"region" : _region1,
					"head" : _head1,
					"mobile" : _mobile1,
					"phone" : _phone1,
					"mail" : _mail1,
				};
				EasyuiUtil.Messager.showWaiting();
				$.post(basePath + "/rest/about/insertcontact", _data, function(r) {
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
             ResourceApp.update = function() {
				
				var _region1 = $.trim($("#region2").val());
				var _head1 = $.trim($("#head2").val());
				var _mobile1 = $.trim($("#mobile2").val());
				var _phone1 = $.trim($("#phone2").val());
				var _mail1 = $.trim($("#mail2").val());
				
				
				
				if (_region1 == null || _region1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入销售大区");
					return;
				}
				if (_head1 == null || _head1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入负责人姓名");
					return;
				}
				if (_mobile1 == null || _mobile1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入移动电话 ");
					return;
				}
				if (_phone1== null || _phone1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入固定电话 ");
					return;
				}
				if (_mail1== null || _mail1 == "") {
					$("#mes").show();
					$("#reportDialogMsg").val("请输入邮箱地址 ");
					return;
				}
				
			
				$("#mes").show();// ???
				var _data = {
					"id" : _row1.id,
					"region" : _region1,
					"head" : _head1,
					"mobile" : _mobile1,
					"phone" : _phone1,
					"mail" : _mail1,
				};
				EasyuiUtil.Messager.showWaiting();
				$.post(basePath + "/rest/about/updatecontact", _data, function(r) {
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
					url : basePath + "/rest/about/allcontactlist",
					toolbarConfig : {
						add : {
							text : "添加负责人",
							handler : ResourceApp.addReport
						},
						remove : {
							text : "删除负责人",
							handler : ResourceApp.deleteAllReport
						}
					}  
				});
				
			});
		})(window, jQuery);

</script> 
</body>
</html>