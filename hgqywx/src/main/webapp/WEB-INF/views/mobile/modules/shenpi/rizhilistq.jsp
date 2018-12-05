<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>日志管理</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="${ctxStatic}/mui/css/mui.min.css">
</head>
<body>
	<style>
.head_menu {
	width: 100%;
	height: 44px;
	background-color: #318df0;
}

.head_menu p {
	font-size: 15px;
	color: white;
	text-align: center;
	line-height: 44px;
}

.head_menu img {
	width: 20px;
	height: 20px;
	position: absolute;
	top: 12px;
	left: 5px;
}

body {
	color: #887F7F;
}

.mui-slider-progress-bar {
	height: 1px;
}

.mui-control-content {
	background-color: white;
	/*min-height: 426px;*/
}

.mui-control-content .mui-loading {
	margin-top: 50px;
}

.mui-title {
	color: #fff;
}

.mui-bar {
	background-color: #318df0;
}

.mui-control-item {
	color: #888888;
}

.mui-active {
	color: #318df0;
}

.footer_menu {
	z-index: 9999;
	display: block;
	width: 100%;
	height: 60px;
	border-top: 1px solid #D7D7D7;
	position: absolute;
	bottom: 0;
	background-color: #fff;
}

.footer_menu_dv {
	width: 50%;
	float: left;
	text-align: center;
	padding-top: 11px;
	line-height: 14px;
}

.footer_menu_dv p {
	color: #887f7f;
	font-size: 12px;
	padding-top: 5px;
}

.sp_dv {
	width: 50px;
	height: 15px;
	border: 1px solid #74C3F9;
	text-align: center;
	line-height: 14px;
	/* position: absolute;
		    	top:22px;
		    	left: 120px; */
	margin-top: 12px;
	border-radius: 3px;
}

.sp_dv span {
	color: #387AC9;
	font-size: 12px;
}

.sp_dv1 {
	width: 50px;
	height: 15px;
	border: 1px solid #5aca5e;
	text-align: center;
	line-height: 13px;
	position: relative;
	top: 9px;
	right: -18px;
	border-radius: 3px;
}

.sp_dv1 span {
	color: #5aca5e;
	font-size: 12px;
}

.sp_dv2 {
	width: 50px;
	height: 15px;
	border: 1px solid #EC8B89;
	text-align: center;
	line-height: 13px;
	position: absolute;
	top: 22px;
	left: 120px;
	border-radius: 3px;
}

.sp_dv2 span {
	color: #F43530;
	font-size: 12px;
}

.media_box {
	display: flex;
	position: relative;
	padding: 10px;
	border-bottom: 1px solid #DCDCDC;
}

.media_box_dv {
	padding: 10px;
}

.media_box_dv_p {
	font-size: 18px;
	color: #000000;
}

.media_box_span {
	float: right;
	color: #808080;
	position: absolute;
	right: 9px;
	top: 10px;
	padding: 10px;
}
/* 角标css */
.pa1 {
	position: absolute;
	top: -0.7em;
	left: 1.3em;
	z-index: 999;
}

