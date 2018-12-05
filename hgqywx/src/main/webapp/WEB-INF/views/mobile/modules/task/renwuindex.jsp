<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/zepto.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/vue.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/common.js"></script>
<title>任务安排</title>
</head>
<body>
	<!--头部-->
	<div class="header">
		<a href="${ctx}/main/index" class="img_left"> <img
			src="${ctxStatic}/weui/img/xiangzuo.png" />
		</a>
		<p>任务安排</p>
	</div>
	<!--内容区-->
	<div class="weui-tab">
		<div class="weui-navbar">
			<a class="weui-navbar__item tab-blue" href="#tab1"> 待完成 </a> <a
				class="weui-navbar__item" href="#tab2"> 已完成 </a> <a
				class="weui-navbar__item" href="#tab3"> 我安排 </a>
		</div>
		<div class="weui-tab__bd">
			<div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
				<c:forEach items="${list}" var="renwu">
					<div class="weui-panel weui-panel_access">
						<div class="weui-panel__bd">
							<a href="${ctx}/task/renwu/tsxq?id=${renwu.id}"
								class="weui-media-box weui-media-box_appmsg">
								<div class="weui-media-box__bd pl10">
									<h4 class="weui-media-box__title">${renwu.theme}</h4>
									<span><fmt:formatDate value="${renwu.starttime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></span>
									<p class="weui-media-box__desc pt10">
										2018-08-20&nbsp;&nbsp;&nbsp;查看详情</p>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="tab2" class="weui-tab__bd-item">
				<div class="weui-panel weui-panel_access">
					<div class="weui-panel__bd">
						<a href="daicanjia.html"
							class="weui-media-box weui-media-box_appmsg">
							<div class="weui-media-box__bd pl10">
								<h4 class="weui-media-box__title">任务安排</h4>
								<p class="weui-media-box__desc pt10">2018-08-20~2018-9-13</p>
								<p class="weui-media-box__desc pt10">查看详情</p>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div id="tab3" class="weui-tab__bd-item">
				<div class="weui-panel weui-panel_access">
					<div class="weui-panel__bd">
						<a href="${ctx}/task/renwu/rwxq"
							class="weui-media-box weui-media-box_appmsg">
							<div class="weui-media-box__bd pl10">
								<h4 class="weui-media-box__title">任务安排</h4>
								<p class="weui-media-box__desc pt10">2018-08-20~2018-9-13</p>
								<p class="weui-media-box__desc pt10">查看详情</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<a href="${ctx}/task/renwu/form" id=""> <img
		src="${ctxStatic}/weui/img/fagonggao.png" width="50" height="50"
		style="position: absolute; right: 0; bottom: 20px; z-index: 999;" />
	</a>
	<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
	<script>
		$(document).on("click", "#i6", function() {
			$.actions({
				onClose : function() {
					console.log("close");
				},
				actions : [ {
					text : "提前结束",
					onClick : function() {
						$.alert("已提前");
					}
				}, {
					text : "删除会议",
					onClick : function() {
						$.alert("删除成功");
					}
				}, {
					text : "取消会议",
					onClick : function() {
						$.alert("取消成功");
					}
				} ]
			});
		});
		$('.qx').click(function() {
			$('.weui-mask').removeClass('weui-mask--visible');
			$('.weui-custom-pop').removeClass('weui-dialog--visible');
		});
		$('#i0').click(function() {
			$('.weui-mask').addClass('weui-mask--visible');
			$('.weui-custom-pop').addClass('weui-dialog--visible');
		});
	</script>
</body>
</html>