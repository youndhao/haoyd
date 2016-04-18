<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/common.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="JS代码,相册代码,JS广告代码,JS特效代码" />
<meta name="description" content="此代码内容为基于jQuery非常强大的TN3相册代码，属于站长常用代码，更多相册代码代码请访问懒人图库JS代码频道。" />
<title>基于jQuery非常强大的TN3相册代码_懒人图库</title>
<!-- include CSS always before including js -->
<link type="text/css" rel="stylesheet" href="${js_path}/about3/css/tn3.css"></link>
<!-- include jQuery library -->
<script type="text/javascript" src="${js_path}/about3/js/jquery.min.js"></script>
<!-- include tn3 plugin -->
<script type="text/javascript" src="${js_path}/about3/js/jquery.tn3lite.min.js"></script>
<!--  initialize the TN3 when the DOM is ready -->
<script type="text/javascript">
$(document).ready(function() {
	var tn1 = $('.mygallery').tn3({
		skinDir:"skins",
		imageClick:"fullscreen",
		image:{
		maxZoom:1.5,
		crop:true,
		clickEvent:"dblclick",
		transitions:[{
		type:"blinds"
		},{
		type:"grid"
		},{
		type:"grid",
		duration:460,
		easing:"easeInQuad",
		gridX:1,
		gridY:8,
		// flat, diagonal, circle, random
		sort:"random",
		sortReverse:false,
		diagonalStart:"bl",
		// fade, scale
		method:"scale",
		partDuration:360,
		partEasing:"easeOutSine",
		partDirection:"left"
		}]
		}
	});
});
</script>
<style type="text/css"> 
body{ font-size:12px; line-height:24px;color: red} 
.exp1{font-size:12px;} 
.exp2{font-size:xx-small;} 
.exp3{font-size:small;} 
.exp4{font-size:x-large;} 
.exp5{font-size:larger;} 
.exp6{font-size:smaller;} 
.exp7{font-size:50%;} 
.exp8{font-size:150%;} 
#content2{margin-top:50px;margin-bottom:30px}

</style> 
</head>
<body>


<!-- 代码 开始 -->

<div id="111">产品展示</div> 
<div align="center" class="exp8" id="content2">恪守信誉、以人为本，科技创新、质量第一</div> 
<div id="content1">
    <div class="mygallery clearfix">
	<div class="tn3 album">
	    <h4>Fixed Dimensions</h4>
	    <div class="tn3 description">Images with fixed dimensions</div>
	    <div class="tn3 thumb">images/35x35/1.jpg</div>
	    <ol>
		<li>
		    <h4>Hohensalzburg Castle</h4>
		    <div class="tn3 description">Salzburg, Austria</div>
		    <a href="${js_path}/about3/images/620x378/1.jpg">
			<img src="${js_path}/about3/images/35x35/1.jpg" />
		    </a>
		</li>
		<li>
		    <h4>Isolated sandy cove</h4>
		    <div class="tn3 description">Zakynthos island, Greece</div>
		    <a href="${js_path}/about3/images/620x378/2.jpg">
			<img src="${js_path}/about3/images/35x35/2.jpg" />
		    </a>
		</li>
		<li>
		    <h4>A view from the Old Town</h4>
		    <div class="tn3 description">Herceg Novi, Montenegro</div>
		    <a href="${js_path}/about3/images/620x378/3.jpg">
			<img src="${js_path}/about3/images/35x35/3.jpg" />
		    </a>
		</li>
		<li>
		    <h4>Walls of the Old Town</h4>
		    <div class="tn3 description">Kotor, Montenegro</div>
		    <a href="${js_path}/about3/images/620x378/4.jpg">
			<img src="${js_path}/about3/images/35x35/4.jpg" />
		    </a>
		</li>
		<li>
		    <h4>Boat in the port</h4>
		    <div class="tn3 description">Sousse, Tunis</div>
		    <a href="${js_path}/about3/images/620x378/5.jpg">
			<img src="${js_path}/about3/images/35x35/5.jpg" />
		    </a>
		</li>
		<li>
		    <h4>Wall of the Jain temple</h4>
		    <div class="tn3 description">Jaisalmer, India</div>
		    <a href="${js_path}/about3/images/620x378/6.jpg">
			<img src="${js_path}/about3/images/35x35/6.jpg" />
		    </a>
		</li>
		<li>
		    <h4>City park</h4>
		    <div class="tn3 description">Negotin, Serbia</div>
		    <a href="${js_path}/about3/images/620x378/7.jpg">
			<img src="${js_path}/about3/images/35x35/7.jpg" />
		    </a>
		</li>
		<li>
		    <h4>Taj Mahal mausoleum</h4>
		    <div class="tn3 description">Agra, India</div>
		    <a href="${js_path}/about3/images/620x378/8.jpg">
			<img src="${js_path}/about3/images/35x35/8.jpg" />
		    </a>
		</li>
		<li>
		    <h4>Zante Port</h4>
		    <div class="tn3 description">Zakynthos, Greece</div>
		    <a href="${js_path}/about3/images/620x378/9.jpg">
			<img src="${js_path}/about3/images/35x35/9.jpg" />
		    </a>
		</li>
		<li>
		    <h4>Rustovo Monastery</h4>
		    <div class="tn3 description">Budva, Montenegro</div>
		    <a href="${js_path}/about3/images/620x378/10.jpg">
			<img src="${js_path}/about3/images/35x35/10.jpg" />
		    </a>
		</li>
		<li>
		    <h4>The Mezquita, Cathedral and former Great Mosque</h4>
		    <div class="tn3 description">Cordoba, Spain</div>
		    <a href="${js_path}/about3/images/620x378/11.jpg">
			<img src="${js_path}/about3/images/35x35/11.jpg" />
		    </a>
		</li>
		<li>
		    <h4>Wine Cellars</h4>
		    <div class="tn3 description">Rajac, Serbia</div>
		    <a href="${js_path}/about3/images/620x378/12.jpg">
			<img src="${js_path}/about3/images/35x35/12.jpg" />
		    </a>
		</li>
	    </ol>
	</div>
    </div>
</div>

</body>
</html>