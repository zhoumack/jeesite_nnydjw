<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>审批助手</title>
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
   	<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css">
	<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css">
	<link rel="stylesheet" href="${ctxStatic}/weui/css/weuix.min.css">
	<style>
	   	.tab_color{
	   		color: #4187fa;
	   	}
   </style>
</head>
<body>
	<!--头部-->
	<div class="header">
		<a href="${ctx}/main/xiaoxi" class="img_left">
			<img src="${ctxStatic}/weui/img/xiangzuo.png" />
		</a>
		<p>审批助手</p>
	</div>
	<!-- 内容区-->
	<div class="weui-panel weui-panel_access wbr">
	  	<div class="weui-panel__hd">昨天&nbsp;&nbsp;12:00</div>
	    <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
	      <div class="weui-media-box__bd">
	        <p class="weui-media-box__desc">你的请假审批已完成，请知悉</p>
	      </div>
	    </a>
	  	<div class="weui-panel__ft">
		    <a href="${ctx}/shenpi/ytxq" class="weui-cell weui-cell_access weui-cell_link">
		      <div class="weui-cell__bd">进入阅读</div>
		      <span class="weui-cell__ft"></span>
		    </a>    
	  	</div>
	</div>
</body>
</html>