.weui-badge {
	display: inline-block;
	padding: .15em .4em;
	min-width: 8px;
	border-radius: 18px;
	background-color: #f43530;
	color: #fff;
	line-height: 1.2;
	text-align: center;
	font-size: 12px;
	vertical-align: middle;
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
<%-- 	<img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png" style="z-index: 99999; position: absolute; width: 14%; right: 0px; bottom: 85px"> --%>
<img id="rc_btn" src="${ctxStatic}/mui/image/rc_more.png" style="z-index: 99999; position: absolute; width: 40px; right: 17px; bottom: 67px">
 <div id="poper_m"></div>
<div id="poper_dv">
	<div style="margin-bottom: 8px">
		<span style="color: #777777;font-size: 18px">返回</span>
		<img id="xuanfu" src="${ctxStatic}/mui/image/fanhui.png" width="45px" />
	</div>
</div>
	<!--内容  -->
	<div id="slider" style="border-bottom: 1px solid #dcdcdc;">
		<div style="background-color: #fff;" id="sliderSegmentedControl"
			class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
			<a href="${ctx}/grsw/rizhi/list" style="border-bottom: 1px solid #007aff;" id="daiban" class="mui-control-item mui-active"> 已读 </a> 
			<a id="yiban" href="${ctx}/grsw/rizhi/list?remarks=0" class="mui-control-item"> 未读 </a>
		</div>
	</div>
	<div id="pullrefresh" class="mui-content mui-scroll-wrapper" style="margin-top: 40px;">
			<div id="scroll1"  class="mui-slider mui-scroll">
					 <c:forEach items="${list}" var="rizhi">
						<ul class="mui-table-view">
							<li class="mui-table-view-cell mui-media" style="border-bottom: 1px solid #e5e5e5;">
								<a href="${ctx}/grsw/rizhi/form?id=${rizhi.id}"> 
									<c:choose>
										  <c:when test="${rizhi.user.photo !=null && rizhi.user.photo !=''}">
										  	<img class="mui-media-object mui-pull-left" src="${rizhi.user.photo }">
										  </c:when>
										  <c:otherwise>
												<img class="mui-media-object mui-pull-left" src=" ${ctxStatic}/mui/img/header.jpg">
										  </c:otherwise>
									</c:choose>
									<div class="mui-media-body">
											${rizhi.userName }
											<p class='mui-ellipsis'>今日工作：${rizhi.workToday}</p>
									</div>
									 <span class="media_box_span" style="top:0 !important;font-size: 12px">
												<fmt:formatDate value="${rizhi.createDate}" type="both" pattern="yyyy-MM-dd HH:mm"/>
									</span>
								</a>
							</li>
						</ul>
					</c:forEach>
				</div>
			</div>
	<!--底部导航-->
	<div class="footer_menu">
		<div class="footer_menu_dv" style="position: relative;">
			<a href="${ctx}/grsw/rizhi/findDate" style="position: relative;"> <img
				src="${ctxStatic}/mui/image/xie1.png" width="16px" />
				<p>写日志</p>
			</a>
		</div>
		<div class="footer_menu_dv" style="position: relative;">
			<a href="${ctx}/grsw/rizhi/list" style="position: relative;"> <img
				src="${ctxStatic}/mui/image/shu.png" width="16px" />
				<p>看日志</p>
			</a>
		</div>
	</div>
	<script src="${ctxStatic}/mui/js/mui.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
	<script>
		/* 下拉刷新 */
		mui.init({
			pullRefresh : {
				container : '#pullrefresh',
				down : {
					callback : pulldownRefresh
				}
			}
		});
		
		$("#rc_btn").on("tap",function(){
			$("#poper_m").show();
			$("#poper_dv").show();
		});
		$("#poper_m").on("tap",function(){
			$("#poper_m").hide();
			$("#poper_dv").hide();
		});
		function pulldownRefresh() {
			setTimeout(function() {
				window.location.reload();
				mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
			}, 1000);
		}

		mui.ready(function() {
			mui('body')
					.on(
							'tap',
							'a',
							function() {
								if (this.href
										&& this.href.indexOf("#") == -1
										&& !this.classList
												.contains('mui-action-back')) {
									var this_href = this.href;
									setTimeout(function() {
										window.location.href = this_href;
									}, 100);
								}
							});
			ele_drag("#rc_btn");
		});

		/*  */
		mui.init({
			swipeBack : false
		});
		/* (function($) {
			$('.mui-scroll-wrapper').scroll({
				indicators : true
			//是否显示滚动条
			});
		})(mui); */
		var h = document.documentElement.clientHeight;
		var h1 = h - 99;
		$(".mui-content").css("height", h1);

		/* 控件拖动以及返回 */
		$('#xuanfu').on('tap', function() {
			mui.openWindow({
				url : "${ctx}/main/index"
			})
		})
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