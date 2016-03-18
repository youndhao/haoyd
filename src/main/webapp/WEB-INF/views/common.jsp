<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path;
pageContext.setAttribute("base_path", basePath);
Object user = request.getSession().getAttribute("user");
pageContext.setAttribute("user", user);
%>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<c:set var="css_path" value="${base_path}/css" />
<c:set var="js_path" value="${base_path}/js" />
<c:set var="base_href" value="${base_path}" />
<c:set var="user" value="${user}" />
<script type="text/javascript">
var basePath = "${base_href}";
</script>

 