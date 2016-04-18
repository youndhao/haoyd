<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息</title>

  <script>
    //左侧Javascript代码
    $(function () {
    	var _baseOperatePath = basePath+'/rest/sale';
		var _queryPath = _baseOperatePath+'/saleyearlist';
		var _queryPath2 = _baseOperatePath+'/saletimelist';
		
		var chart = new Highcharts.Chart({  
        chart: {
        	renderTo: 'container',
            type: 'column',
            margin: [ 50, 50, 100, 80]
        },
        title: {
            text: '销售额统计'
        },
        xAxis: {
            categories: [
                '第一季度',
                '第二季度',
                '第三季度',
                '第四季度',
               
            ],
            labels: {
                rotation: -45,
                align: 'right',
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: '单位 (万元)'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: '年销售情况 : <b>{point.y:.1f} 万元</b>',
        },
        series: [{
            name: 'Population',
            data: [0, 0, 0, 0],
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                align: 'right',
                x: 4,
                y: 10,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif',
                    textShadow: '0 0 3px black'
                }
            }
        }]
    }); 
    
    function getForm(){  
        //使用JQuery从后台获取JSON格式的数据  
         jQuery.getJSON(_queryPath,{'year':$("#year").val()}, function(data) {  
                        //为图表设置值  
         chart.series[0].setData([data.a,data.b,data.c,data.d]);  
    });  
}  
    function getForm2(){  
        //使用JQuery从后台获取JSON格式的数据  
         jQuery.getJSON(_queryPath2,{'year':$("#year").val(),'time':$("#time").val()}, function(data) {  
                        //为图表设置值  
        	  browsers = [],
              //迭代，把异步获取的数据放到数组中
              $.each(data,function(i,d){
                  browsers.push([d.name,d.money]);
              });
              //设置数据
              chart2.series[0].setData(browsers);  
          })
    
}  
    $('#year').change(function(){
    	getForm();
    	
    })
    $('#time').change(function(){
    	getForm2();
    	
    })

 var chart2 = new Highcharts.Chart({ 
        chart: {
            type: 'pie',
            renderTo: 'container1',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: '该季度销售额统计'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '所占百分比',
            data: [
                ['手机',   0],
                ['电脑',   0],
                {
                    name: '键盘',
                    y: 0,
                    sliced: true,
                    selected: true
                },
                ['鼠标',    0],
                ['耳机',    0],
                ['其他',    0]
            ]
        }]
    });  
});
  </script>
</head>
<body>
<br>
<br>
<ul class="breadcrumb">
			<li>
					首页 <span class="divider">/</span>
					</li>
			<li>
					销售预算 <span class="divider">/</span>
					</li>
			<li class="active">
					查看往年销售情况
					</li>
	</ul>
	<br>
	<div id ="E" style="float:right;">
	年份：<select id="year"  style="width:150px;" >
	<option  selected="selected">--请选择--</option>
	<option value='2016' >2016</option>
	<option value='2015'>2015</option>
	<option value='2014'>2014</option>
	<option value='2013'>2013</option>
	<option value='2012'>2012</option>
	<option value='2011'>2011</option>
	<option value='2010'>2010</option>
	<option value='2009'>2009</option>
	<option value='2008'>2008</option>
	<option value='2007'>2007</option>
	<option value='2006'>2006</option>
	</select>
	</div>
	<br>
	<br>
 <div id="container" style="min-width:700px;height:400px;"></div>
 <br>
 	<div id ="R" style="float:right;">
	季度：<select id="time"  style="width:150px;">
	<option  selected="selected">--请选择--</option>
	<option value='1'>第一季度</option>
	<option value='2'>第二季度</option>
	<option value='3'>第三季度</option>
	<option value='4'>第四季度</option>
	</select>
	</div>
	<br>
	<br>
  <div id="container1" style="min-width:700px;height:400px"></div>
 


</body>
</html>