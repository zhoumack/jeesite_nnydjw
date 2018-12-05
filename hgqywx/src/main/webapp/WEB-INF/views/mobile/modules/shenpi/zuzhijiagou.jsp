<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>组织架构</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="${ctxStatic}/mui/css/mui.min.css" />
</head>
<body>
	<style>
	body{
	background-color: #fff !important;
	}
	.jiagou_bg{
		height:525px;background-image: url(${ctxStatic}/mui/image/jiagou.jpg);background-size: 100% 100%;
	}
	#poper_m{
	width: 100%;height: 100%;background-color: #fff;z-index: 99999;position: absolute;top: 0;opacity: 0.8;display: none;
	}
	#poper_dv{
		z-index: 999999;position: absolute;bottom:57px;right: 17px;display: none;
	}
	img{
		vertical-align:middle
	}
</style>
<!-- 悬浮区 -->
<%-- <img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png" style="z-index: 99999;position: absolute;width: 14%;right: 0px;bottom: 85px"> --%>
<img id="rc_btn" src="${ctxStatic}/mui/image/rc_more.png" style="z-index: 99999; position: absolute; width: 40px; right: 17px; bottom: 67px">

<!--内容  -->
	<div class="jiagou_bg">
		</div>
	<div id="poper_m">
	</div>
	<div id="poper_dv">
		<div style="margin-bottom: 8px">
			<span style="color: #777777;font-size: 18px">返回</span>
			<img id="xuanfu" src="${ctxStatic}/mui/image/fanhui.png" width="45px" />
		</div>
	</div>
	<script src="${ctxStatic}/mui/js/mui.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
	<script>
	 /*控件拖动并返回  */
	mui.ready(function(){
		ele_drag("#rc_btn");
		
		
		$("#rc_btn").on("tap",function(){
			$("#poper_m").show();
			$("#poper_dv").show();
		});
		$("#poper_m").on("tap",function(){
			$("#poper_m").hide();
			$("#poper_dv").hide();
		});
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
	touchstart: function(e) {
		startX = e.originalEvent.targetTouches
	
	[0].pageX; //获取点击点的X坐标    
		startY = e.originalEvent.targetTouches
	
	[0].pageY; //获取点击点的Y坐标
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
	touchmove: function(e) {
		e.preventDefault();
		moveX = e.originalEvent.targetTouches
	
	[0].pageX; //移动过程中X轴的坐标
		moveY = e.originalEvent.targetTouches
	
	[0].pageY; //移动过程中Y轴的坐标
		//console.log("moveX="+moveX+"************moveY="+moveY);
		if(moveX < leftX) {
			moveX = leftX;
		}
		if(moveX > rightX) {
			moveX = rightX;
		}
		if(moveY < topY) {
			moveY = topY;
		}
		if(moveY > bottomY) {
			moveY = bottomY;
		}
		$(this).css({
			"left": moveX + sX - startX,
			"top": moveY + sY - startY,
		});
	}
	});
	}
	</script>

</body>

</html>