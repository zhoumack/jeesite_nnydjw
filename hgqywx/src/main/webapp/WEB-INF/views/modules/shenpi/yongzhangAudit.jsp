<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js" ></script>
	<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js" ></script>
<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/style.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />
<title>用章</title>
<style>
.weui_footer1 {
	background-color: white;
	margin-top: 10px;
}

.weui_footer2 {
	background-color: white;
	text-align: center;
	margin-top: 0px;
	height: 30px;
}

.weui_footer_p1 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p2 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p3 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p4 {
	width: 25%;
	float: left;
	line-height: 30px;
}

#txiang {
	padding-left: 20px;
}
.item {
	cursor: pointer;
}

ul {
	padding-left: 1em;
	line-height: 1.5em;
	list-style: none;
	color: #2d2828;
}
</style>
</head>
<body>
	<!--头部-->
	<div class="header">
		<a href="${ctx}/shenpi" class="img_left"> <img
			src="${ctxStatic}/weui/img/xiangzuo.png" />
		</a>
		<p>审批详情</p>
	</div>
	<!--内容区-->
	<div class="weui-cells">
		<div class="weui-cell">
			<div class="weui-cell__bd">
				<p>${yongzhang.user.name}的用章申请</p>
			</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__bd">
				<p>部门</p>
			</div>
			<div class="weui-cell__ft">${yongzhang.user.office.name}</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__bd">
				<p>用章类型</p>
			</div>
			<div class="weui-cell__ft">${yongzhang.type}</div>
		</div>
	</div>
	<div class="weui-cells">
		<div class="weui-cell">
			<div class="weui-cell__bd">
				<p>文件名称</p>
			</div>
			<div class="weui-cell__ft">${yongzhang.filename}</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__bd">
				<p>文件数量</p>
			</div>
			<div class="weui-cell__ft">${yongzhang.filenums}</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__bd">
				<p>文件份数</p>
			</div>
			<div class="weui-cell__ft">${yongzhang.copynums}</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__bd">
				<p>存档份数</p>
			</div>
			<div class="weui-cell__ft">${yongzhang.savenums}</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__bd">
				<p>用印时间</p>
			</div>
			<div class="weui-cell__ft"><fmt:formatDate value="${yongzhang.date}" type="both" pattern="yyyy-MM-dd"/></div>
		</div>
		
		<a href="javascript:void(0);"
		class="weui-media-box weui-media-box_appmsg">
		<div class="weui-media-box__bd">
			<h4 class="weui-media-box__title">事由</h4>
			<p class="weui-media-box__desc">${yongzhang.event}</p>
		</div>
	</a>
	</div>
	
	<div class="timeline" style="background-color: white;">
		<ul>
			<c:forEach items="${histoicFlowList}" var="act" varStatus="status">
				<li class="timeline-item"><c:if test="${status.first==true}">
						<div class="timeline-item-head-first">
							<i
								class="weui_icon weui_icon_success_no_circle timeline-item-checked"></i>
						</div>
					</c:if> <c:if test="${status.first!=true}">
						<div class="timeline-item-head">
							<i
								class="weui_icon weui_icon_success_no_circle timeline-item-checked hide"></i>
						</div>
					</c:if>
					<div class="timeline-item-tail"></div>
					<div class="timeline-item-content">
						<h4>${act.assigneeName}&nbsp;&nbsp;&nbsp;&nbsp;[${act.histIns.activityName}]</h4>
						<c:if test="${status.first!=true}">
							<p>
								开始时间:
								<fmt:formatDate value="${act.histIns.startTime}" type="both"
									pattern="yyyy-MM-dd HH:mm:ss" />
								&nbsp;&nbsp;
							</p>
						</c:if>
						<c:if test="${status.last!=true}">
							<p>
								结束时间:
								<fmt:formatDate value="${act.histIns.endTime}" type="both"
									pattern="yyyy-MM-dd HH:mm:ss" />
								&nbsp;&nbsp;${act.comment}
							</p>
						</c:if>
					</div></li>
			</c:forEach>
		</ul>
	</div>
	<form:form id="inputForm" modelAttribute="yongzhang" action="${ctx}/shenpi/yongzhang/saveAudit" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="act.taskId"/>
		<form:hidden path="act.taskName"/>
		<form:hidden path="act.taskDefKey"/>
		<form:hidden path="act.procInsId"/>
		<form:hidden path="act.procDefId"/>
		<form:hidden path="status"/>
		<form:hidden id="flag" path="act.flag"/>
		<div id="spyijian">
  		<div class="weui-cell weui_footer1"> 
	      <input class="weui-input" type="text" name="act.comment"   placeholder="审批意见">
		</div>
		 <div class="weui-cell weui_footer2"> 
			<button class="weui_footer_p1" type="submit" id="tongyi"  onclick="$('#status').val('同意');$('#flag').val('1')" href="${ctx }/shenpi/yongzhang/saveAudit">同意</a>
			<button class="weui_footer_p2" type="submit" id="jujue"  onclick="$('#status').val('拒绝');$('#flag').val('2')" href="${ctx }/shenpi/yongzhang/saveAudit">拒绝</a>
			<c:if test="${not empty isBack}">
				<button class="weui_footer_p3" type="submit" id="bohui"  onclick="$('#status').val('驳回');$('#flag').val('3')" href="${ctx }/shenpi/yongzhang/saveAudit">驳回</a>
			</c:if>
			<button class="weui_footer_p4" type="submit" id="zhuanshen" onclick="$('#status').val('转审');$('#flag').val('4')" href="${ctx }/shenpi/yongzhang/saveAudit">转审</a>
		</div>
  	</div>
</form:form>	
</body>
</html>