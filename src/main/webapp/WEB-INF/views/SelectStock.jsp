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
					商品入库查询
					</li>
	</ul>
	<BR>
	<ul class="breadcrumb">
	
		
			<div class="form-search" >
				商品名称：<input type="text" id="Name" />
				<button type="button" class="btn btn-success resource-search-btn" onclick="ResourceApp.selectReport()"><i class="icon-search icon-white"></i> 搜索</button>
			</div>
				<table id="ReportGrid" singleSelect="true" title="商品入库信息">
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
	     </div>
  </ul>
</body>
<script type="text/javascript">


(function(window, $) {
	var _gridId = 'ReportGrid';
	var ResourceApp = {};
	// 加载数据
	ResourceApp.reloadData = function(p_queryParams) {
		$("#" + _gridId).datagrid('clearSelections').datagrid("load",
				p_queryParams);
	};
	

	
 window.ResourceApp = ResourceApp;
    $(function() {
    	ResourceApp.selectReport = function() {
    		
    		
    		
    		var _productName1 = $("#Name").val();
    	
    	    ResourceApp.reloadData({
    		productName: _productName1
    	});
    	    
    };
    	
	EasyuiUtil.Grid.initGrid(_gridId,{
		url : basePath + "/rest/stock/allstocklist",
		/*toolbarConfig : {
			add : {
				text : "添加商品",
				handler : ResourceApp.addReport
			},
			remove : {
				text : "删除商品",
				handler : ResourceApp.deleteAllReport
			}
		}  */
	    });
   });
})(window, jQuery);
</script>

</html>