<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>工作台</title>
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
		<p>工作台</p>
	</div>
	<!-- 内容区-->
	<div class="menu">
		<div class="menu_dv">
		 	<a class="menu_a" href="#">
		 		<img src="${ctxStatic}/weui/img/gongfeidianhua.png" />
		 		<p>公费电话</p>
		 	</a>
		 	<a class="menu_a" href="#">
		 		<img src="${ctxStatic}/weui/img/youxiang.jpg" />
		 		<p>企业邮箱</p>
		 	</a>
		 	<a class="menu_a" href="${ctx }/shenpi">
		 		<img src="${ctxStatic}/weui/img/shenpi.jpg" />
		 		<p>审批</p>
		 	</a>
		 	<a class="menu_a" href="#">
		 		<img src="${ctxStatic}/weui/img/huibao.jpg" />
		 		<p>汇报</p>
		 	</a>
		</div>
		<div class="menu_dv">
		 	<a class="menu_a" href="#">
		 		<img src="${ctxStatic}/weui/img/gongg.png" />
		 		<p>公告</p>
		 	</a>
		 	<a class="menu_a" href="#">
		 		<img src="${ctxStatic}/weui/img/kaoqinyichang.png" />
		 		<p>文件盘</p>
		 	</a>
		 </div>
    </div>
	<div class="menu1">
		<a class="menu_a" href="#">
	 		<img src="${ctxStatic}/weui/img/daka.png" />
	 		<p>打卡</p>
	 	</a>
	 	<a class="menu_a" href="#">
	 		<img src="${ctxStatic}/weui/img/mianshi.png" />
	 		<p>同事吧</p>
	 	</a>
	</div>
	<!--底部-->
    <div class="weui_tabbar ">
        <a href="xiaoxi.html" class="weui_tabbar_item">
            <div class="weui_tabbar_icon">
                <img src="${ctxStatic}/weui/img/xiaoxi.png" >
            </div>
            <p class="weui_tabbar_label tab_color">消息</p>
        </a>
        <a href="javascript:;" class="weui_tabbar_item ">
            <div class="weui_tabbar_icon">
                <img src="${ctxStatic}/weui/img/gongzuotai.png" alt="">
            </div>
            <p class="weui_tabbar_label">工作台</p>
        </a>
        <a href="javascript:;" class="weui_tabbar_item">
            <div class="weui_tabbar_icon">
                <img src="${ctxStatic}/weui/img/wo.png" alt="">
            </div>
            <p class="weui_tabbar_label">我</p>
        </a>
    </div>
</body>
</html>