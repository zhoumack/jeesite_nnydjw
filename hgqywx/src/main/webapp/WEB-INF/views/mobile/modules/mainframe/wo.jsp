<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>我</title>
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
		<p>我</p>
	</div>
	<!-- 内容区-->
	<div class="weui-panel weui-panel_access wbr">
	  <div class="weui-panel__hd">重庆汉光电子有限责任公司</div>
	  <div class="weui-panel__bd">
	    <a href="${ctx}/main/grxx" class="weui-media-box weui-media-box_appmsg">
	      <div class="weui-media-box__hd">
	        <img class="weui-media-box__thumb" src="${ctxStatic}/weui/img/touxiang.jpg">
	      </div>
	      <div class="weui-media-box__bd">
	        <h4 class="weui-media-box__title">杨过</h4>
	        <p class="weui-media-box__desc">软件研发部</p>
	      </div>
	    </a>
	  </div>
	</div>
	<div class="weui-cells">
	  	<a class="weui-cell weui-cell_access" href="javascript:;">
		    <div class="weui-cell__hd"><img src="${ctxStatic}/weui/img/shoucang.png" width="20" height="20"></div>
		    <div class="weui-cell__bd" style="padding-left: 15px;">
		      <p>我的收藏</p>
		    </div>
		    <div class="weui-cell__ft">
		    </div>
	  	</a>
	  	<a class="weui-cell weui-cell_access" href="javascript:;">
		    <div class="weui-cell__hd"><img src="${ctxStatic}/weui/img/shoucang.png" width="20" height="20"></div>
		    <div class="weui-cell__bd" style="padding-left: 15px;">
		      <p>我的名片</p>
		    </div>
		    <div class="weui-cell__ft">
		    </div>
	  	</a>
	  	<a class="weui-cell weui-cell_access" href="javascript:;">
		    <div class="weui-cell__hd"><img src="${ctxStatic}/weui/img/shoucang.png" width="20" height="20"></div>
		    <div class="weui-cell__bd" style="padding-left: 15px;">
		      <p>我的客服</p>
		    </div>
		    <div class="weui-cell__ft">
		    </div>
	  	</a>
	  	<a class="weui-cell weui-cell_access" href="javascript:;">
		    <div class="weui-cell__hd"><img src="${ctxStatic}/weui/img/shoucang.png" width="20" height="20"></div>
		    <div class="weui-cell__bd" style="padding-left: 15px;">
		      <p>我的设置</p>
		    </div>
		    <div class="weui-cell__ft">
		    </div>
	  	</a>
	  	<a class="weui-cell weui-cell_access" href="${ctx }/logout">
		    <div class="weui-cell__hd"><img src="${ctxStatic}/weui/img/shoucang.png" width="20" height="20"></div>
		    <div class="weui-cell__bd" style="padding-left: 15px;">
		      <p>退出</p>
		    </div>
		    <div class="weui-cell__ft">
		    </div>
	  	</a>
	  	
	</div>
	<!--底部-->
    <div class="weui_tabbar ">
        <a href="${ctx}/main/xiaoxi" class="weui_tabbar_item">
            <div class="weui_tabbar_icon">
                <img src="${ctxStatic}/weui/img/xiaoxi1.png" >
            </div>
            <p class="weui_tabbar_label">消息</p>
        </a>
        <a href="${ctx}/main/index" class="weui_tabbar_item ">
            <div class="weui_tabbar_icon">
                <img src="${ctxStatic}/weui/img/gongzuotai1.png" alt="">
            </div>
            <p class="weui_tabbar_label">工作台</p>
        </a>
        <a href="javascript:;" class="weui_tabbar_item">
            <div class="weui_tabbar_icon">
                <img src="${ctxStatic}/weui/img/wo.png" alt="">
            </div>
            <p class="weui_tabbar_label tab_color">我</p>
        </a>
    </div>
</body>
</html>