<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>审批审核</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="${ctxStatic}/mui/css/mui.min.css" />
</head>
<body>
	<style>
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
	z-index:9999;
	display: block;
	width: 100%;
	height: 60px;
	border-top: 1px solid #D7D7D7;
	position: absolute;
	bottom: 0;
	background-color: #fff;
	z-index: 999;
}

.footer_menu_dv {
	width: 100%;
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
	line-height: 13px;
	position: relative;
    top: 9px;
    right: -18px;
	border-radius: 3px;
}

.sp_dv span {
	color: #387AC9;
	font-size: 12px;
}

.media_box {
	background-color: #fff;
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

.mui-search {
	position: relative;
	background-color: #fff;
}

.mui-icon-search {
	padding-top: 7px;
}
/* 角标css */
.pa1 {
        position: absolute;
	    top: -0.7em;
	    left: 1.3em;
	    z-index: 999;
}
.weui-badge{
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
	<div style="background-color: #fff;" id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
		<a href="${ctx }/shenpi/wode?dbOrYb=true" id="daiban"  class="mui-control-item">待处理 </a> 
		<a href="${ctx }/shenpi/wode?dbOrYb=false" id="yiban"  class="mui-control-item"> 已处理 </a> 
		<a href="${ctx }/shenpi/getChaoSong" style="border-bottom: 1px solid #007aff;"  class="mui-control-item mui-active">抄送我 </a>
		<a id="weichuli" href="${ctx }/shenpi/wodeOffice" class="mui-control-item" style="display:none;">
			部门未处理
		</a>
	</div>
	<div id="pullrefresh" class="mui-content mui-scroll-wrapper" style="position: absolute; top: 40px; margin-bottom: 60px">
		<div class="mui-scroll" id="mui-scroll">
			<c:forEach items="${list}" var="shenpi">
				<a href="${ctx}/shenpi/${shenpi.getClass().getSimpleName().toLowerCase()}/form?id=${shenpi.id}&act.taskDefKey=modify&act.procInsId=${shenpi.procInsId}" class="media_box">
					<div class="media_box_dv">
						<p class="media_box_dv_p">${shenpi.actType }申请</p>
						<p>
							申请人：<span class="sqr_text">${shenpi.user.name}</span>
						</p>
						<p>申请时间：<fmt:formatDate
							value="${shenpi.createDate}" type="both"
							pattern="yyyy-MM-dd HH:mm:ss" />
						</p>
						<!-- <p>开始时间：2018/10/8 上午</p> -->
					</div> <span class="media_box_span" style=""><fmt:formatDate
							value="${task.createTime}" type="both"
							pattern="yyyy-MM-dd HH:mm:ss" /></span>
					<div class="sp_dv">
						<span>${shenpi.status=="流程中"?"审批中":shenpi.status }</span>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
	<!--底部导航-->
	<div class="footer_menu">
			<div class="footer_menu_dv" style="position: relative;">
				<a href="${ctx}/shenpi/wode" style="position: relative;">
					<img src="${ctxStatic}/mui/img/shenpi1.png" width="20px" height="20px"/>
					<span class="weui-badge pa1" id="num"></span>
					<p>我审批的</p>
				</a>
			</div>
		</div>
	<script src="${ctxStatic}/mui/js/mui.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
	<script>
	var h = document.documentElement.clientHeight;
	var h1 = h - 99;
	$(".mui-content").css("height", h1);
			/* 下拉刷新 */
			mui.init({
				pullRefresh: {
					container: '#pullrefresh',
					down: {
						callback: pulldownRefresh
					}
				}
			});
			function pulldownRefresh() {
				setTimeout(function() {
					window.location.reload();
					mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
				}, 1000);
			} 
			
		 mui.ready(function(){
			mui('body').on('tap', 'a', function() {
				if(this.href && this.href.indexOf("#") == -1 && !this.classList.contains('mui-action-back')) {
					var this_href = this.href;
					setTimeout(function() {
						window.location.href = this_href;
					}, 100);
				}
			});
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
		var h1 = h - 142;
		$(".mui-control-content").css("min-height", h1);

		$(function() {
			var hc_html = $("#mui-scroll").html();
			$("#search").on(
					'input',
					function() {
						var ht = '';
						var vl = $(this).val();
						$('.sqr_text')
								.each(
										function() {
											var sqr_text = $.trim($(this)
													.text());
											if (sqr_text.indexOf(vl) != -1) {
												var par = $(this).parents(
														'.media_box');
												var par_a = '<a href="'
														+ par.attr('href')
														+ '" class="'
														+ par.attr('class')
														+ '">' + par.html()
														+ '</a>';
												ht += par_a;
											}
										});
						if (ht && vl) {
							$("#mui-scroll").html(ht);
						} else {
							$("#mui-scroll").html(hc_html);
						}
					});
		});

		function showData(type) {
			if (type == "chaosong") {
				window.location.href = "${ctx }/shenpi/getChaoSong";
			} else {
				window.location.href = "${ctx }/shenpi/wode?dbOrYb=" + type;
			}

		}
		var slider = mui("#slider");
			$(document).ready(function(){
				$.getJSON("${ctx}/shenpi/wodeOfficeRole",{newdate: new Date()},function(jsonData){
					console.log("权限:"+jsonData);
					role = jsonData;
					if(jsonData=="1"){
						//显示部门未处理
						$("#weichuli").show();
					}else{
						$("#weichuli").hide();
					}
				});
				$.ajax({
					url:"${ctx}/data/getShenpiSize",
					success:function(data){
						if(data==0){
							$("#num").css("visibility","hidden");
						}else{
							$("#num").css("visibility","visible");
							document.getElementById("num").innerText = data;
						}
						
					},
					error:function(e){
						
					}
				})
				});
			/* 返回*/
			$('#xuanfu').on('tap', function() {
				 mui.openWindow({
					url:"${ctx}/main/index"
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
					touchstart: function(e) {
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
					touchmove: function(e) {
						e.preventDefault();
						moveX = e.originalEvent.targetTouches[0].pageX; //移动过程中X轴的坐标
						moveY = e.originalEvent.targetTouches[0].pageY; //移动过程中Y轴的坐标
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