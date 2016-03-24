<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">

	var _baseOperatePath = basePath+'/rest/user';
	var  sss ={
	    add:function (){
		var a = $("#password").val();
		var b = $("#password1").val();
		if(a==''||a==null){
			alert("请输入密码");
		}else{
			if(b==''||b==null){
			alert("2次输入密码不一致！");
		}else{
			if(a==b){
				ddd.postdata();
			}else{
				alert("2次输入密码不一致！");
			}
		
			
		}
}	
	}

	}
	var ddd ={
			postdata:function(){
				$.ajax({
					type : 'POST',
					url :_baseOperatePath+'/changepass',
					data : {'password':$("#password").val()},
					async : true,
					dataType : 'json',
					success : function(r){
						alert(r.message);
						$("#password").val('');
						$("#password1").val('');
					},
				    error : function(jqXHR, statusText, error){
						var msg = "网络故障！(" + jqXHR.status + "：" + error + ")";
					}
				}); 
			} 
	}

</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>密码修改</title>
<body>
<BR>
<BR>
	<ul class="breadcrumb">
			<li>
					首页 <span class="divider">/</span>
					</li>
			<li>
					个人信息 <span class="divider">/</span>
					</li>
			<li class="active">
					修改密码
					</li>
	</ul>
	<!-- -->
	<BR>
	<form style="width:400px;" >
  <div class="form-group">
    <label for="exampleInputEmail1">新密码</label>
    <input type="password" class="form-control" id="password" placeholder="请输入新密码">
  </div>
  <div class="form-group" >
    <label for="exampleInputPassword1">重复新密码</label>
    <input type="password" class="form-control" id="password1" placeholder="请确认新密码">
  </div>

  <input type="button"  class="btn btn-default" style="float: right" onclick="sss.add()" value="确认修改">
</form>

	
</body>


</html>