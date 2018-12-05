<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />
<link rel="stylesheet" href="${ctxStatic}/mui/css/mui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mui/css/imgeviewer.css" />
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.previewimage.js"></script>
<script src="${ctxStatic}/mui/js/mui.zoom.js"></script>
<title>审批详情</title>
<style>
.timeline {
	padding: 0 !important;
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
</style>
</head>
<body>
<!-- 悬浮区 -->
<img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png" style="z-index: 99999;position: absolute;width: 14%;right: 0px;bottom: 85px">
<!--内容  -->
	<div class="center_dv">
		<div class="center_dv_dv" style="float: left">
			<img src="${ctxStatic}/mui/img/header.jpg" width="30px" height="30px" style="border-radius: 5px" />
			<span>${bangongqu.user.name}的办公区申请</span>
		</div>
		<div class="sp_dv" style="float: left">
			<span id="shenpi">审批中</span>
		</div>
		<div style="clear: both;"></div>

		<div class="center_dv_dv2">
			<div class="center_span">
				<span>申请姓名</span> <span class="center_span_s2">${bangongqu.user.name}</span>
			</div>
			<div class="center_span">
				<span>办&nbsp;&nbsp;公&nbsp;室</span> <span class="center_span_s2">${bangongqu.bgsType}</span>
			</div>
			<div class="center_span">
				<span>房&nbsp;&nbsp;间&nbsp;号</span> <span class="center_span_s2">${bangongqu.roomNo}</span>
			</div>
			<div class="center_span">
				<span>申请时间</span> <span class="center_span_s2"><fmt:formatDate
						value="${bangongqu.date}" type="both"
						pattern="yyyy-MM-dd HH:mm:ss" /></span>
			</div>
			<div class="center_span">
				<span>申请事由</span> <span class="center_span_s2">${bangongqu.event}</span>
			</div>
			<div class="center_span">
				<span>说明附件</span> <span class="center_span_s2">${bangongqu.filepath==""?"无":" " }</span>
				<div style="margin-top: 10px">
					<c:forEach items="${bangongqu.filepath.split(',') }" var="img" varStatus="status">
						<c:if test="${!empty img}">
							<img src="${img }" style="width: 50px; height: 50px" data-preview-src="" data-preview-group="1">
						</c:if>
					</c:forEach>
					<%-- ${ctxStatic}/mui/img/header.jpg --%>

				</div>
			</div>
		</div>
	</div>

	<!--审批流程-->
	<form:form id="inputForm" modelAttribute="bangongqu"
		action="${ctx}/shenpi/bangongqu/saveAudit" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<form:hidden path="act.taskId" />
		<form:hidden path="act.taskName" />
		<form:hidden path="act.taskDefKey" />
		<form:hidden path="act.procInsId" />
		<form:hidden path="act.procDefId" />
		<form:hidden path="status" />
		<form:hidden id="flag" path="act.flag" />
		<div id="spyijian">
		
		<div class="liu_dv">
		<act:histoicMobileFlowList_2 procInsId="${bangongqu.act.procInsId}" />
		<div class="xian"></div>
		<c:if test="${!empty bangongqu.copy }">
			<act:histoicMobileFlowList_3 procInsId="${bangongqu.copy}" />
		</c:if  >
		<c:if test="${empty bangongqu.copy }">
			<p class="liu_dv_p2">抄送人：无</p>
		</c:if  >
			
			<%-- <p class="liu_dv_p2">抄送人：${qingjia.copy==""?"无":qingjia.copy }</p> --%>
		</div>
		</div>
		</div>
		

		<!--弹出页面-->
		<div id="half" class="weui-popup__container">
			<div class="weui-popup__overlay"></div>
			<div class="weui-popup__modal" id="app">
				<!--头部导航-->
				<div class="header">
					<a class="img_left" id="aaa"> <img
						src="${ctxStatic}/weui/img/xiangzuo.png" />
					</a>
					<p>选择人员</p>
				</div>
				<!--内容区..........列表-->
				<div class="nav-ml">
					<ul class="nav-first" style="margin-left: 0;" v-for="one in list">
						<li>
							<div class="weui-cell item-1" id="item1">
								<div class="weui-cell__hd">
									<img src="${ctxStatic}/weui/img/bumen.png" width="20"
										height="20">
								</div>
								<div class="weui-cell__bd">
									<p>{{one.name}}</p>
								</div>
							</div>
							<ul class="nav-second fold">
								<li v-for="two in one.children">
									<div class="weui-cell item-2" id="item2">
										<div class="weui-cell__hd">
											<img src="${ctxStatic}/weui/img/bumen.png" width="20"
												height="20">
										</div>
										<div class="weui-cell__bd">
											<p>{{two.name}}</p>
										</div>
									</div>
									<ul class="nav-three fold">
										<li v-for="three in two.children">
											<div class="weui-cell item-3" id="item3">
												<div class="weui-cell__hd">
													<img src="${ctxStatic}/weui/img/bumen.png" width="20"
														height="20">
												</div>
												<div class="weui-cell__bd" id="rclick">
													<p>{{three.name}}</p>
													<span style="display: none;">{{three.id}}</span>
												</div>
											</div>
									</ul>
								</li>
							</ul>
						</li>
					</ul>
					</li>
					</ul>
				</div>
				<input type="hidden" id="approve" name="approve"
					value="${bangongqu.approve }" />
			</div>
		</div>


		<!--底部导航-->
		<div class="footer_op">
			<div style="padding-left: 15px;">
				<div class="mui-input-row">
					<input type="text" name="act.comment" placeholder="审批意见">
				</div>
			</div>
			<div class="xian"></div>
			<div class="mui-row mui-col-xs-12"> 
				<button class="mui-col-xs-6" type="button" id="tongyi" onclick="sub_form('1')">
					<img src="${ctxStatic}/mui/img/tongyi.png" width="20px" height="20px" style="position: relative; top: 5px" /> 同意
				</button>
				<button class="mui-col-xs-6" type="button" id="jujue" onclick="sub_form('2');">
					<img src="${ctxStatic}/mui/img/bohui.png" width="20px" height="20px" style="position: relative; top: 5px" /> 不同意
				</button>
			</div>
		</div>

	</form:form>

	<script src="${ctxStatic}/weui/js/vue.min.js"></script>
	<script>
		$(function(){ 
			$("#inputForm").css('padding-bottom',$('.footer_op').outerHeight(true));
		});
		mui.previewImage();
		$("#spyijian").css('padding-bottom',$('.footer_op').outerHeight(true));
		
		function sub_form(sub_type) {
			$('#flag').val(sub_type);
			if(sub_type == '2'){
				$('#status').val('拒绝');
			}
			$("#inputForm").submit();
		}

		/* 选择抄送人 */
		$(document).on("click", "#rclick", function() {
			var nid = $(this).children("span").text();
			var name = $(this).children("p").text();
			document.getElementById("approve").value = nid;
			console.log(nid);
			console.log(name);
		});
		//选择人员json数据
		var vue = new Vue({
			el : '#app',
			data : {
				list : []
			}
		});
		$.ajax({
			type : "get",
			url : '${ctx}/sys/office/treejson',
			async : false,
			success : function(data) {
				vue.list = data;
				console.log(data);
			}
		});
		//人员列表伸缩
		$(document).on("click", "#item1", function() {
			$(this).parent().find(".nav-second").slideToggle(500);
			$(this).children("i").toggleClass("unfold");
		});
		$(document).on("click", "#item2", function() {
			$(this).parent().find(".nav-three").slideToggle(500);
			$(this).children("i").toggleClass("unfold");
		});
		$(document).on("click", "#item3", function() {
			$(this).parent().find(".nav-four").slideToggle(500);
			$(this).children("i").toggleClass("unfold");
		});
		/* 选择人员 */
		$(function() {

			var txiang = $("#txiang").attr("src");
			function djclick() {
				var txiang = $("#txiang").attr("src");
				console.log(txiang);
				var tupian = $('<img src="'+txiang+'" width="50px" height="50px"/>');
				$("#tspan").append(tupian);
				$.closePopup("#half");
				$("#item1").parent().find(".nav-second").slideUp(100);
				$("#item2").parent().find(".nav-three").slideUp(100);
			}

			$('.weui-cells_checkbox')
					.on(
							'touchstart',
							function() {
								var txiang = $("#txiang").attr("src");
								console.log(txiang);
								var tupian = $('<img src="'+txiang+'" width="50px" height="50px"/>');
								$("#tspan").append(tupian);
								$.closePopup("#half");
							});
		});
		/*  */
		$('.accordion-tit').click(function() {
			$parent = $(this).parent('li');
			if ($parent.hasClass('cur')) {
				$parent.removeClass('cur');
				$parent.siblings().removeClass('cur');
			} else {
				$parent.addClass('cur');
				$parent.siblings().removeClass('cur');
			}
		});

		$(document).on("click", "#tongyi", function() {
			
			var dshenpi = $("#dshenpi").html("已审批");
			// var yijian =$("#yijian").val();
			// $("#yijian_p").html(yijian);
			// $("#spyijian").hide();
			$.toast("审批完成");
		});
		$(document).on("click", "#bohui", function() {
			$('#status').val('驳回');
			var dshenpi = $("#dshenpi").html("已驳回");
			// var yijian =$("#yijian").val();
			// $("#yijian_p").html(yijian);
			// $("#spyijian").hide();
			$.toast("审批完成");
		});
		$(document).on("click", "#aaa", function() {
			$.closePopup("#half");
			//        $.toast("绑定成功!",1000); 
		});
		
		
		
		/*控件拖动并返回  */
		mui.ready(function(){
			ele_drag("#xuanfu");
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