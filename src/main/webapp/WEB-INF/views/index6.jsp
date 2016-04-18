<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@include file="/WEB-INF/views/common.jsp" %>
<html lang="zh">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<title>首页</title>
<link rel="stylesheet" type="text/css" href="${js_path}/ind6/css/style.css" />

<script type="text/javascript" src="${js_path}/ind5/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${js_path}/ind6/js/index.js"></script>
<script src="${js_path}/ind6/js/myscript.js"></script>
<style style="text/css">
.navigation{float:right;margin:5px 50px 0 0;color:#fff;font-size:14px;}
.navigation ul li{height:30px;line-height:30px;text-align:center;float:left;margin-left:15px;}
.navigation ul li a{color:#fff;}
#BBBDDD{
    height:600px;
    width:900px;
    margin:50px;/*设置元素跟其他元素的距离为20像素*/
    float:right;/*设置浮动，实现多列效果，div+Css布局中很重要的*/
    margin-top:0px;
    margin-right:75px;
}
	</style>
</head>

<body>
<div class="nav-top">
	<span>个人后台管理系统</span>
    <div class="navigation">
    <ul>
		 	<li>欢迎您！</li>
			<li><a href="" >${user.fullName}</a></li>
			<li><a href="">修改密码</a></li>
			<li><a href="${base_path}/rest/user/logout">退出</a></li>
		</ul>
    </div>
</div>
<div class="nav-down" id="content">
	<div class="leftmenu1">
        <div class="menu-oc"><img src="${js_path}/ind6/images/menu-all.png" /></div>
    	<ul>
        	<li>
            	<a class="a_list a_list1">全局设置</a>
                <div class="menu_list menu_list_first">
                	<a class="lista_first" href="#">基本设置</a>
                    <a href="${base_path}/rest/stock/selectstock"> <b>商品信息查询</b></a>
                    <a href="#">界面风格</a>
                    <a href="#">系统工具</a>
                </div>
            </li>
            <li>
            	<a class="a_list a_list2">权限管理</a>
                <div class="menu_list">
                	<a href="#">基本权限</a>
                    <a href="#">分配权限</a>
                    <a href="#">权限管理</a>
                    <a href="#">成员管理</a>
                </div>
            </li>
            <li>
            	<a class="a_list a_list3">新闻管理</a>
                <div class="menu_list">
                	<a href="#">新闻中心</a>
                    <a href="#">添加新闻</a>
                    <a href="#">修改新闻</a>
                    <a href="#">删除新闻</a>
                </div>
            </li>
            <li>
            	<a class="a_list a_list3">新闻管理</a>
                <div class="menu_list">
                	<a href="#">新闻中心</a>
                    <a href="#">添加新闻</a>
                    <a href="#">修改新闻</a>
                    <a href="#">删除新闻</a>
                </div>
            </li>
        </ul>
    </div>
    <div class="leftmenu2">
    	<div class="menu-oc1"><img src="${js_path}/ind6/images/menu-all.png" /></div>
        <ul>
        	<li>
            	<a class="j_a_list j_a_list1"></a>
                <div class="j_menu_list j_menu_list_first">
                	<span class="sp1"><i></i>全局设置</span>
                	<a class="j_lista_first" href="#">基本设置</a>
                    <a href="${base_path}/rest/stock/selectstock">商品信息查询</a>
                    <a href="#">界面风格</a>
                    <a href="#">系统工具</a>
                </div>
            </li>
            <li>
            	<a class="j_a_list j_a_list2"></a>
                <div class="j_menu_list">
                	<span class="sp2"><i></i>权限管理</span>
                	<a href="#">基本权限</a>
                    <a href="#">分配权限</a>
                    <a href="#">权限管理</a>
                    <a href="#">成员管理</a>
                </div>
            </li>
            <li>
            	<a class="j_a_list j_a_list3"></a>
                <div class="j_menu_list">
                	<span class="sp3"><i></i>权限管理</span>
                	<a href="#">基本权限</a>
                    <a href="#">分配权限</a>
                    <a href="#">权限管理</a>
                    <a href="#">成员管理</a>
                </div>
            </li>
        </ul>
        
    </div>
    <div class="rightcon" >
    	<div class="right_con"  align="right">
        	
        </div>
        <div id="BBBDDD" align="left"></div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
	
</script>