<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>提交记录</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
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
	width: 33%;
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
    top: 17px;
    left: 83px;
	border-radius: 3px;
}

.sp_dv span {
	color: #387AC9;
	font-size: 12px;
}

.media_box {
	background-color: #fff;
	display: flex;
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
	top: 0.6em;
	right: 2.6em
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
	<div id="vue_content">
<%-- 		<img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png" style="z-index: 99999; position: absolute; width: 14%; right: 0px; bottom: 85px"> --%>
		<img id="rc_btn" src="${ctxStatic}/mui/image/rc_more.png" style="z-index: 99999; position: absolute; width: 40px; right: 17px; bottom: 67px">
	 <div id="poper_m"></div>
		<div id="poper_dv">
			<div style="margin-bottom: 8px">
				<span style="color: #777777;font-size: 18px">返回</span>
				<img id="xuanfu" src="${ctxStatic}/mui/image/fanhui.png" width="45px" />
			</div>
		</div>
		<!--内容  -->
		<div class="mui-content-padded" style="margin: 5px;">
			<div class="mui-input-row mui-search">
				<input id="search" type="search" class="mui-input-clear"
					placeholder="">
			</div>
		</div>
		<div id="pullrefresh" class="mui-content mui-scroll-wrapper"
			style="margin-top: 40px;">
			<div id="scroll1" class="mui-slider mui-scroll">
				<div class="mui-slider-group">
					<div class="mui-slider-item mui-control-content">
						<c:forEach items="${list}" var="shenpi">
						<c:if test='${shenpi.status=="流程中" }'>
							<span class="alertBtn" style="font-size: 28px; position: absolute; right: 10px; padding-top: 10px; z-index: 9999" @tap="setData('${shenpi.status}','${shenpi.actType }','${shenpi.procInsId}')">...</span>
						</c:if>	
							<div class="weui-tab__bd-item weui-tab__bd-item--active">
								<div class="weui-panel weui-panel_access">
									<a href="${ctx}/shenpi/${shenpi.getClass().getSimpleName().toLowerCase()}/form?id=${shenpi.id}&act.taskDefKey=modify&act.procInsId=${shenpi.procInsId}" class="media_box">
										<div class="media_box_dv">
											<div class="sp_dv">
												<span>${shenpi.status=="流程中"?"审批中":shenpi.status }</span>
											</div>
											<p class="media_box_dv_p">${shenpi.actType }</p>
											<p>
												
											<c:choose>
												<c:when test="${shenpi.actType == '工作安排'}">
													发布人：<span class="sqr_text">${shenpi.user.name}</span>
												</c:when>
												<c:otherwise>
													申请人：<span class="sqr_text">${shenpi.user.name}</span>
												</c:otherwise>
											</c:choose>
											</p>
											<p>
												申请时间：
												<fmt:formatDate value="${shenpi.createDate}" type="both"
													pattern="yyyy-MM-dd HH:mm:ss" />
											</p>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!--  隐藏选择-->
		<div class="mui-popup mui-popup-in" style="display: none; z-index: 99999999">
			<div class="mui-popup-inner" style="padding: 0px;">
				<ul class="mui-table-view">
					<li class="mui-table-view-cell" id="cuiban" >催办</li>
					<li class="mui-table-view-cell"><a href="#">撤销</a></li>
					<li class="mui-table-view-cell"><a href="#">取消</a></li>
					<li class="mui-table-view-cell"><a href="#">恢复</a></li>
				</ul>
			</div>
		</div>
		<div class="mui-popup-backdrop mui-active"
			style="display: none; z-index: 9999999"></div>
	</div>
	
	<script src="${ctxStatic}/mui/js/mui.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/weui/js/vue.min.js"></script>
	<script>
		var vue = new Vue({
			el : '#vue_content',
			data : {
				items:[],
				procInsId:'',  //流程ID
				actType:'',	   //流程类型
				status:''	   //状态
			}
		});

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
			
			
			$(".mui-popup-backdrop").on('tap', function() {
				$(".mui-popup").hide();
				$(".mui-popup-backdrop").hide();
				$("#xuanfu").show();
			});
			
			$("#rc_btn").on("tap",function(){
				$("#poper_m").show();
				$("#poper_dv").show();
			});
			$("#poper_m").on("tap",function(){
				$("#poper_m").hide();
				$("#poper_dv").hide();
			});
			
		});
		/* 下拉刷新*/
		mui.init({
			pullRefresh : {
				container : '#pullrefresh',
				down : {
					callback : pulldownRefresh
				}
			}
		});
		function pulldownRefresh() {
			setTimeout(function() {
				window.location.reload();
				mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
			}, 1000);
		}

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
											var sqr_text = $.trim($(this).text());
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

		var slider = mui("#slider");

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
		
		function setData(status,actType,procInsId){
			/* 隐藏js操作 */
			$(".mui-popup").show();
			$(".mui-popup-backdrop").show();
			$("#xuanfu").hide();
			
			vue.procInsId=procInsId;
			vue.status=status;
			vue.actType=actType;
		}
		
		$("#cuiban").on('tap',function(event){ 
			
			$(".mui-popup").hide();
			$(".mui-popup-backdrop").hide();
			$("#xuanfu").show();
			
			$.getJSON("${ctx}/shenpi/remind?actType="+vue.actType+"&procInsId="+vue.procInsId,{},function(jsonData){
				if(jsonData.success!="1"){
					mui.alert("催办失败");
					return false;
				}
				mui.alert("催办成功，请耐心等待!");
			});
			
		});
		

		
		
	</script>

</body>

</html>