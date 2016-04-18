<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<%@include file="/WEB-INF/views/common.jsp" %>
<html lang="zh">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>响应式css3动画相册</title>
<link href="${js_path}/about/css/lrtk.css" rel="stylesheet">
<script type="text/javascript" src="${js_path}/about/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${js_path}/about/js/plugins.js"></script>
<script type="text/javascript" src="${js_path}/about/js/scripts.js"></script>

</head>
<body>
<!-- 代码 开始 -->
  <div id="gallery-container">
    
    <ul class="items--small">
      <li class="item"><a href="#"><img src="${js_path}/about/images/small-1.png" alt="" /></a></li>
      <li class="item"><a href="#"><img src="${js_path}/about/images/small-2.png" alt="" /></a></li>
      <li class="item"><a href="#"><img src="${js_path}/about/images/small-3.png" alt="" /></a></li>
      <li class="item"><a href="#"><img src="${js_path}/about/images/small-4.png" alt="" /></a></li>
      <li class="item"><a href="#"><img src="${js_path}/about/images/small-5.png" alt="" /></a></li>
      <li class="item"><a href="#"><img src="${js_path}/about/images/small-6.png" alt="" /></a></li>
      <li class="item"><a href="#"><img src="${js_path}/about/images/small-7.png" alt="" /></a></li>
      <li class="item"><a href="#"><img src="${js_path}/about/images/small-8.png" alt="" /></a></li>
      <li class="item"><a href="#"><img src="${js_path}/about/images/small-9.png" alt="" /></a></li>
      <li class="item"><a href="#"><img src="${js_path}/about/images/small-10.png" alt="" /></a></li>
      <li class="item"><a href="#"><img src="${js_path}/about/images/small-11.png" alt="" /></a></li>
      <li class="item"><a href="#"><img src="${js_path}/about/images/small-12.png" alt="" /></a></li>
    </ul>
    <ul class="items--big">
      <li class="item--big">
        <a href="#">
          <figure>
            <img src="${js_path}/about/images/big-1.jpg" alt="" />
            <figcaption class="img-caption">
              Caption
            </figcaption>
          </figure>
          </a>
      </li>
      <li class="item--big">
        <a href="#">
          <figure>
            <img src="${js_path}/about/images/big-2.jpg" alt="" />
            <figcaption class="img-caption">
              Caption
            </figcaption>
          </figure>
          </a>
      </li>
      <li class="item--big">
        <a href="#">
          <figure>
            <img src="${js_path}/about/images/big-3.jpg" alt="" />
            <figcaption class="img-caption">
              Caption
            </figcaption>
          </figure>
          </a>
      </li>
      <li class="item--big">
        <a href="#">
          <figure>
            <img src="${js_path}/about/images/big-4.jpg" alt="" />
            <figcaption class="img-caption">
              Caption
            </figcaption>
          </figure>
          </a>
      </li>
      <li class="item--big">
        <a href="#">
          <figure>
            <img src="${js_path}/about/images/big-5.jpg" alt="" />
            <figcaption class="img-caption">
              Caption
            </figcaption>
          </figure>
          </a>
      </li>
      <li class="item--big">
        <a href="#">
          <figure>
            <img src="${js_path}/about/images/big-6.jpg" alt="" />
            <figcaption class="img-caption">
              Caption
            </figcaption>
          </figure>
          </a>
      </li>
      <li class="item--big">
        <a href="#">
          <figure>
            <img src="${js_path}/about/images/big-7.jpg" alt="" />
            <figcaption class="img-caption">
              Caption
            </figcaption>
          </figure>
          </a>
      </li>
      <li class="item--big">
        <a href="#">
          <figure>
            <img src="${js_path}/about/images/big-8.jpg" alt="" />
            <figcaption class="img-caption">
              Caption
            </figcaption>
          </figure>
          </a>
      </li>
      <li class="item--big">
        <a href="#">
          <figure>
            <img src="${js_path}/about/images/big-9.jpg" alt="" />
            <figcaption class="img-caption">
              Caption
            </figcaption>
          </figure>
          </a>
      </li>
      <li class="item--big">
        <a href="#">
          <figure>
            <img src="${js_path}/about/images/big-10.jpg" alt="" />
            <figcaption class="img-caption">
              Caption
            </figcaption>
          </figure>
          </a>
      </li>
      <li class="item--big">
        <a href="#">
          <figure>
            <img src="${js_path}/about/images/big-11.jpg" alt="" />
            <figcaption class="img-caption">
              Caption
            </figcaption>
          </figure>
          </a>
      </li>
      <li class="item--big">
        <a href="#">
          <figure>
            <img src="${js_path}/about/images/big-12.jpg" alt="" />
            <figcaption class="img-caption">
              Caption
            </figcaption>
          </figure>
          </a>
      </li>
    </ul>
    <div class="controls">
      <span class="control icon-arrow-left" data-direction="previous"></span> 
      <span class="control icon-arrow-right" data-direction="next"></span> 
      <span class="grid icon-grid"></span>
      <span class="fs-toggle icon-fullscreen"></span>
    </div>
    
  </div>
  

<script>
    $(document).ready(function(){
     $('#gallery-container').sGallery({
        fullScreenEnabled: true
      });
    });
</script>
</body>
</html>