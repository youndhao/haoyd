<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@include file="/WEB-INF/views/common.jsp" %>
<html lang="zh">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

  
<title>后台模板管理系统</title>
<link type="text/css" rel="stylesheet" href="${js_path}/ind5/css/style.css" />
<script type="text/javascript" src="${js_path}/ind5/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${js_path}/ind5/js/menu.js"></script>
<script src="${js_path}/ind5/js/myscript.js"></script>

<style style="text/css">
	
#BBBDDD{
    height:555px;
    width:850px;
    margin:50px;/*设置元素跟其他元素的距离为20像素*/
    float:left;/*设置浮动，实现多列效果，div+Css布局中很重要的*/
    margin-top:0px;
}
	</style>
</head>

<body onload="startTime()">
<div class="top"></div>
<div id="header">
	<div class="logo">商品销售后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a href="" data-toggle="dropdown">${user.fullName}<strong class="caret"></strong></a></li>
			<li><a href="">修改密码</a></li>
			<li><a href="">设置</a></li>
			<li><a href="${base_path}/rest/user/logout">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
				<ul id="nav_dot">
      <li>
          <h4 class="M1"><span></span>系统公告</h4>
          <div class="list-item none">
            <a href="${base_path}/rest/user/selectinfo"><b>查看个人信息</b></a>
            <a href="${base_path}/rest/user/changepassword"><b>用户密码修改</b></a>
            <a href=''>系统公告3</a>
            <a href=''>系统公告4</a>
          </div>
        </li>
        <c:if test="${user.role>1}">
        <li>
          <h4 class="M2"><span></span>工单处理</h4>
          <div class="list-item none">
            <c:if test="${user.role==1||user.role>2}">
                <a href="${base_path}/rest/sale/addsalehistory"><b>录入往年销售情况</b></a>
                <a href="${base_path}/rest/sale/salehistory"><b>分析往年销售情况</b></a>
                <a href="${base_path}/rest/sale/product"><b>录入产品库</b></a>
                <a href="${base_path}/rest/sale/salebudget"><b>填写今年销售预算</b></a>
                </c:if>
                <a href="${base_path}/rest/sale/salebudgetlist"><b>查看销售预算详情</b></a>
                <a href="${base_path}/rest/manage/managesalebudget"><b>查看销售预算清单</b></a> 
           </div>
        </li>
        </c:if>
         <c:if test="${user.role>2}">
        <li>
          <h4 class="M3"><span></span>基础教学</h4>
          <div class="list-item none">
            <a href="${base_path}/rest/manage/managesalebudget"> <b>销售预算审核</b></a>
            <a href="${base_path}/rest/manage/managebuyorder"> <b>采购清单审核</b></a>
          </div>
        </li>
        </c:if>
         <c:if test="${user.role>3}">
		<li>
          <h4 class="M4"><span></span>评论管理</h4>
          <div class="list-item none">
            <a href="${base_path}/rest/user/userlist"> <b>查看用户</b></a>
            <a href="${base_path}/rest/user/editUser"> <b>角色管理</b></a>
          </div>
        </li>
         </c:if>
        
		<li>
          <h4 class="M5"><span></span>调研问卷</h4>
          <div class="list-item none">
             <a href="${base_path}/rest/stock/selectstock"> <b>商品信息查询</b></a>
             <a href="${base_path}/rest/stock/stocklist"> <b>商品入库管理</b></a>
             <a href="${base_path}/rest/stock/editstock"> <b>商品信息修改</b></a>
          </div>
        </li>
				<li>
          <h4  class="M6"><span></span>数据统计</h4>
          <div class="list-item none">
            <a href="${base_path}/rest/about/about1"> <b>产品展示</b></a>
		    <a href="${base_path}/rest/about/about2"> <b>产品展示</b></a>
			<a href="${base_path}/rest/about/about3"> <b>产品展示</b></a>
          </div>
        </li>
				<li>
          <h4  class="M7"><span></span>奖励管理</h4>
          <div class="list-item none">
           <a href="${base_path}/rest/about/contact"> <b>联系我们</b></a>
            <a href=''>奖励管理3</a>
          </div>
        </li>
				<li>
          <h4   class="M8"><span></span>字典维护</h4>
          <div class="list-item none">
            <a href=''>字典维护1</a>
            <a href=''>字典维护2</a>
            <a href=''>字典维护3</a>
						<a href=''>字典维护4</a>
            <a href=''>字典维护5</a>
            <a href=''>字典维护6</a>
						<a href=''>字典维护7</a>
            <a href=''>字典维护8</a>
            <a href=''>字典维护9</a>
						<a href=''>字典维护4</a>
            <a href=''>字典维护5</a>
            <a href=''>字典维护6</a>
						<a href=''>字典维护7</a>
            <a href=''>字典维护8</a>
            <a href=''>字典维护9</a>
          </div>
        </li>
				<li>
          <h4  class="M9"><span></span>内容管理</h4>
          <div class="list-item none">
            <a href=''>内容管理1</a>
            <a href=''>内容管理2</a>
            <a href=''>内容管理3</a>
          </div>
        </li>
				<li>
          <h4   class="M10"><span></span>系统管理</h4>
          <div class="list-item none">
            <a href=''>系统管理1</a>
            <a href=''>系统管理2</a>
            <a href=''>系统管理3</a>
          </div>
        </li>
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li><img src="${js_path}/ind5/images/home.png"></li>
								<li style="margin-left:25px">
								<div id="txt1" align="center" style="color:black; font-size:18px"></div>
                                </li>
								<li><a href="#">返回</a></li>
								
						</ul>
			</div>
			<div  id="BBBDDD" >
				
			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 Youndhao</p></div>
<script>navList(12);</script>
<script type="text/javascript">

function startTime(){
    //获得显示时间的div
    t_div = document.getElementById('txt1');
   var now=new Date()
    //替换div内容 
   t_div.innerHTML = "现在是"+now.getFullYear()
    +"年"+(now.getMonth()+1)+"月"+now.getDate()
    +"日"+now.getHours()+"时"+now.getMinutes()
    +"分"+now.getSeconds()+"秒";
    //等待一秒钟后调用time方法，由于settimeout在time方法内，所以可以无限调用
   setTimeout(startTime,1000);
  }
  </script>
</body>
</html>

