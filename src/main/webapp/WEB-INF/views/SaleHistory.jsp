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
		                type: 'spline',
		                animation: Highcharts.svg,
		                // don't animate in old IE               
		                marginRight: 10,
		                events: {
		                    load: function() {}
		                }
		            },
		            title: {
		                text: 'Live random data'
		            },
		            xAxis: {
		                type: 'datetime',
		                tickPixelInterval: 150
		            },
		            yAxis: [{
		                title: {
		                    text: 'Value'
		                },
		                plotLines: [{
		                    value: 0,
		                    width: 1,
		                    color: '#808080'
		                }]
		            },
		            {
		                title: {
		                    text: 'Name'
		                },
		                plotLines: [{
		                    value: 0,
		                    width: 1,
		                    color: '#808080'
		                }]
		            }],
		            tooltip: {
		                formatter: function() {
		                    return '<b>' + this.series.name + '</b><br/>' + Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' + Highcharts.numberFormat(this.y, 2);
		                }
		            },
		            legend: {
		                enabled: false
		            },
		            exporting: {
		                enabled: false
		            },
		            series: [{
		                name: 'Random data',
		                data: (function() { // generate an array of random data                             
		                    var data = [],
		                    time = (new Date()).getTime(),
		                    i;
		                    for (i = -19; i <= 0; i++) {
		                        data.push({
		                            x: time + i * 1000,
		                            y: Math.random()
		                        });
		                    }
		                    return data;
		                })()
		            },
		            {
		                name: 'Random data',
		                data: (function() { // generate an array of random data                             
		                    var data = [],
		                    time = (new Date()).getTime(),
		                    i;
		                    for (i = -19; i <= 0; i++) {
		                        data.push({
		                            x: time + i * 1000,
		                            y: Math.random()
		                        });
		                    }
		                    return data;
		                })()
		            }]
		        });
		$(function () {
		    // Create the chart
		    var _baseOperatePath = basePath+'/rest/sale';
		var _queryPath = _baseOperatePath+'/saleyearlist';
		var _queryPath2 = _baseOperatePath+'/saletimelist';
		    $('#container').highcharts({
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: 'Browser market shares. January, 2015 to May, 2015'
		        },
		        subtitle: {
		            text: 'Click the columns to view versions. Source: <a href="http://netmarketshare.com">netmarketshare.com</a>.'
		        },
		        xAxis: {
		            type: 'category'
		        },
		        yAxis: {
		            title: {
		                text: 'Total percent market share'
		            }

		        },
		        legend: {
		            enabled: false
		        },
		        plotOptions: {
		            series: {
		                borderWidth: 0,
		                dataLabels: {
		                    enabled: true,
		                    format: '{point.y:.1f}%'
		                }
		            }
		        },

		        tooltip: {
		            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
		            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
		        },

		        series: [{
		            name: 'Brands',
		            colorByPoint: true,
		            data: [{
		                name: 'Microsoft Internet Explorer',
		                y: 56.33,
		                drilldown: 'Microsoft Internet Explorer'
		            }, {
		                name: 'Chrome',
		                y: 24.03,
		                drilldown: 'Chrome'
		            }, {
		                name: 'Firefox',
		                y: 10.38,
		                drilldown: 'Firefox'
		            }, {
		                name: 'Safari',
		                y: 4.77,
		                drilldown: 'Safari'
		            }, {
		                name: 'Opera',
		                y: 0.91,
		                drilldown: 'Opera'
		            }, {
		                name: 'Proprietary or Undetectable',
		                y: 0.2,
		                drilldown: null
		            }]
		        }],
		        drilldown: {
		            series: [{
		                name: 'Microsoft Internet Explorer',
		                id: 'Microsoft Internet Explorer',
		                data: [
		                    [
		                        'v11.0',
		                        24.13
		                    ],
		                    [
		                        'v8.0',
		                        17.2
		                    ],
		                    [
		                        'v9.0',
		                        8.11
		                    ],
		                    [
		                        'v10.0',
		                        5.33
		                    ],
		                    [
		                        'v6.0',
		                        1.06
		                    ],
		                    [
		                        'v7.0',
		                        0.5
		                    ]
		                ]
		            }, {
		                name: 'Chrome',
		                id: 'Chrome',
		                data: [
		                    [
		                        'v40.0',
		                        5
		                    ],
		                    [
		                        'v41.0',
		                        4.32
		                    ],
		                    [
		                        'v42.0',
		                        3.68
		                    ],
		                    [
		                        'v39.0',
		                        2.96
		                    ],
		                    [
		                        'v36.0',
		                        2.53
		                    ],
		                    [
		                        'v43.0',
		                        1.45
		                    ],
		                    [
		                        'v31.0',
		                        1.24
		                    ],
		                    [
		                        'v35.0',
		                        0.85
		                    ],
		                    [
		                        'v38.0',
		                        0.6
		                    ],
		                    [
		                        'v32.0',
		                        0.55
		                    ],
		                    [
		                        'v37.0',
		                        0.38
		                    ],
		                    [
		                        'v33.0',
		                        0.19
		                    ],
		                    [
		                        'v34.0',
		                        0.14
		                    ],
		                    [
		                        'v30.0',
		                        0.14
		                    ]
		                ]
		            }, {
		                name: 'Firefox',
		                id: 'Firefox',
		                data: [
		                    [
		                        'v35',
		                        2.76
		                    ],
		                    [
		                        'v36',
		                        2.32
		                    ],
		                    [
		                        'v37',
		                        2.31
		                    ],
		                    [
		                        'v34',
		                        1.27
		                    ],
		                    [
		                        'v38',
		                        1.02
		                    ],
		                    [
		                        'v31',
		                        0.33
		                    ],
		                    [
		                        'v33',
		                        0.22
		                    ],
		                    [
		                        'v32',
		                        0.15
		                    ]
		                ]
		            }, {
		                name: 'Safari',
		                id: 'Safari',
		                data: [
		                    [
		                        'v8.0',
		                        2.56
		                    ],
		                    [
		                        'v7.1',
		                        0.77
		                    ],
		                    [
		                        'v5.1',
		                        0.42
		                    ],
		                    [
		                        'v5.0',
		                        0.3
		                    ],
		                    [
		                        'v6.1',
		                        0.29
		                    ],
		                    [
		                        'v7.0',
		                        0.26
		                    ],
		                    [
		                        'v6.2',
		                        0.17
		                    ]
		                ]
		            }, {
		                name: 'Opera',
		                id: 'Opera',
		                data: [
		                    [
		                        'v12.x',
		                        0.34
		                    ],
		                    [
		                        'v28',
		                        0.24
		                    ],
		                    [
		                        'v27',
		                        0.17
		                    ],
		                    [
		                        'v29',
		                        0.16
		                    ]
		                ]
		            }]
		        }
		    });
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
            text: '该季度销售情况'
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
                ['Firefox',   45.0],
                ['IE',       26.8],
                {
                    name: 'Chrome',
                    y: 12.8,
                    sliced: true,
                    selected: true
                },
                ['Safari',    8.5],
                ['Opera',     6.2],
                ['Others',   0.7]
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