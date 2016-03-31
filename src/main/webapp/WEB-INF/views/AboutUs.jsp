<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/views/common.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	  

</head>
<body>

<DIV id=demo style="BACKGROUND: #ffffff; OVERFLOW: hidden; WIDTH: 970px; COLOR: #0000ff; HEIGHT: 200px"> 

    <DIV id=demo1> 

        <div align="center" > 

         <table width="100%" border="0">

        <tr>

        <td><img src="${css_path }/images/xiaotu/1.jpg" width="150" height="120" border="0"></td>

        <td><img border="0" src="${css_path }/images/xiaotu/2.jpg" width="150" height="120" border="0"></td>

        <td><img border="0" src="${css_path }/images/xiaotu/3.jpg" width="150" height="120" border="0"></td>

        <td><img border="0" src="${css_path }/images/xiaotu/4.jpg" width="150" height="120" border="0"></td>
         </tr>

        <tr>
        <td><img border="0" src="${css_path }/images/xiaotu/1.jpg" width="150" height="120" border="0"></td>

        <td><img border="0" src="${css_path }/images/xiaotu/2.jpg" width="150" height="120" border="0"></td>

        <td><img border="0" src="${css_path }/images/xiaotu/3.jpg" width="150" height="120" border="0"></td>

        <td><img border="0" src="${css_path }/images/xiaotu/4.jpg" width="150" height="120" border="0"></td>

        </tr>

          <tr>
        <td><img border="0" src="${css_path }/images/xiaotu/1.jpg" width="150" height="120" border="0"></td>

        <td><img border="0" src="${css_path }/images/xiaotu/2.jpg" width="150" height="120" border="0"></td>

        <td><img border="0" src="${css_path }/images/xiaotu/3.jpg" width="150" height="120" border="0"></td>

        <td><img border="0" src="${css_path }/images/xiaotu/4.jpg" width="150" height="120" border="0"></td>

        <td><img border="0" src="${css_path }/images/xiaotu/1.jpg" width="150" height="120" border="0"></td>

        </tr>
        </table>

        </div> 

    </DIV> 

    <DIV id=demo2></DIV> 

</DIV>
<div>
<center><MARQUEE scrollAmount=6 scrollDelay=5 direction=up width=970px height=200px> 
<DIV align=center><IMG src="${css_path }/images/xiaotu/1.jpg" width="100%" border=0></DIV> 
<DIV align=center><IMG src="${css_path }/images/xiaotu/2.jpg" width="100%" border=0></DIV> 
</MARQUEE></center>
</div>
<script>

var speed=1

demo2.innerHTML=demo1.innerHTML

function Marquee(){

if(demo2.offsetTop-demo.scrollTop<=0)

demo.scrollTop-=demo1.offsetHeight

else{

demo.scrollTop++

}

}

var MyMar=setInterval(Marquee,speed)

demo.onmouseover=function() {clearInterval(MyMar)}

demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)}

</script>
</body>
</html>