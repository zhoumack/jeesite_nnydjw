<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css" />
<link rel="stylesheet" href="${ctxStatic}/mui/css/mui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/imgeviewer.css" />
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.previewimage.js"></script>
<script src="${ctxStatic}/mui/js/mui.zoom.js"></script>
<title>日志详情</title>
<style>
.weui_footer1 {
	background-color: white;
	margin-top: 10px;
}

.weui_footer2 {
	background-color: white;
	text-align: center;
	margin-top: 0px;
	height: 30px;
}

.weui_footer_p1 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p2 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p3 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p4 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.timeline {
	padding: 10px 20px !important;
}

.timeline-item-head {
	top: 0px;
}

.weui_footer1 {
	background-color: white;
	margin-top: 10px;
}

.weui_footer2 {
	background-color: white;
	text-align: center;
	margin-top: 0px;
	height: 30px;
}

.weui_footer_p1 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p2 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p3 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p4 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.head_menu {
	width: 100%;
	height: 50px;
	background-color: #318df0;
}

.head_menu p {
	font-size: 15px;
	color: white;
	text-align: center;
	line-height: 50px;
}

.head_menu img {
	width: 20px;
	height: 20px;
	position: absolute;
	top: 14px;
	left: 5px;
}

.mui-bar {
	background-color: #318df0;
}

.mui-title {
	color: #fff;
}

body, html {
	background: #f5f5f5;
}

.sp_dv {
	width: 50px;
	height: 15px;
	border: 1px solid #74C3F9;
	text-align: center;
	line-height: 14px;
	border-radius: 3px;
	position: relative;
	top: 23px;
	left: 12px;
	/* margin-top: 20px;
			margin-left: 10px; */
		}
		
		.sp_dv span {
			color: #387AC9;
			font-size: 12px;
		}
		
		.center_dv {
			background-color: #FFFFFF;
			border-bottom: 1px solid #DCDCDC;
		}
		
		.center_dv_dv {
			padding-left: 15px;
			padding-top: 15px;
		}
		
		.center_dv_dv span {
			padding-left: 50px;
			font-weight:bold;
			font-size: 18px;
			position: relative;
			top: 6px;
		}
		
		.center_dv_dv img {
			position: absolute;
			left: 20px;
		}
		
		.center_dv_dv2 {
			padding: 15px;
			color: #887F7F;
		}
		
		.center_span {
			padding: 5px;
		}
		
		.center_span_s2 {
			padding-left: 20px;
			color: #000000;
		}
		
		.liu_dv {
			background-color: #ffffff;
			border-bottom: 1px solid #DCDCDC;
			border-top: 1px solid #DCDCDC;
			margin-top: 10px;
		}
		
		.liu_dv_p1 {
			padding: 15px;
			color: #887f7f;
		}
		
		.liu_dv_dv {
			padding-left: 16px;
		}
		
		.liu_dv_dv img {
			position: relative;
			top: 3px;
			margin-right: 10px;
		}
		
		.xian {
			margin-top:20px;
			margin-left: 19px;
			width: 90%;
			height: 1px;
			background-color: #DCDCDC;
		}
		
		.liu_dv_p2 {
			padding: 15px;
			color: #887f7f;
			font-size: 13px;
		}
		
		.footer_op {
			width: 100%;
			background-color: #Ffffff;
			border-top: 1px solid #DCDCDC;
			position: fixed;
			bottom: 0;
			z-index: 999;
		}
		
		.caozuo {
			width: 50%;
			height: 40px;
			text-align: center;
			line-height: 40px;
			float: left;
		}
		
		#relist {
			background-color: #ECECEC;
			width: 60%;
			float: right;
			display: none;
		}
		
		.mui-input-row input {
			border: none;
			margin-bottom: inherit;
		}
		
		button {
			border: 0;
		}
		.center_span_p{
			width: 100%;font-size: 16px;color: #000;word-wrap: break-word";
		}
		.center_dv_span{
		    padding-left: 101px;
		    font-size: 13px;
		    color: #9a9a9a;
		    float: right;
		    }


.sp_dv span {
	color: #387AC9;
	font-size: 12px;
}

.center_dv {
	background-color: #FFFFFF;
	border-bottom: 1px solid #DCDCDC;
}

.center_dv_dv {
	padding-left: 15px;
	padding-top: 15px;
}

.center_dv_dv span {
	padding-left: 50px;
	font-weight: bold;
	font-size: 18px;
	position: relative;
	top: 6px;
}

