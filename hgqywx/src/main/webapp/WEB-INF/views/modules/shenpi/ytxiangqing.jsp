<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="${ctxStatic}/weui/css/public.css" />
    <link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
    <link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
    <link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />
    <title>审批详情</title>
</head>
<body>
	<!--头部-->
	<div class="header">
		<a href="${ctx}/shenpi/yitijiao" class="img_left">
			<img src="${ctxStatic}/weui/img/xiangzuo.png" />
		</a>
		<p>审批详情</p>
	</div>
	<!--内容区-->
	<div class="weui-cells">
	  	<div class="weui-cell">
		    <div class="weui-cell__bd">
		      <p>杨过的请假</p>
		    </div>
	  	</div>
	  	<div class="weui-cell">
		    <div class="weui-cell__bd">
		      <p>部门</p>
		    </div>
		    <div class="weui-cell__ft">软件部</div>
	  	</div>
	</div>
	<div class="weui-cells">
	  	<div class="weui-cell">
		    <div class="weui-cell__bd">
		      <p>请假类型</p>
		    </div>
		    <div class="weui-cell__ft">事假</div>
	  	</div>
	   	<div class="weui-cell">
		    <div class="weui-cell__bd">
		      <p>开始时间</p>
		    </div>
		    <div class="weui-cell__ft">2018-08-20&nbsp;&nbsp;11：59</div>
	  	</div>
	  	<div class="weui-cell">
		    <div class="weui-cell__bd">
		      <p>结束时间</p>
		    </div>
		    <div class="weui-cell__ft">2018-08-20&nbsp;&nbsp;15：59</div>
	  	</div>
	  	<a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
	      <div class="weui-media-box__bd">
	        <h4 class="weui-media-box__title">请假事由</h4>
	        <p class="weui-media-box__desc">火星撞地球</p>
	      </div>
	    </a>
	</div>
	<div class="timeline" style="background-color: white;">
	  	<ul>
	  		<li class="timeline-item">
			  	<div class="timeline-item-head-first"> 
			  		<i class="weui_icon weui_icon_success_no_circle timeline-item-checked"></i> 
			  	</div> 
			  	<div class="timeline-item-tail">
			  		
			  	</div> 
			  	<div class="timeline-item-content">
			  		<h4 >已完成审批</h4> 
			  		<p>2018-08-20</p> 
			  	</div> 
		  	</li>
		  	<li class="timeline-item">
			  	<div class="timeline-item-head"> 
			  		<i class="weui_icon weui_icon_success_no_circle timeline-item-checked"></i> 
			  	</div> 
			  	<div class="timeline-item-tail">
			  		
			  	</div> 
			  	<div class="timeline-item-content">
			  		<h4 >经理</h4> 
			  		<p>2018-08-20&nbsp;&nbsp;已审批</p> 
			  	</div> 
		  	</li>
		   	<li class="timeline-item"> 
			   	<div  class="timeline-item-head"> 
			   		<i class="weui_icon weui_icon_success_no_circle timeline-item-checked hide" ></i> 
			   	</div> 
			   	<div class="timeline-item-tail" ></div> 
			   	<div class="timeline-item-content"> 
			   		<h4>黄蓉</h4> 
			   		<p>2018-08-20&nbsp;&nbsp;发起审批</p> 
			   	</div> 
		   	</li>
	    </ul>
    </div>
</body>
</html>