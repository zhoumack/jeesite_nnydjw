<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>消息</title>
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
		<p style="float: left;padding-left:20px;">消息</p>
		<a href="tongxunlu.html" class="img_jilu">
			<img src="${ctxStatic}/weui/img/tongxunlu.png" />
		</a>
	</div>
	<!-- 内容区-->
	<div class="weui-search-bar" id="searchBar">
	  <form class="weui-search-bar__form" id="search" action="">
	    <div class="weui-search-bar__box">
	      <i class="weui-icon-search"></i>
	      <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索1" required="">
	      <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
	    </div>
	    <label class="weui-search-bar__label" id="searchText">
	      <i class="weui-icon-search"></i>
	      <span>搜索</span>
	    </label>
	  </form>
	  <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
	</div>
	<!-- 内容区-->
	<div class="weui-panel weui-panel_access">
	    <a href="shenpizhushou.html" class="weui-media-box weui-media-box_appmsg">
		    <div class="weui-media-box__hd">
		    	<img class="weui-media-box__thumb" src="${ctxStatic}/weui/img/shenpizhushou.png">
		    </div>
	        <div class="weui-media-box__bd">
	        	<h4 class="weui-media-box__title">审批助手</h4>
	        	<p class="weui-media-box__desc">您的信息已审批</p>
	        </div>
	        <span class="weui-cell__ft">15:01</span>
	    </a>
	    <a href="#" class="weui-media-box weui-media-box_appmsg">
		    <div class="weui-media-box__hd">
		    	<img class="weui-media-box__thumb" src="${ctxStatic}/weui/img/touxiang.jpg">
		    </div>
	        <div class="weui-media-box__bd">
	        	<h4 class="weui-media-box__title">曹操</h4>
	        	<p class="weui-media-box__desc">你好！吉祥如意</p>
	        </div>
	        <span class="weui-cell__ft">16:11</span>
	    </a>
	</div>
	<!--底部-->
    <div class="weui_tabbar ">
        <a href="javascript:;" class="weui_tabbar_item">
            <div class="weui_tabbar_icon">
                <img src="${ctxStatic}/weui/img/xiaoxi.png" >
            </div>
            <p class="weui_tabbar_label tab_color">消息</p>
        </a>
        <a href="index.html" class="weui_tabbar_item ">
            <div class="weui_tabbar_icon">
                <img src="${ctxStatic}/weui/img/gongzuotai1.png" alt="">
            </div>
            <p class="weui_tabbar_label">工作台</p>
        </a>
        <a href="wo.html" class="weui_tabbar_item">
            <div class="weui_tabbar_icon">
                <img src="${ctxStatic}/weui/img/wo1.png" alt="">
            </div>
            <p class="weui_tabbar_label">我</p>
        </a>
    </div>
</body>
</html>