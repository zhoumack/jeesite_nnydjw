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
	    <style type="text/css">
	    	.weui_footer{
	    		width: 100%;
	    		height: 50px;
	    		background-color: white;
	    		position: absolute;
	    		bottom: 0;
	    	}
	    	.weui_footer_dv1{
	    		width: 50%;
	    		float: left;
	    		text-align: center;
	    		line-height: 50px;
	    	}
	    	.weui_footer_dv2{
	    		width: 50%;
	    		float: right;
	    		text-align: center;
	    		line-height: 50px;
	    	}
	    	.weui-custom-pop{
			position: fixed;
			opacity: 0;
		    z-index: -1;
		    width: 80%;
		    max-width: 300px;
		    top: 50%;
		    left: 50%;
		    -webkit-transform: scale(0.9) translate(-50%, -50%);
            transform: scale(0.9) translate(-50%, -50%);
		    background-color: #FFFFFF;
		    text-align: center;
		    border-radius: 3px;
		    overflow: hidden;
		    -webkit-transition-duration: .2s;
    		transition-duration: .2s;
    		-webkit-transform-origin: 0 0;
            transform-origin: 0 0;
		}
		.weui-custom-ft{
			position: relative;
		    line-height: 48px;
		    font-size: 18px;
		    display: -webkit-box;
		    display: -webkit-flex;
		    display: flex;
		    border-top:1px solid #D5D5D6;
		}
		.weui-custom-ft a{
			display: block;
		    -webkit-box-flex: 1;
		    -webkit-flex: 1;
		    flex: 1;
		    color: #3CC51F;
		    text-decoration: none;
		    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
		    position: relative;
		    border-right:1px solid #D5D5D6;
		}
		.weui-custom-pop .weui-custom-bd{
			margin:15px 0;
		}
		.weui-custom-pop .weui-input{
			width: 90%;
			padding:5px;
			border:1px solid #57b9f8;
			border-radius: 5px;
		}
		.weui-custom-pop .weui-custom-hd{
			color:#333;
			padding:15px 0 0 0;
		}
		.weui-custom-pop .weui-custom-hd span{
			color:#74c3f9;
		}
		.weui-dialog--visible{
			opacity: 1;
		    visibility: visible;
		    z-index: 5000;
		    -webkit-transform: scale(1) translate(-50%, -50%);
		    transform: scale(1) translate(-50%, -50%);
		}

		.weui-custom-pop .close{
			width: 24px;
			height: 24px;
			background:url(images/icon22.png) no-repeat;
			background-size: 24px;
			position: absolute;
			right: 10px;
			top: 10px;
		}
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
		<!--内容区..........列表-->
		<form:form id="form" modelAttribute="renwu"
			action="${ctx}/task/renwu/save" method="post">
		<div class="weui-cells">
		  	<div class="weui-cell">
			    <div class="weui-cell__bd">
			      <p>任务主题</p>
			    </div>
			    <div class="weui-cell__ft">${renwu.theme}</div>
		  	</div>
		  	<div class="weui-cell">
			    <div class="weui-cell__bd">
			      <p>任务负责人</p>
			    </div>
			    <div class="weui-cell__ft">${renwu.user.name}</div>
		  	</div>
		  	<div class="weui-cell">
			    <div class="weui-cell__bd">
			      <p>开始时间</p>
			    </div>
			    <div class="weui-cell__ft"><fmt:formatDate value="${renwu.starttime}" type="both" pattern="yyyy-MM-dd HH:mm"/></div>
		  	</div>
		  	<div class="weui-cell">
			    <div class="weui-cell__bd">
			      <p>结束时间</p>
			    </div>
			    <div class="weui-cell__ft"><fmt:formatDate value="${renwu.endtime}" type="both" pattern="yyyy-MM-dd HH:mm"/></div>
		  	</div>
		  	<a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
			    <div class="weui-media-box__bd">
			        <h4 class="weui-media-box__title">内容</h4>
			        <p class="weui-media-box__desc">${renwu.plan}</p>
			    </div>
	    	</a>
		</div>
		<div class="weui-cells">
			<a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
			    <div class="weui-media-box__bd">
			        <h4 class="weui-media-box__title">安排人</h4>
			        <p class="weui-media-box__desc">${renwu.user.name}</p>
			    </div>
	    	</a>
		</div>
		<div class="weui_footer">
			<a id="done" href="${ctx}/task/renwu/done?id=${renwu.id}">
			<div class="weui_footer_dv1">
				<img src="${ctxStatic}/weui/img/wancheng.png" width="15px" height="15px" />
				已完成 
			</div>
			</a>
			<div class="weui_footer_dv2" id="i0">
				<img src="${ctxStatic}/weui/img/yanshi.png" width="20px" height="20px" />
				延时
			</div>
		</div>
		<div class="weui-mask qx"></div>
	    <div class="weui-custom-pop">
	        <div class="close qx"></div>
	     	<div class="weui-custom-hd">延时时间及原因</span></div>
	     	<div class="weui-custom-bd">
	     		<input type="tel" class="weui-input" placeholder="请输入延时原因">
	     	</div>
	     	<div class="weui-custom-ft">
	     		<a href="javascript:;">确定</a>
	     	</div>
	    </div>
	    </form:form>
	    <script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js" ></script>
	    <script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js" ></script>
	    <script>
			$('.qx').click(function(){
				$('.weui-mask').removeClass('weui-mask--visible');
				$('.weui-custom-pop').removeClass('weui-dialog--visible');
			});
	
			$('#i0').click(function(){
				$('.weui-mask').addClass('weui-mask--visible');
				$('.weui-custom-pop').addClass('weui-dialog--visible');
				
			});
	</script>
	</body>
</html>