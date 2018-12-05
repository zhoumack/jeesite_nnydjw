<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	    <title>任务详情</title>
	    <link rel="stylesheet" href="${ctxStatic}/weui/css/public.css" />
	    <link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
	    <link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
	    <link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />
	    <style>
			.weui-logistics{ border-left: 1px solid #a5a5a5; padding:20px 10px 20px 15px; margin:0 10px; color:#a5a5a5;}
			.weui-logistics .weui-logistics-li{ position: relative; border-bottom: 1px solid #e3e3e3; padding:10px 0; font-size: 15px;}
			.weui-logistics .weui-logistics-li:before{ content: " "; width: 16px; height: 16px; background:#a5a5a5; border-radius: 50%; display: inline-block; position: absolute; left: -23px; top: 12px;}
			.weui-logistics .weui-logistics-li.cur:before{ background:#e3313d; }
			.weui-logistics .weui-logistics-li.cur{ color: #e3313d; }
			.weui-logistics .weui-logistics-li span{ font-size: 13px; }
			.weui-logistics .weui-logistics-li p{ line-height: 20px; }
		</style>
	</head>
	<body bgcolor="#f5f5f5">
		<!--头部导航-->
		<div class="header">
			<a href="${ctx}/main/rwap" class="img_left">
				<img src="${ctxStatic}/weui/img/xiangzuo.png" />
			</a>
			<p>任务详情</p>
		</div>
		<form:form id="form" modelAttribute="renwu"
			action="${ctx}/task/renwu/save" method="post">
		<!--内容区..........列表-->
		<div class="weui-cells">
		  	<div class="weui-cell">
			    <div class="weui-cell__bd">
			      <p>任务主题</p>
			    </div>
			    <div class="weui-cell__ft"><span>${renwu.theme}</span></div>
		  	</div>
		  	<div class="weui-cell">
			    <div class="weui-cell__bd">
			      <p>任务负责人</p>
			    </div>
			    <div class="weui-cell__ft">周瑜</div>
		  	</div>
		  	<div class="weui-cell">
			    <div class="weui-cell__bd">
			      <p>开始时间</p>
			    </div>
			    <div class="weui-cell__ft">2018-08-19</div>
		  	</div>
		  	<div class="weui-cell">
			    <div class="weui-cell__bd">
			      <p>结束时间</p>
			    </div>
			    <div class="weui-cell__ft">2018-09-19</div>
		  	</div>
		  	<div class="weui-cell">
			    <div class="weui-cell__bd">
			      <p>任务时长</p>
			    </div>
			    <div class="weui-cell__ft">1天1小时1分钟</div>
		  	</div>
		  	<a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
			    <div class="weui-media-box__bd">
			        <h4 class="weui-media-box__title">内容</h4>
			        <p class="weui-media-box__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
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
				  		<h4 >已完成</h4> 
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
				  		<p>2018-08-20&nbsp;&nbsp;已接受</p> 
				  	</div> 
			  	</li>
			   	<li class="timeline-item"> 
				   	<div  class="timeline-item-head"> 
				   		<i class="weui_icon weui_icon_success_no_circle timeline-item-checked hide" ></i> 
				   	</div> 
				   	<div class="timeline-item-tail" ></div> 
				   	<div class="timeline-item-content"> 
				   		<h4>黄蓉</h4> 
				   		<p>2018-08-20&nbsp;&nbsp;发起任务</p> 
				   	</div> 
			   	</li>
		    </ul>
	  </div>
	  </form:form>
	</body>
</html>