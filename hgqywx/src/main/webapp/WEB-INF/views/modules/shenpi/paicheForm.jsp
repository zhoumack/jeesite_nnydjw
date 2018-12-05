<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <script type="text/javascript" src="${ctxStatic}/weui/js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js" ></script>
    <link rel="stylesheet" href="${ctxStatic}/weui/css/public.css" />
    <link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
    <link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
    <link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />
    <title>审批详情</title>
    <style> 
    	.weui_footer1{
    		background-color: white;margin-top: 10px;
    	}
    	.weui_footer2{
    		background-color: white;text-align:center;margin-top: 0px;
    		height: 30px;
    	}
    	.weui_footer_p1{
    		width: 25%;float: left;line-height: 30px;
    	}
    	.weui_footer_p2{
    		width: 25%;float: left;line-height: 30px;
    	}
    	.weui_footer_p3{
    		width: 25%;float: left;line-height: 30px;
    	}
    	.weui_footer_p4{
    		width: 25%;float: left;line-height: 30px;
    	}
    </style>
</head>
<body>
	<!--头部-->
	<div class="header">
		<a href="${ctx}/shenpi/wode" class="img_left">
			<img src="${ctxStatic}/weui/img/xiangzuo.png" />
		</a>
		<p>审批详情</p>
	</div>
	<form:form id="inputForm" modelAttribute="paiche" action="${ctx}/shenpi/paiche/save" method="post" class="form-horizontal">
	<!--内容区-->
	<div class="weui-cells">
	  	<div class="weui-cell">
		    <div class="weui-cell__bd">
		      <p>${paiche.user.name }的派车申请</p>
		    </div>
	  	</div>
	  	<div class="weui-cell">
		    <div class="weui-cell__bd">
		      <p>部门</p>
		    </div>
		    <div class="weui-cell__ft">${paiche.user.office.name}</div>
	  	</div>
	</div>
	<div class="weui-cells">
	  	<!-- <div class="weui-cell">
		    <div class="weui-cell__bd">
		      <p>出差地点</p>
		    </div>
		    <div class="weui-cell__ft">上海</div>
	  	</div> -->
	   	<div class="weui-cell">
		    <div class="weui-cell__bd">
		      <p>类型</p>
		    </div>
		    <div class="weui-cell__ft">${paiche.type}</div>
	  	</div>
	   	<div class="weui-cell">
		    <div class="weui-cell__bd">
		      <p>用车时间</p>
		    </div>
		    <div class="weui-cell__ft"><fmt:formatDate value="${paiche.starttime}" type="both" pattern="yyyy-MM-dd HH:mm"/></div>
	  	</div>
	  	<div class="weui-cell">
		    <div class="weui-cell__bd">
		      <p>用车地点</p>
		    </div>
		    <div class="weui-cell__ft">${paiche.startplace}</div>
	  	</div>
	  	<div class="weui-cell">
		    <div class="weui-cell__bd">
		      <p>驾驶员</p>
		    </div>
		    <div class="weui-cell__ft">${paiche.driver}</div>
	  	</div>
	  	<div class="weui-cell">
	  		<div class="weui-cell__bd">
		      <p>用车人数</p>
		    </div>
		    <div class="weui-cell__ft">${paiche.pnums }</div>
	  	</div>
	  	<a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
	      <div class="weui-media-box__bd">
	        <h4 class="weui-media-box__title">事由</h4>
	        <p class="weui-media-box__desc">${paiche.event }</p>
	      </div>
	    </a>
	</div>
	
  
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
	      <input class="weui-input" type="text" name="act.comment"  value="${paiche.remarks }">
		</div>
		<%-- <div class="weui-cell weui_footer2"> 
			<button class="weui_footer_p1" type="submit" id="tongyi"  onclick="$('#status').val('同意');$('#flag').val('1')" href="${ctx }/shenpi/qingjia/saveAudit">同意</a>
			<button class="weui_footer_p2" type="submit" id="jujue"  onclick="$('#status').val('拒绝');$('#flag').val('2')" href="${ctx }/shenpi/qingjia/saveAudit">拒绝</a>
			<button class="weui_footer_p3" type="submit" id="bohui"  onclick="$('#status').val('驳回');$('#flag').val('3')" href="${ctx }/shenpi/qingjia/saveAudit">驳回</a>
			<button class="weui_footer_p4" type="submit" id="zhuanshen" onclick="$('#status').val('转审');$('#flag').val('4')" href="${ctx }/shenpi/qingjia/saveAudit">转审</a>
		</div> --%>
  	</div>
  	<act:histoicMobileFlowList procInsId="${paiche.act.procInsId}" />
  	</form:form>
  	
	<script>
		$(document).on("click", "#tongyi", function() {
			$('#status').val('同意');
			 var dshenpi =$("#dshenpi").html("已审批");
			// var yijian =$("#yijian").val();
			// $("#yijian_p").html(yijian);
			// $("#spyijian").hide();
	        $.toast("审批完成");
	    });
	    $(document).on("click", "#bohui", function() {
	    	$('#status').val('驳回');
			 var dshenpi =$("#dshenpi").html("已驳回");
			// var yijian =$("#yijian").val();
			// $("#yijian_p").html(yijian);
			// $("#spyijian").hide();
	        $.toast("审批完成");
	    });
	</script>
  	
</body>
</html>