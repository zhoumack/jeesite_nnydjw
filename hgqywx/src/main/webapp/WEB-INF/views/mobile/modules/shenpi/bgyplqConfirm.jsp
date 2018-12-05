<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />
<link rel="stylesheet" href="${ctxStatic}/mui/css/mui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/imgeviewer.css" />
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
/* 悬浮加号 */
#poper_m{
	width: 100%;
	height: 100%;
	background-color: #fff;
	z-index: 99999;
	position: absolute;
	top: 0;
	opacity: 0.8;
	display: none;
}
#poper_dv{
	z-index: 999999;
	position: absolute;
	bottom:57px !important;
	right: 17px !important;
	display: none;
}

img{
vertical-align:middle
}
.mm-page{
	position: inherit !important;
}

</style>
<script type="text/javascript">
		var options = [{
			value: '1',
			text: '事假'
		}];  
		//请假类型变量
		var no_qjlx = true;
		$(document).ready(function() {
			
			var bglp_id = $('#bglp_id').text();
			console.log("bglp_id="+bglp_id);
			var _url = "${ctx}/store/hcpj/getHcpj?id="+bglp_id;
			$.getJSON(_url, {
				/* type: 'bgyplqType' */
			}, function(rsp) {
				if(rsp) {
					console.log('aa='+rsp.data.nums);
					$('#kucun').html(rsp.data.nums+"件");
				}
			});
		});
		
</script>
</head>
<body>
<!-- 悬浮区 -->
<%-- <img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png" style="z-index: 99999;position: absolute;width: 14%;right: 0px;bottom: 85px"> --%>
<img id="rc_btn" src="${ctxStatic}/mui/image/rc_more.png"
		style="z-index: 999; position: absolute; width: 40px; right: 17px; bottom: 67px">
	<div id="poper_m"></div>
	<div id="poper_dv">
		<div style="margin-bottom: 8px">
			<span style="color: #777777; font-size: 18px">返回</span> <img
				id="xuanfu" src="${ctxStatic}/mui/image/fanhui.png" width="45px" />
		</div>
	</div>

<!--内容  -->
	<div class="center_dv">
		<div class="center_dv_dv" style="float: left">
			<img src="${ctxStatic}/mui/img/header.jpg" width="30px" height="30px" style="border-radius: 5px" />
			<span>${bgyplq.user.name}的物品领用申请</span>
		</div>
		<div class="sp_dv" style="float: left">
		    <span id="shenpi">确认中</span>
		</div>
		<div style="clear: both;"></div>

		<div class="center_dv_dv2">
			<div class="center_span">
				<span>事项来源</span> <span class="center_span_s2">${bgyplq.esource}</span>
			</div>
			<div class="center_span">
				<span>房       间          号</span> <span class="center_span_s2">${bgyplq.houseNumber}</span>
			</div>
			<div class="center_span">
				<span>申请姓名</span> <span class="center_span_s2">${bgyplq.user.name}</span>
			</div>
			<div class="center_span" style="display: none;">
				<span>物品ID</span> <span id="bglp_id" class="center_span_s2">${bgyplq.bgypId}</span>
			</div>
			<div class="center_span">
				<span>物品名称</span> <span class="center_span_s2">${bgyplq.item}</span>
			</div>
			<!-- <div class="center_span">
				<span>库&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存</span> 
				<span id="kucun" class="center_span_s2"></span>
			</div> -->
			<div class="center_span">
				<span>领用时间</span> 
				<span class="center_span_s2">
					<fmt:formatDate value="${bgyplq.date}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
				</span>
			</div>
			<div class="center_span">
				<span>数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</span> <span class="center_span_s2">${bgyplq.itemnums}</span>
			</div>
			<div class="center_span">
				<span>用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;途</span> <span class="center_span_s2">${bgyplq.usefor}</span>
			</div>
			<div class="center_span">
				<span>说明附件</span> <span class="center_span_s2">${bgyplq.filepath==""?"无":" " }</span>
				<div style="margin-top: 10px">
					<c:forEach items="${bgyplq.filepath.split(',') }" var="img" varStatus="status">
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
	<form:form id="inputForm" modelAttribute="bgyplq" action="${ctx}/shenpi/bgyplq/saveAudit" method="post"
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
		<act:histoicMobileFlowList_2 procInsId="${bgyplq.act.procInsId}" />
		<div class="xian"></div>
		<c:if test="${!empty bgyplq.copy }">
			<act:histoicMobileFlowList_3 procInsId="${bgyplq.copy}" />
		</c:if  >
		<c:if test="${empty bgyplq.copy }">
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
				<%-- <input type="hidden" id="approve" name="approve"
					value="${bgyplq.approve }" /> --%>
			</div>
		</div>


		<!--底部导航-->
		<div class="footer_op">
			<!-- <div style="padding-left: 15px;">
				<form class="mui-input-group">
					<div class="mui-input-row mui-radio mui-left">
						<label>radio</label>
						<input name="radio1" type="radio">
					</div>
				</form>
			</div>
			<div class="xian"></div> -->
			<div class="mui-row mui-col-xs-12"> 
				<button class="mui-col-xs-12" type="button" id="tongyi">
					<img src="${ctxStatic}/mui/img/tongyi.png" width="20px" height="20px" style="position: relative; top: 5px" />确认收货
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
		/* 提示框 */
		$("#tongyi").on('tap', function() {
			mui.confirm('请确认是否拿到申请物品?',function(e) {
				if (e.index == 1) {
					$('#flag').val('1');
					$("#inputForm").submit();
				}
			})
		});
		/*控件拖动并返回  */
		mui.ready(function(){
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
		
		/* 加号点击 */
		$("#rc_btn").on("tap",function(){
			$("#rc_btn").hide();
			$("#poper_m").show();
			$("#poper_dv").show();
		});
		$("#poper_m").on("tap",function(){
			$("#poper_m").hide();
			$("#poper_dv").hide();
			$("#rc_btn").show();
		});
	</script>

</body>
</html>