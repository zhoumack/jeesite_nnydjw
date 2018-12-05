<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	    <title>选择人员</title>
	    <link rel="stylesheet" href="${ctxStatic}/weui/css/public.css" />
	    <link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
	    <link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
	</head>
	<body bgcolor="#f5f5f5">
		<!--头部导航-->
		<div class="header">
			<a href="${ctx}/shenpi/qingjia/form" class="img_left">
				<img src="img/xiangzuo.png" />
			</a>
			<p>选择审批人</p>
		</div>
		<!--内容区..........列表-->
		<div class="weui-cells">
		  	<a class="weui-cell weui-cell_access" href="javascript:;">
			    <div class="weui-cell__hd">
			    	<img src="${ctxStatic}/weui/img/touxiang.jpg" width="40" height="40" style="border-radius: 8px;">
			    </div>
			    <div class="weui-cell__bd">
			      <p>关羽</p>
			    </div>
		  	</a>
		  <a class="weui-cell weui-cell_access" href="javascript:;">
		    <div class="weui-cell__hd" id="img">
		    	<img src="${ctxStatic}/weui/img/touxiang.jpg" width="40" height="40" style="border-radius: 8px;">
		    </div>
		    <div class="weui-cell__bd">
		      <p>曹操</p>
		    </div>
		  </a>
		  <a class="weui-cell weui-cell_access" href="javascript:;">
		    <div class="weui-cell__hd">
		    	<img src="${ctxStatic}/weui/img/touxiang.jpg" width="40" height="40" style="border-radius: 8px;">
		    </div>
		    <div class="weui-cell__bd">
		      <p>诸葛亮</p>
		    </div>
		  </a>
		</div>
		<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js" ></script>
		<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js" ></script>
		<script>
		 	var imgs = document.getElementById("img").getElementsByTagName("img")
			var images = [];
			var divs = document.getElementsByTagName("div");
			for(var i=0,i<divs.length;i++){
			var imgs = divs[i].getElementsByTagName("img");
			for(var j=0;j<imgs.length;j++){
			images.push(imgs[j])
			}
			}
		</script>
	</body>
</html>