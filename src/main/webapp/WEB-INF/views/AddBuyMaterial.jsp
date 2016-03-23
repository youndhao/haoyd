<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<!doctype html>
<html lang="zh-CN">
<head>
<link href="${css_path}/tablestyle.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$("table tr:nth-child(odd)").addClass("odd-row");
		$("table td:first-child, table th:first-child").addClass("first");
		$("table td:last-child, table th:last-child").addClass("last");
	});
</script>


<title>录入原材料采购预算</title>
</head>
<body>
	<input type="hidden" id="numForRecord" value="0" />
		<br>
		<br>
	<ul class="breadcrumb">
			<li>
					首页 <span class="divider">/</span>
					</li>
			<li>
					原材料采购<span class="divider">/</span>
					</li>
			<li class="active">
					原材料采购预算
					</li>
	</ul>
	<div>

		<!-- 表单 start-->
		<div>
	
			<form id="form">
				<div>
					<div>
						<table>
							<tr>
								<td>
								<input type="checkbox" id="selectAll" /></td>
								<td><b>序号</b></td>
								<td><b>年份选择</b></td>
								<td><b>季度选择</b></td>
								<td><b>原材料</b></td>
								<td><b>采购厂商</b></td>
								<td><b>采购数量</b></td>
							</tr>
	<!-- 							<tr id="{0}">
			<td style="text-align: center;">
				---
			</td>
			<td style="text-align: center;">---</td>
			<td>
				<select
					id="year"
					name="year">
					<option value="s" selected="selected">---请选择---</option>
					<option value="2016">2016</option>
					<option value="2015">2015</option>
					<option value="2014">2014</option>
					<option value="2013">2013</option>
					<option value="2012">2012</option>
					<option value="2011">2011</option>
					<option value="2010">2010</option>
					<option value="2009">2009</option>
					<option value="2008">2008</option>
					<option value="2007">2007</option>
					<option value="2006">2006</option>
					
					</select>
			</td>
			<td>
				 	<select 
					id="time"
					name="time">
					<option value="2" selected="selected">---请选择---</option>
					<option value="1">第一季度</option>
					<option value="2">第二季度</option>
					<option value="3">第三季度</option>
					<option value="4">第四季度</option>
					</select>
			</td>
			<td>请在下面选择</td>
			<td>请填入数字</td> -->
						 	<tr id="appendBefore">
								<td colspan="7" align="center"><input type="button"
									id="addRecord" class="btn btn-default btn-sm " value="添加一行" />
									<input type="button" id="deleteRecord"
									class="btn btn-default btn-sm " value="删除一行" /></td>
							</tr> 
							<tr>
							<td colspan="7" align="right"><input type="button"
							id="save" class="btn btn-default btn-sm " value="保存" > </td>
							</tr>
							</table>
					</div>
						
				</div>
			</form>
		
			
		</div>

		<!-- 渠道模板 start -->
		<textarea id="template" name="ajspChannelApply" style="display: none">
		<tr id="{0}">
			<td style="text-align: center;">
				<input type="checkbox" id="checkbox{0}" name="checkbox" value="{0}" />
			</td>
			<td style="text-align: center;">{0}</td>
			 <td>
				<select
					id="buymaterials[{0}].year"
					name="buymaterials[{0}].year">
					<option value="">---请选择---</option>
					<option value="2016">2016</option>
					<option value="2015">2015</option>
					<option value="2014">2014</option>
					<option value="2013">2013</option>
					<option value="2012">2012</option>
					<option value="2011">2011</option>
					<option value="2010">2010</option>
					<option value="2009">2009</option>
					<option value="2008">2008</option>
					<option value="2007">2007</option>
					<option value="2006">2006</option>
					
					</select>
			</td> 
			<td>
				 	<select 
					id="buymaterials[{0}].time"
					name="buymaterials[{0}].time">
					<option value="">---请选择---</option>
					<option value="1">第一季度</option>
					<option value="2">第二季度</option>
					<option value="3">第三季度</option>
					<option value="4">第四季度</option>
					</select>
			</td>
			<td>
				<select 
					id="buymaterials[{0}].name"
					name="buymaterials[{0}].name">
					<option value="">---请选择---</option>
					<c:forEach items="${listA}" var="lista">
					<option value="${lista.mid}">${lista.name}</option>
					</c:forEach>
					</select>
			</td>
			<td>
				<input type="text" id="salehsit{0}.address"
					name="buymaterials[{0}].address" />
			</td>
			<td>
				<input style="width:50px" type="text" id="salehsit{0}.count"
					name="buymaterials[{0}].count" />&nbsp; /个
			</td>
		</tr>
	</textarea>
		<!-- 渠道模板 end -->

	</div>

	<script>
		$(function() {

			//提交点击确定
			$('#form').on('selectDecision.ms.submitOver', function(e) {
				window.close();
			});


			var _baseOperatePath = basePath + '/rest/buy';

			vcApplyForm = {};
			window.vcApplyForm = vcApplyForm;
			vcApplyForm.operate = {

				check : function() {
					var i = $(this).val();
					var flag = false;
					$(".channelNumber").not($(this)).each(function() {
						if ($(this).val() == i && $(this).val() != "") {
							flag = true;
						}
					});
					if (flag) {
						$(this).val("");
					}
				},

				addRow : function() {
					i = parseInt($("#numForRecord").val());
					var template = $("#template").val();
					var templatei = template.replace(/\{0}/g, i);
				 	$("#appendBefore").before(templatei); 
					i++;
					$("#numForRecord").val(i);
					$(".channelNumber").blur(vcApplyForm.operate.check);
				},

				removeRow : function() {
					//获取选中的复选框，然后循环遍历删除
					var allCheckbox = $("input[name='checkbox']:checked");
					if (allCheckbox.size() == 0) {
						alert("要删除指定行，需选中要删除的行！");
						return;
					}
					allCheckbox.each(function() {
						$(this).parent().parent().remove();
					});
				},

				selectAll : function() {
					var obj = document.getElementsByName("checkbox");
					var flag = document.getElementById("selectAll").checked;
					for (var i = 0; i < obj.length; i++) {
						obj[i].checked = flag;
					}
				},
				
				save :function() {
					$.post( _baseOperatePath+"/buymaterialsave", $("#form").serialize(), function(r){
						if(r.result){
							alert("保存成功");
							window.close();
						}else{
							alert(r.message);
						}
					}, 'json');
					
				}
			};

			$(".channelNumber").blur(vcApplyForm.operate.check);

			$('#addRecord').click(function() {
				vcApplyForm.operate.addRow();
			});
			$('#deleteRecord').click(function() {
				vcApplyForm.operate.removeRow();
			});
			$('#selectAll').click(function() {
				vcApplyForm.operate.selectAll();
			});
			$('#save').click(function() {
				vcApplyForm.operate.save();
			});
		});
	</script>
</body>
</html>