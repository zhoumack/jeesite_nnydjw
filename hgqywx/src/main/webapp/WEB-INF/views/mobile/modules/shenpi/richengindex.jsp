<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>日程安排</title>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mui/css/mui.min.css" />
<link rel="stylesheet" href="${ctxStatic}/layui/layui/css/layui.css">
<link rel="stylesheet" href="${ctxStatic}/layui/css/date.css">
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript"
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.zoom.js"></script>
</head>
<style type="text/css">
body, html {
	width: 100%;
	height: 100%;
/* 	line-height: normal; */
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
	overflow-x: hidden;
}

input, textarea {
	background-color: transparent;
	font-size: 15px;
	color: #666;
	outline: none;
}

.header {
	text-align: center;
	font-size: 20px;
	background-color: #007CCF;
	color: white;
	height: 40px;
	padding-top: 10px;
}

*{
	margin: 0;
	padding: 0;
}
.rc_list{
	width: 100%;height: 74px;background-color: #fff;margin: 0 auto;top:-131px;
}
.rc_list p{
	color: #000000;padding: 10px 16px;
}
.rc_list_dv{
	padding-left: 10px;padding-top: 6px;
}
.rc_list_box{
	width: 8px;height: 8px;background-color: #377ABB;float: left;margin:7px 9px ;border-radius: 10px;
}
.rc_list_span{
	font-size: 13px;color: #777777;
}
.rc_xian{
	height: 1px;background-color: #e5e5e5;width: 96%;margin-left: 16px;
	
}
.layui-container{
	padding:0 !important;
}
.layui-laydate-header{
border: 0px !important;
background-color: #5077aa;
}
.laydate-set-ym{
	color: #fff;
}
.layui-laydate-header i{
color: #fff !important;
}
.layui-laydate-footer{
height: 0px !important;
}
.layui-laydate, .layui-laydate-hint{
	border: 0px !important;
    box-shadow:inherit !important;
    background-color: inherit !important;
}
tag_after{
    background-color: #5077aa;
	position: absolute;
    content: '';
    right: 2px;
    top: 2px;
    width: 5px;
    height: 5px;
    border-radius: 50%;
}
.layui-laydate .layui-this{
	background-color: #5077aa !important; 
}
.layui-laydate-footer{
	border: 0px !important;
}
.laydate-theme-grid .laydate-month-list>li, .laydate-theme-grid .laydate-year-list>li, .laydate-theme-grid .layui-laydate-content td, .laydate-theme-grid .layui-laydate-content thead, .laydate-theme-molv .layui-laydate-footer{
	border: 0px !important;
}
#poper_m{
	width: 100%;height: 100%;background-color: #fff;z-index: 99999;position: absolute;top: 0;opacity: 0.8;display: none;
}
#poper_dv{
	z-index: 999999;position: absolute;bottom:57px;right: 17px;display: none;
}
</style>
<body>
	<!-- 悬浮区 -->
	<%-- <img id="xuanfu" src="${ctxStatic}/mui/image/xuanfu1.png" style="z-index: 99999; position: absolute; width: 20%; right: 0px; bottom: 72px"> --%>
	<%-- <a href="${ctx}/main/richengadd"> --%>
	<img id="rc_btn" src="${ctxStatic}/mui/image/rc_more.png" style="z-index: 99999; position: absolute; width: 40px; right: 17px; bottom: 67px">
	<!-- </a> -->
	<div class="div_body">
		<div class="layui-container" style="padding: 15px;">
			<div class="layui-row">
				<div class="layui-col-md12">
					<!-- <blockquote class="layui-elem-quote">基于layui的日历记事本</blockquote> -->
					<div class="layui-inline" id="test-n2"></div>
				</div>
			</div>
		</div>
	</div>
	
	 <div id="poper_m">
	</div>
	<div id="poper_dv">
		<a href="${ctx}/main/richengadd">
			<div style="margin-bottom: 8px">
				<span style="color: #777777;font-size: 18px">日程</span>
				<img src="${ctxStatic}/mui/image/ric.png" width="45px" />
			</div>
		</a>
		<div style="margin-bottom: 8px">
			<span style="color: #777777;font-size: 18px">返回</span>
			<img id="xuanfu" src="${ctxStatic}/mui/image/fanhui.png" width="45px" />
		</div>
	</div>
	
	<div id="data">
		<c:forEach items="${list}" var="richeng">
			<a href="${ctx}/grsw/richeng/form?id=${richeng.id}" style="display: block;">
				<div class="rc_list">
					<p>${richeng.theme}</p>
					<div class="rc_xian"></div>
					<div class="rc_list_dv">
						<span class="rc_list_box"></span> 
						<fmt:formatDate value="${richeng.startTime}" type="both" pattern="HH:mm"/> - <fmt:formatDate value="${richeng.endTime}" type="both" pattern="HH:mm"/> | ${richeng.addr}
						</span>
					</div>
				</div>
			</a>
		</c:forEach>
	</div>
	
