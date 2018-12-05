<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<script type="text/javascript"
	src="${ctxStatic}/weui/js/jquery-1.8.3.min.js"></script>
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
	<form:form id="form" modelAttribute="jiaban"
		action="${ctx}/shenpi/jiaban/save" method="post"
		class="form-horizontal">
		<div class="center_dv">
			<div class="center_dv_dv" style="float: left">
				<img src="${ctxStatic}/mui/img/header.jpg" width="30px"
					height="30px"  style="border-radius: 5px"/> <span>${jiaban.user.name}的加班申请</span>
			</div>
			<div class="sp_dv" style="float: left">
				<span id="shenpi">${jiaban.status}</span>
			</div>
			<div style="clear: both;"></div>

			<div class="center_dv_dv2">
				<div class="center_span">
					<span>申请姓名</span> <span class="center_span_s2">${jiaban.user.name}</span>
				</div>
				<%-- <div class="center_span">
					<span>加班类型</span> <span class="center_span_s2">${jiaban.type}</span>
				</div> --%>
				<div class="center_span">
					<span>开始时间</span> <span class="center_span_s2"><fmt:formatDate
							value="${jiaban.starttime}" type="both"
							pattern="yyyy-MM-dd HH:mm:ss" /></span>
				</div>
				<div class="center_span">
					<span>截止时间</span> <span class="center_span_s2"><fmt:formatDate
							value="${jiaban.endtime}" type="both"
							pattern="yyyy-MM-dd HH:mm:ss" /></span>
				</div>
				<div class="center_span">
					<span>加班时长</span> <span class="center_span_s2">${jiaban.totaltime}小时</span>
				</div>
				<div class="center_span">
					<span>加班事由</span> <span class="center_span_s2">${jiaban.event}</span>
				</div>
				<div class="center_span">
					<span>说明附件</span> <span class="center_span_s2">${jiaban.filepath==""?"无":" " }</span>
					<div style="margin-top: 10px">
						<c:forEach items="${jiaban.filepath.split(',') }" var="img"
							varStatus="status">
							<c:if test="${!empty img}">
							<img src="${img }" style="width: 50px; height: 50px" data-preview-src="" data-preview-group="1">
						</c:if>
						</c:forEach>
						<%-- ${ctxStatic}/mui/img/header.jpg --%>

					</div>
				</div>
			</div>
		</div>


		<form:hidden path="id" />
		<form:hidden path="act.taskId" />
		<form:hidden path="act.taskName" />
		<form:hidden path="act.taskDefKey" />
		<form:hidden path="act.procInsId" />
		<form:hidden path="act.procDefId" />
		<form:hidden path="status" />
		<form:hidden id="flag" path="act.flag" />
		<div id="spyijian" style="display: none;">
			<div class="weui-cell weui_footer1">
				<input class="weui-input" type="hidden" name="act.comment"
					value="${jiaban.remarks }">
			</div>
			<%-- <div class="weui-cell weui_footer2"> 
			<button class="weui_footer_p1" type="submit" id="tongyi"  onclick="$('#status').val('同意');$('#flag').val('1')" href="${ctx }/shenpi/qingjia/saveAudit">同意</a>
			<button class="weui_footer_p2" type="submit" id="jujue"  onclick="$('#status').val('拒绝');$('#flag').val('2')" href="${ctx }/shenpi/qingjia/saveAudit">拒绝</a>
			<button class="weui_footer_p3" type="submit" id="bohui"  onclick="$('#status').val('驳回');$('#flag').val('3')" href="${ctx }/shenpi/qingjia/saveAudit">驳回</a>
			<button class="weui_footer_p4" type="submit" id="zhuanshen" onclick="$('#status').val('转审');$('#flag').val('4')" href="${ctx }/shenpi/qingjia/saveAudit">转审</a>
		</div> --%>
		</div>
		
		<act:histoicMobileFlowList procInsId="${jiaban.procInsId}" />
	
	
	</form:form>

	<script>
	mui.previewImage();
		$(document).on("click", "#tongyi", function() {
			$('#status').val('同意');
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