.center_dv_dv img {
	position: absolute;
	left: 20px;
}

.center_dv_dv2 {
	padding: 15px;
	color: #887F7F;
}

.center_span {
	padding: 5px;
}

.center_span_s2 {
	padding-left: 20px;
	color: #000000;
}

.liu_dv {
	background-color: #ffffff;
	border-bottom: 1px solid #DCDCDC;
	border-top: 1px solid #DCDCDC;
	margin-top: 10px;
}

.liu_dv_p1 {
	padding: 15px;
	color: #887f7f;
}

.liu_dv_dv {
	padding-left: 16px;
}

.liu_dv_dv img {
	position: relative;
	top: 3px;
	margin-right: 10px;
}

.xian {
	margin-left: 15px;
	width: 95%;
	height: 1px;
	background-color: #DCDCDC;
}

.liu_dv_p2 {
	padding: 15px;
	color: #887f7f;
	font-size: 13px;
}

.footer_op {
	width: 100%;
	background-color: #Ffffff;
	border-top: 1px solid #DCDCDC;
	position: fixed;
	bottom: 0;
	z-index: 999;
}

.caozuo {
	width: 50%;
	height: 40px;
	text-align: center;
	line-height: 40px;
	float: left;
}

#relist {
	background-color: #ECECEC;
	width: 60%;
	float: right;
	display: none;
}

.mui-input-row input {
	border: none;
	margin-bottom: inherit;
}

button {
	border: 0;
}

.center_span {
	width: 100%;
	font-size: 16px;
	color: #000;
	word-wrap: break-word";
	margin-bottom: 0px;
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
</head>
<body>
	
	
<!-- 悬浮区 -->
<%-- <img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png" style="z-index: 99999;position: absolute;width: 14%;right: 0px;bottom: 85px"> --%>
<img id="rc_btn" src="${ctxStatic}/mui/image/rc_more.png" style="z-index: 99999; position: absolute; width: 40px; right: 17px; bottom: 67px">
 <div id="poper_m"></div>
	<div id="poper_dv">
		<div style="margin-bottom: 8px">
			<span style="color: #777777;font-size: 18px">返回</span>
			<img id="xuanfu" src="${ctxStatic}/mui/image/fanhui.png" width="45px" />
		</div>
	</div>
<!--内容  -->
	<div class="center_dv">
	<!--内容  -->
		<div class="center_dv">
			<div class="center_dv_dv" style="float: left">
				<img src="${ctxStatic}/mui/img/header.jpg" width="30px" height="30px" style="border-radius: 5px" /> <span>${rizhi.userName }</span>
				<span style="font-size: 13px;color: #9a9a9a;float: right;position: absolute;right:9px;top: 18px ">
				<fmt:formatDate value="${rizhi.createDate}" type="both"
					pattern="yyyy-MM-dd HH:mm" />
				</span>
			</div>
			<div style="clear: both;"></div>
			<div class="xian"></div>
			<div class="center_dv_dv2">
				<div class="center_span">
					<span>今日完成工作</span>
					<p class="center_span_p">${rizhi.workToday }</p>
					<br style="clear: both;">
				</div>
				<!-- <div class="center_span">
					<span>未完成工作</span>
					<p class="center_span_p">456</p>
					<br style="clear: both;">
				</div> -->
				<div class="center_span">
					<span>明日计划</span>
					<p class="center_span_p">${rizhi.workTomorrow }</p>
					<br style="clear: both;">
				</div>
				<div class="center_span">
					<span>其他事项</span>
					<p class="center_span_p">${rizhi.other }</p>
					<br style="clear: both;">
				</div>
				<!-- <div class="center_span">
					<span>备注</span>
					<p class="center_span_p">1123</p>
					<br style="clear: both;">
				</div> -->
				<div class="center_span">
					<span>说明附件</span> <span class="center_span_s2">${rizhi.filepath==""?"无":" " }</span>
					<div style="margin-top: 10px">
						<c:forEach items="${rizhi.filepath.split(',') }" var="img"
							varStatus="status">
							<c:if test="${!empty img}">
								<img src="${img }" style="width: 50px; height: 50px"
									data-preview-src="" data-preview-group="1">
							</c:if>
						</c:forEach>
						<%-- ${ctxStatic}/mui/img/header.jpg --%>

					</div>
				</div>
			</div>
			
		</div>
	<script>
		mui.ready(function() {
			ele_drag("#xuanfu");
			
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
	</script>

</body>
</html>