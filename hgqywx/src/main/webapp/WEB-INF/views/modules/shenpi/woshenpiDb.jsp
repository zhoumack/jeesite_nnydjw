<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>我审批</title>
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
	<div class="weui-tab">
	  <div class="weui-navbar">
	    <a class="weui-navbar__item tab-blue" href="${ctx }/shenpi/wode?dbOrYb=true">
	      待办
	    </a>
	    <a class="weui-navbar__item" href="${ctx }/shenpi/wode?dbOrYb=false">
	      已办
	    </a>
	  </div>
	  <div class="weui-tab__bd"  style="padding-top:50px">
	  
	    <%-- <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
			<div class="weui-panel weui-panel_access">
			    <a href="${ctx}/shenpi/dbxq" class="weui-media-box weui-media-box_appmsg">
				    <div class="weui-media-box__hd">
				    	<img class="weui-media-box__thumb" src="${ctxStatic}/weui/img/chuchai.png">
				    </div>
			        <div class="weui-media-box__bd">
			        	<h4 class="weui-media-box__title">黄蓉的出差</h4>
			        	<p class="weui-media-box__desc">查看详情</p>
			        </div>
			        <span class="weui-cell__ft">2018-07-19</span>
			    </a>
			</div>
	    </div>
	    <div id="tab2" class="weui-tab__bd-item">
	     	<div class="weui-panel weui-panel_access">
			    <a href="${ctx}/shenpi/ybxq" class="weui-media-box weui-media-box_appmsg">
				    <div class="weui-media-box__hd">
				    	<img class="weui-media-box__thumb" src="${ctxStatic}/weui/img/qingjia.png">
				    </div>
			        <div class="weui-media-box__bd">
			        	<h4 class="weui-media-box__title">杨过的请假</h4>
			        	<p class="weui-media-box__desc">查看详情</p>
			        </div>
			        <span class="weui-cell__ft">2018-07-19</span>
			    </a>
			</div>
	    </div> --%>
	    <c:forEach items="${list}" var="act">
				<c:set var="task" value="${act.task}" />
				<c:set var="vars" value="${act.vars}" />
				<c:set var="procDef" value="${act.procDef}" /><%--
				<c:set var="procExecUrl" value="${act.procExecUrl}" /> --%>
				<c:set var="status" value="${act.status}" />
				<c:set var="isClaim" value="javascript:claim('${task.id}');" />
				<c:set var="isDone" value="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}" />
				<%-- <c:out value="${isDone}"/>
				<c:out value="${isClaim}"/> --%>
				<div  class="weui-tab__bd-item weui-tab__bd-item--active">
					<div class="weui-panel weui-panel_access">
					    <a href="${empty task.assignee?isClaim:isDone}" class="weui-media-box weui-media-box_appmsg">
						    <div class="weui-media-box__hd">
						    	<img class="weui-media-box__thumb" src="${ctxStatic}/weui/img/yongzhang.png">
						    </div>
					        <div class="weui-media-box__bd">
					        	<h4 class="weui-media-box__title">${vars.map.title}</h4>
					        	<p class="weui-media-box__desc">查看详情</p>
					        </div>
					        <span class="weui-cell__ft"><fmt:formatDate value="${task.createTime}" type="both" pattern="yyyy-MM-dd HH"/></span>
					    </a>
					</div>
			    </div>
		</c:forEach>
	  </div>
	</div>
	<!--底部导航-->
    <div class="footer">
		<div class="footer_dv pr">
			<a href="${ctx}/shenpi/list">
				<img class="footer_dv_img" src="${ctxStatic}/weui/img/new1.png" />
				<p class="footer_dv_p">新申请</p>
			</a>
		</div>
		<div class="footer_dv pr">
			<a href="${ctx}/shenpi/wode">
				<img class="footer_dv_img" src="${ctxStatic}/weui/img/woshenpi.png" />
				<span class="weui-badge pa">5</span>
				<p class="footer_dv_p tab_color">我审批的</p>
			</a>
		</div>
		<div class="footer_dv pr">
			<a href="${ctx}/shenpi/yitijiao">
				<img class="footer_dv_img" src="${ctxStatic}/weui/img/tijiao.png" />
				<span class="weui-badge pa">3</span>
				<p class="footer_dv_p">已提交</p>
			</a>
		</div>
	</div>
	<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js" ></script>
	<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js" ></script>
</body>
</html>