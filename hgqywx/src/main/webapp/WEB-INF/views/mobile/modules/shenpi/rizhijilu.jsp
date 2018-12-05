
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>工作日志</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="${ctxStatic}/mui/css/mui.min.css">
</head>
<body>
	<style>
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

.mui-bar {
	box-shadow: 0 0 0px rgba(0, 0, 0, .85);
	border-top: 1px solid #e4e5e5;
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
<%-- 	<img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png" style="z-index: 99999; position: absolute; width: 14%; right: 0px; bottom: 85px"> --%>
	<img id="rc_btn" src="${ctxStatic}/mui/image/rc_more.png" style="z-index: 99999; position: absolute; width: 40px; right: 17px; bottom: 67px">
 <div id="poper_m"></div>
	<div id="poper_dv">
		<div style="margin-bottom: 8px">
			<span style="color: #777777;font-size: 18px">返回</span>
			<img id="xuanfu" src="${ctxStatic}/mui/image/fanhui.png" width="45px" />
		</div>
	</div>
	
	<div class="mui-content">
		<ul class="mui-table-view">
			<li class="mui-table-view-cell mui-media"><a
				href="${ctx}/main/rizhisq"> <img
					class="mui-media-object mui-pull-left"
					src="${ctxStatic}/mui/image/ribao.png">
					<div class="mui-media-body">
						日报
						<c:choose>
							<c:when test="${rizhi.createDate  !=null and rizhi.createDate !='' }">
								<p class='mui-ellipsis'>上次提交时间：
									<fmt:formatDate value="${rizhi.createDate}" type="both" pattern="yyyy.MM.dd HH:mm"/>
								</p>
							</c:when>
							<c:otherwise>
								<p class='mui-ellipsis'>暂未提交过</p>
							</c:otherwise>
						</c:choose>
					</div>
			</a></li>
		</ul>
	</div>
	<%-- <nav class="mui-bar mui-bar-tab">
			<a class="mui-tab-item" href="#tabbar">
				<span class="mui-icon">
					<img src="${ctxStatic}/mui/image/xie.png"  width="16px"/>
				</span>
				<span class="mui-tab-label">写日志</span>
			</a>
			<a class="mui-tab-item" href="${ctx}/main/rizhilistq">
				<span class="mui-icon">
					<img src="${ctxStatic}/mui/image/shu1.png"  width="16px"/>
				</span>
				<span class="mui-tab-label">看日志</span>
			</a>
		</nav> --%>
	<!--底部导航-->
	<div class="footer_menu">
		<div class="footer_menu_dv" style="position: relative;">
			<a href="${ctx}/grsw/rizhi/findDate" style="position: relative;"> <img
				src="${ctxStatic}/mui/image/xie.png" width="16px" />
				<p>写日志</p>
			</a>
		</div>
		<div class="footer_menu_dv" style="position: relative;">
			<%-- <a href="${ctx}/main/rizhilistq" style="position: relative;"> --%>
			<a href="${ctx}/grsw/rizhi/list" style="position: relative;"> <img
				src="${ctxStatic}/mui/image/shu1.png" width="16px" />
				<p>看日志</p>
			</a>
		</div>
	</div>
	<script src="${ctxStatic}/mui/js/mui.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
	<script>
		/*  */
		mui.init({
			swipeBack : false
		});
		
		$("#rc_btn").on("tap",function(){
			$("#poper_m").show();
			$("#poper_dv").show();
		});
		$("#poper_m").on("tap",function(){
			$("#poper_m").hide();
			$("#poper_dv").hide();
		});
		
		(function($) {
			$('.mui-scroll-wrapper').scroll({
				indicators : true
			//是否显示滚动条
			});
		})(mui);
		var h = document.documentElement.clientHeight;
		var h1 = h - 98;
		$(".mui-control-content").css("min-height", h1);

		function claim(taskId) {
			$.get('${ctx}/act/task/claim', {
				taskId : taskId
			}, function(data) {
				if (data == 'true') {
					mui.toast('签收完成');
					window.setTimeout(function() {
					}, 2000);
					location = '${ctx}/shenpi/wode/';
				} else {
					mui.toast('签收失败');
				}
			});
		}
		function showData(type) {
			if (type == "chaosong") {
				window.location.href = "${ctx }/shenpi/getChaoSong";
			} else {
				window.location.href = "${ctx }/shenpi/wode?dbOrYb=" + type;
			}

		}

		/* 控件拖动以及返回 */
		mui.ready(function(){
			ele_drag("#rc_btn");
		});
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