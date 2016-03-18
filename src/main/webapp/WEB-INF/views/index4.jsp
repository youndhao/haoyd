<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@include file="/WEB-INF/views/common.jsp" %>
<html lang="zh">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>销售预算与原材料采购系统</title>

<script src="${js_path}/jquery-1.9.1.min.js"></script>	
    <link href="${css_path }/bootstrap.min.css" rel="stylesheet">
    <link href="${css_path }/style.css" rel="stylesheet">
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="${css_path }/default.css">
	<link href="${css_path }/style1.css" rel="stylesheet"/>
	  <link href="${css_path }/normalize.css" rel="stylesheet"/>
	<style style="text/css">
	#AAA{
    width:auto;
    margin:0 auto;/*设置整个容器在浏览器中水平居中*/
}
	#BBB{
    /*此处对容器设置了高度，一般不建议对容器设置高度，一般使用overflow:auto;属性设置容器根据内容自适应高度，如果不指定高度或不设置自适应高度，容器将默认为1个字符高度，容器下方的布局元素（footer）设置margin-top:属性将无效*/
    margin-top:0px;/*此处讲解margin的用法，设置content与上面header元素之间的距离*/
     
}
#BBBCCC{
    height:auto;
    width:260px;
    margin:00px;/*设置元素跟其他元素的距离为20像素*/
    float:left;/*设置浮动，实现多列效果，div+Css布局中很重要的*/
    background:#414956;
}
#BBBDDD{
    height:555px;
    width:auto;
    margin:50px;/*设置元素跟其他元素的距离为20像素*/
    float:left;/*设置浮动，实现多列效果，div+Css布局中很重要的*/
}
	</style>
   </head>
  <body>

    <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					 
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
					</button> <a class="navbar-brand" href="${base_path }/rest/index">Strani</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							<a href="#">Link</a>
						</li>
					</ul>
					
					<ul class="nav navbar-nav navbar-right">
						
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎您   ${user.fullName}<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
							<!-- 	<li>
									<a href="#">-查看个人信息</a>
								</li>
								<li>
									<a href="#">-修改密码</a>
								</li>
								<li>
									<a href="#">-退出系统</a>
								</li> -->
								<li class="divider">
								</li>
								<li>
									<a href="${base_path}/rest/user/logout">退出系统</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</div>
		</div>
	</div>
	<div id="AAA">
	<div id="BBB">
			<div id="BBBCCC" >
					 <div class="colors" ><a href="javascript:void(0)" class="default"> </a><a href="javascript:void(0)" class="blue"> </a><a href="javascript:void(0)" class="white"></a></div>
   <nav>
        <div id="menu" class="menu1" >
          <div class="menu-header" > 功能菜单 </div>
          <ul id="page-sidebar-menu">
            <li class="active">
            <a href="/strani/rest/user/index#" id="btn-dashboard"><b>     首页</b></a></li>
             <li><a href="#"><b>个人信息</b></a>
              <ul class="submenu">
                <li><a href="${base_path}/rest/user/selectinfo"><b>查看个人信息</b></a></li>
                <li><a href="${base_path}/rest/user/changepassword"><b>用户密码修改</b></a></li>
              </ul>
            </li>
            <li><a href="#"><b>销售预算</b></a>
              <ul class="submenu">
              <c:if test="${user.role==1||user.role>2}">
                <li><a href="${base_path}/rest/sale/addsalehistory"><b>录入往年销售情况</b></a></li>
                <li><a href="${base_path}/rest/sale/salehistory"><b>分析往年销售情况</b></a></li>
                <li><a href="${base_path}/rest/sale/product"><b>录入产品库</b></a></li>
                <li><a href="${base_path}/rest/sale/salebudget"><b>填写今年销售预算</b></a></li>
                </c:if>
                <li><a href="${base_path}/rest/sale/salebudgetlist"><b>查看销售预算详情</b></a></li>
                <li><a href="${base_path}/rest/manage/managesalebudget"><b>查看销售预算清单</b></a></li>
              </ul>
            </li>
           <c:if test="${user.role>1}">
            <li><a href="#"><b>原材料采购</b></a>
              <ul class="submenu">
                <li><a href="${base_path}/rest/buy/buymaterial"> <b>原材料采购预算</b> </a></li>
                <li><a href="${base_path}/rest/buy/BuyMaterialList"> <b>原材料采购清单</b></a></li>
                <li><a href="${base_path}/rest/buy/material"> <b>录入原材料库</b> </a></li>
                <li><a href="${base_path}/rest/buy/materialstate"> <b>采购流程追踪</b> </a></li>
              </ul>
            </li>
            </c:if>
            <c:if test="${user.role>2}">
            <li><a href="#"><b>领导审批</b></a>
              <ul class="submenu">
                <li><a href="${base_path}/rest/manage/managesalebudget"> <b>销售预算审批</b></a></li>
                <li><a href="${base_path}/rest/manage/managebuyorder"> <b>采购清单审批</b></a></li>
              </ul>
            </li>
            </c:if>
              <c:if test="${user.role>3}">
               <li><a href="#"><b>用户管理</b></a>
              <ul class="submenu">
                <li><a href="${base_path}/rest/user/userlist"> <b>查看用户</b></a></li>
                <li><a href="${base_path}/rest/user/editUser"> <b>角色管理</b></a></li>
              </ul>
            </li>
            </c:if>
            <c:if test="${user.role<3}">
             <ul class="menu-footer"><a href="#"></a></ul>
             <ul class="menu-footer"><a href="#"></a></ul>
             <ul class="menu-footer"><a href="#"></a></ul>
            </c:if>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
            <li><a href="#">About</a></li>
            <li><a href="#"> Contact</a></li>
          </ul>
          <div class="menu-footer"> @QiEnBo</div>
        </div>
      </nav>
				</div>
				<div id="BBBDDD">
				
	</div>
 </div> 
 </div>

	<script type="text/javascript" src="${js_path }/script1.js"></script>
    <script src="${js_path}/bootstrap.min.js"></script>
    <script src="${js_path}/myscript.js"></script>
  <script type="text/javascript" src="${js_path}/highcharts/highcharts.src.js"></script>
  <script type="text/javascript" src="${js_path}/highcharts/exporting.js"></script>

  </body>
</html>