</body>
<script src="${ctxStatic}/layui/layui/layui.js"></script>
<script type="text/javascript">
	$("#rc_btn").on("tap",function(){
		$("#poper_m").show();
		$("#poper_dv").show();
	});
	$("#poper_m").on("tap",function(){
		$("#poper_m").hide();
		$("#poper_dv").hide();
	});

	/* 返回 */
	mui.ready(function() {
		ele_drag("#rc_btn");
	});

	$('#xuanfu').on('tap', function() {
		history.go(-1);
	});
	/* 控件拖动 */
	function ele_drag(ele) {
		var cont = $(ele);
		var contW = $(ele).width();
		var contH = $(ele).height();
		var startX, startY, sX, sY, moveX, moveY;
		var winW = $(window).width();
		var winH = $(window).height();
		cont.on({ //绑定事件
			touchstart : function(e) {
				startX = e.originalEvent.targetTouches[0].pageX; //获取点击点的X坐标    
				startY = e.originalEvent.targetTouches[0].pageY; //获取点击点的Y坐标
				//console.log("startX="+startX+"************startY="+startY);
				sX = $(this).offset().left; //相对于当前窗口X轴的偏移量
				sY = $(this).offset().top; //相对于当前窗口Y轴的偏移量
				/* if(vue.scrollY) {
					sY = sY - vue.scrollY
				} */
				//console.log("sX="+sX+"***************sY="+sY);
				leftX = startX - sX; //鼠标所能移动的最左端是当前鼠标距div左边距的位置
				rightX = winW - contW + leftX; //鼠标所能移动的最右端是当前窗口距离减去鼠标距div最右端位置
				topY = startY - sY; //鼠标所能移动最上端是当前鼠标距div上边距的位置
				bottomY = winH - contH + topY; //鼠标所能移动最下端是当前窗口距离减去鼠标距div最下端位置       
			},
			touchmove : function(e) {
				e.preventDefault();
				moveX = e.originalEvent.targetTouches[0].pageX; //移动过程中X轴的坐标
				moveY = e.originalEvent.targetTouches[0].pageY; //移动过程中Y轴的坐标
				//console.log("moveX="+moveX+"************moveY="+moveY);
				if (moveX < leftX) {
					moveX = leftX;
				}
				if (moveX > rightX) {
					moveX = rightX;
				}
				if (moveY < topY) {
					moveY = topY;
				}
				if (moveY > bottomY) {
					moveY = bottomY;
				}
				$(this).css({
					"left" : moveX + sX - startX,
					"top" : moveY + sY - startY,
				});
			}
		});
	}

	layui
			.use(
					[ 'layer', 'form', 'jquery', 'laydate' ],
					function() {
						var layer = layui.layer, $ = layui.jquery, laydate = layui.laydate, form = layui.form;

						//定义json	
						var data = {};

						var new_date = new Date();
						loding_date(new_date, data);

						//日历插件调用方法  
						function loding_date(date_value, data) {

							laydate.render({
								elem : '#test-n2',
								type : 'date',
								theme : 'grid',
								max : '2099-06-16 23:59:59',
								position : 'static',
								range : false,
								value : date_value,
								calendar : true,
								btns : false,
								done : function(value, date, endDate) {
									console.log(value); //得到日期生成的值，如：2017-08-18
									console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
									console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
									//layer.msg(value)

									//调用弹出层方法
									date_chose(value, data);

								},
								mark : data,
								change: function(value, date, endDate,obj_date){
								     /* alert(value); */
								      $.getJSON("${ctx}/grsw/richeng/listDates?startTime="+value,{},function(jsonData){
											console.log(JSON.stringify(jsonData));
											var data_html = '';
											for(var i=0;i<jsonData.length;i++){
												/* var str ='';
												if(jsonData[i].startTime){
													str = jsonData[i].startTime.substring(5,10);
													console.log(str);
												} */
												data_html += '<a href="${ctx}/grsw/richeng/form?id='+jsonData[i].id+'">';
												data_html += '<div class="rc_list">';
												data_html += '<p>'+jsonData[i].theme+'</p>';
												data_html += '<div class="rc_xian"></div>';
												data_html += '<div class="rc_list_dv">';
												data_html += '<span class="rc_list_box"></span>';
												var str1 = '',str2 = '';
												if(jsonData[i].startTime){
													str = jsonData[i].startTime.substring(5,10);
													console.log(str);
												}
												if(jsonData[i].startTime){
													str1 = jsonData[i].startTime.substring(11,16); 
												}
												if(jsonData[i].endTime){
													str2 = jsonData[i].endTime.substring(11,16); 
												}
												data_html += str1 + ' - '+str2;
												data_html += ' | '+jsonData[i].addr
												data_html += '</span> </div> </div> </a>';
												
											}
											$("#data").html(data_html);
										});
							    }
							//重要json！

							});
						}

						//获取隐藏的弹出层内容
						var date_choebox = $('.date_box').html();

						//定义弹出层方法
						function date_chose(obj_date, data) {
							//alert(obj_date);
							
						}

					});
	$(document).on("tap",".laydate-prev-y",function(){
		
	});
	$(document).on("tap",".laydate-prev-m",function(){
		 
	});
	$(document).on("tap",".laydate-next-m",function(){
		 
	});
	$(document).on("tap",".laydate-next-y",function(){
		 
	});
</script>
</html>