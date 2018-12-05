<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>日程详情</title>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mui/css/mui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mui/css/mui.picker.all.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mui/css/mui.dtpicker.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mui/css/imgeviewer.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />

<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.picker.all.js"></script>
<script src="${ctxStatic}/mui/js/mui.dtpicker.js"></script>
<script src="${ctxStatic}/mui/js/mui.previewimage.js"></script>
<script src="${ctxStatic}/mui/js/mui.zoom.js"></script>
<script src="${ctxStatic}/webuploader/webuploader.min.js"></script>
<script src="${ctxStatic}/mui/js/loading.js"></script>
</head>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}


body, html {
	width: 100%;
	height: 100%;
	line-height: normal;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
	overflow-x: hidden;
}
body {
	background-color: #e5e5e5 !important;
}

.footer {
	bottom: 0;
	display: table;
	width: 100%;
	height: 50px;
	padding: 0;
	table-layout: fixed;
	border-top: 0;
	border-bottom: 0;
	position: fixed;
	z-index: 10;
	right: 0;
	left: 0;
	background-color: #f7f7f7;
}

.footer_dv {
	display: table-cell;
	overflow: hidden;
	width: 1%;
	height: 50px;
	text-align: center;
	vertical-align: middle;
	white-space: nowrap;
	text-overflow: ellipsis;
	position: relative;
	top: 10px;
	line-height: 15px;
}

.rc_title {
	height: 184px;
	background-image:url("${ctxStatic}/mui/image/xq_bg.png");
	background-size:100% 100%;
	position: relative;
}

.rc_title_dv {
	position: absolute;
	bottom: 0px;
	left: 20px
}

.rc_title_p1 {
	font-size: 22px;
	color: #fff;
}

.rc_title_p2 {
	font-size: 12px;
	color: #fff;
}

.rc_xian {
	height: 1px;
	background-color: #e5e5e5;
	width: 95%;
	margin: 0 auto;
	margin-top: 20px;
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
<body>
	<!-- 悬浮区 -->
<%-- 	<img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png" style="z-index: 99999; position: absolute; width: 14%; right: 0px; bottom: 85px"> --%>
		<img id="rc_btn" src="${ctxStatic}/mui/image/rc_more.png" style="z-index: 99999; position: absolute; width: 40px; right: 17px; bottom: 67px">
	<!--内容  -->
	<div class="rc_title">
		<div class="rc_title_dv">
			<p class="rc_title_p1">${richeng.theme }</p>
			<p class="rc_title_p2">
				<fmt:formatDate value="${richeng.startTime}" type="both"
					pattern="yyyy-MM-dd HH:mm" />
				到
				<fmt:formatDate value="${richeng.endTime}" type="both"
					pattern="yyyy-MM-dd HH:mm" />
			</p>
		</div>
	</div>
	<div style="background-color: #fff;">
		<div style="height: 30px;">
			<div
				style="line-height: 30px; padding-left: 20px; padding-top: 10px;">
				<p style="width: 20%; float: left; color: #777777;">地点</p>
				<p style="color: #000000;">${richeng.addr }</p>
			</div>
		</div>
		<div class="rc_xian"></div>
		<div>
			<div
				style="line-height: 30px; padding-left: 20px; padding-top: 10px;">
				<p style="color: #777777;">日程详情</p>
				<p style="color: #000000; margin-top: -10px; word-wrap: break-word;">
					${richeng.content } <br style="clear: both;" />
				</p>
				<input type="hidden" value="${richeng.id }" id="_id">
			</div>
		</div>
	</div>

	<div class="footer">

		<a class="footer_dv"
			href="${ctx}/grsw/richeng/form?state=1&id=${richeng.id}"> <%-- <a href="${ctx}/grsw/richeng/form?state=1&id=${richeng.id}"> --%>
			<img src="${ctxStatic}/mui/image/xiugai.png" width="15px" />
			<p style="font-size: 11px;">修改</p> <!-- </a> -->
		</a> <a class="footer_dv" id="footer_dv"> <img
			src="${ctxStatic}/mui/image/delete.png" width="15px" />
			<p style="font-size: 11px;">删除</p>
		</a>

	</div>
	
	<div id="poper_m"></div>
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


</body>
<script type="text/javascript">
	
	/* 返回 */
	mui.ready(function() {
		ele_drag("#rc_btn");
		$('#footer_dv').on("tap",function(){
			mui.confirm('请确认是否删除！',function(e) {
				if (e.index == 1) {
					var id = $('#_id').val();
					$.post("${ctx}/grsw/richeng/delete?id="+id, {}, function(rsp) {
						if (rsp.success != '1') {
							$.toast('提交失败！', 'cancel');
							return;
						}
						$.toast('删除成功!', function() {
							console.log('删除成功！');
						});
						setTimeout(function() {
							window.location.href = "${ctx}" + rsp.url;
						}, 500);
					}, 'json');
				}
			});
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
</html>