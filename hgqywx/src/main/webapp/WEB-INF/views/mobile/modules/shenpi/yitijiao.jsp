<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>已提交</title>
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
   	<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css">
	<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css">
	<script type="text/javascript" href="${ctxStatic}/weui/js/zepto.min.js"></script>
	<style>
	   	.weui-grid:before{
    		border: none;
    	}
    	.weui-grid:after{
    		border: none;
    	}
   </style>
</head>
<body>
	<!--头部-->
	<div class="header">
		<a href="${ctx}/main/index" class="img_left">
			<img src="${ctxStatic}/weui/img/xiangzuo.png" />
		</a>
		<p>审批</p>
	</div>
	<!--内容区-->
	<!--搜索框-->
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
	<!--列表-->
	<%-- <div class="weui-panel weui-panel_access">
	    <a href="${ctx}/shenpi/ytxq" class="weui-media-box weui-media-box_appmsg">
		    <div class="weui-media-box__hd">
		    	<img class="weui-media-box__thumb" src="${ctxStatic}/weui/img/qingjia.png">
		    </div>
	        <div class="weui-media-box__bd">
	        	<h4 class="weui-media-box__title">杨过的请假</h4>
	        	<p class="weui-media-box__desc">查看详情</p>
	        </div>
	        <span class="weui-cell__ft">2018-07-19</span>
	    </a>
	</div> --%>
	 <c:forEach items="${list}" var="shenpi">
				<div  class="weui-tab__bd-item weui-tab__bd-item--active">
					<div class="weui-panel weui-panel_access">
					    <a href="${ctx}/shenpi/${shenpi.getClass().getSimpleName().toLowerCase()}/form?id=${shenpi.id}&act.taskDefKey=modify&act.procInsId=${shenpi.act.procInsId}" class="weui-media-box weui-media-box_appmsg">
						    <div class="weui-media-box__hd">
						    	<img class="weui-media-box__thumb" src="${ctxStatic}/weui/img/${shenpi.getClass().getSimpleName().toLowerCase()}.png">
						    </div>
					        <div class="weui-media-box__bd">
					        	<h4 class="weui-media-box__title">${shenpi.user.name }</h4>
					        	<p class="weui-media-box__desc">查看详情</p>
					        </div>
					        <span class="weui-cell__ft"><fmt:formatDate value="${task.createTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					    </a>
					</div>
			    </div>
		</c:forEach>
	<!--底部导航-->
    <div class="footer">
		<div class="footer_dv">
			<a href="${ctx}/shenpi/list">
				<img class="footer_dv_img" src="${ctxStatic}/weui/img/new1.png" />
				<p class="footer_dv_p">新申请</p>
			</a>
		</div>
		<div class="footer_dv pr">
			<a href="${ctx}/shenpi/wode">
				<img class="footer_dv_img" src="${ctxStatic}/weui/img/woshenpi1.png" />
				<span class="weui-badge pa">5</span>
				<p class="footer_dv_p">我审批的</p>
			</a>
		</div>
		<div class="footer_dv pr">
			<a href="${ctx}/shenpi/yitijiao">
				<img class="footer_dv_img" src="${ctxStatic}/weui/img/tijiao1.png" />
				<span class="weui-badge pa">3</span>
				<p class="footer_dv_p tab_color">已提交</p>
			</a>
		</div>
	</div>
	<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js" ></script>
	<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js" ></script>
	<script>
		var length = $(".weui-panel_access").length;
		$(".pa").html(length);
	</script>
</body>
</html>