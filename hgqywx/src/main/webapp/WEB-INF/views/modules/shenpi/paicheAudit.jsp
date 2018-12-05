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
	<!--内容区-->
	<div class="weui-cells">
	  	<div class="weui-cell">
		    <div class="weui-cell__bd">
		      <p>${paiche.user.name }的派車</p>
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
		    <div class="weui-cell__ft"><fmt:formatDate value="${paiche.starttime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></div>
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
	<div class="timeline" style="background-color: white;">
	  	<ul>
	    <c:forEach items="${histoicFlowList}" var="act"  varStatus="status">
			<li class="timeline-item"> 
				<c:if test="${status.first==true}">
					<div class="timeline-item-head-first"> 
				  		<i class="weui_icon weui_icon_success_no_circle timeline-item-checked"></i> 
				  	</div> 
				</c:if>
				<c:if test="${status.first!=true}">
					<div  class="timeline-item-head"> 
				   		<i class="weui_icon weui_icon_success_no_circle timeline-item-checked hide" ></i> 
				   	</div> 
				</c:if>
			   	<div class="timeline-item-tail" ></div> 
			   	<div class="timeline-item-content"> 
			   		<h4>${act.assigneeName}&nbsp;&nbsp;&nbsp;&nbsp;[${act.histIns.activityName}]</h4> 
			   		<c:if test="${status.first!=true}">
			   			<p>开始时间:<fmt:formatDate value="${act.histIns.startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;</p> 
			   		</c:if>
			   		<c:if test="${status.last!=true}">
			   			<p>结束时间:<fmt:formatDate value="${act.histIns.endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;${act.comment}</p> 
			   		</c:if>
			   	</div> 
		   	</li>
		</c:forEach>
		</ul>
  </div>
  	<form:form id="inputForm" modelAttribute="paiche" action="${ctx}/shenpi/paiche/saveAudit" method="post" class="form-horizontal">
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
			<button class="weui_footer_p1" type="submit" id="tongyi"  onclick="$('#status').val('同意');$('#flag').val('1')" href="${ctx }/shenpi/qingjia/saveAudit">同意</a>
			<button class="weui_footer_p2" type="submit" id="jujue"  onclick="$('#status').val('拒绝');$('#flag').val('2')" href="${ctx }/shenpi/qingjia/saveAudit">拒绝</a>
			<c:if test="${not empty isBack}">
				<button class="weui_footer_p3" type="submit" id="bohui"  onclick="$('#status').val('驳回');$('#flag').val('3')" href="${ctx }/shenpi/qingjia/saveAudit">驳回</a>
			</c:if>
			<button class="weui_footer_p4" type="submit" id="zhuanshen" onclick="$('#status').val('转审');$('#flag').val('4')" href="${ctx }/shenpi/qingjia/saveAudit">转审</a>
		</div>
  	</div>
  	<!--弹出页面-->
    <div id="half" class="weui-popup__container" >
        <div class="weui-popup__overlay"></div>
        <div class="weui-popup__modal" id="app">
            <!--头部导航-->
            <div class="header">
                <a  class="img_left" id="aaa">
                    <img src="${ctxStatic}/weui/img/xiangzuo.png" />
                </a>
                <p>选择人员</p>
            </div>
            <!--内容区..........列表-->
            <div class="nav-ml">
                <ul class="nav-first" style="margin-left: 0;" v-for="one in list">
                    <li>
                        <div class="weui-cell item-1" id="item1">
                            <div class="weui-cell__hd"><img src="${ctxStatic}/weui/img/bumen.png" width="20" height="20"></div>
                            <div class="weui-cell__bd">
                                <p>{{one.name}}</p>
                            </div>
                        </div>
                        <ul class="nav-second fold">
                            <li v-for="two in one.children">
                                <div class="weui-cell item-2" id="item2">
                                    <div class="weui-cell__hd"><img src="${ctxStatic}/weui/img/bumen.png" width="20" height="20"></div>
                                    <div class="weui-cell__bd">
                                        <p>{{two.name}}</p>
                                    </div>
                                </div>
                                <ul class="nav-three fold">
                                    <li v-for="three in two.children">
                                        <div class="weui-cell item-3" id="item3">
                                            <div class="weui-cell__hd"><img src="${ctxStatic}/weui/img/bumen.png" width="20" height="20"></div>
                                            <div class="weui-cell__bd" id="rclick">
                                                <p>{{three.name}}</p>
                                                <span style="display: none;">{{three.id}}</span>    	
                                            </div>
                                        </div>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
                </li>
                </ul>
            </div>
            <input type="hidden" id="approve" name="approve" value="${paiche.approve }"/>
        </div>
    </div>
  	</form:form>
  	<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js" ></script>
	<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js" ></script>
	<script>
	
		/* 选择抄送人 */
		$(document).on("click", "#rclick", function() {
			var nid = $(this).children("span").text();
			var name = $(this).children("p").text();
			document.getElementById("approve").value = nid;
			console.log(nid);
			console.log(name);
			$.confirm("您确定要转审到" + name + "吗？", "确认转审?", function() {
				$('#status').val('转审');
				$('#flag').val("4");
				$("#inputForm").submit();
				$.toast("已转审!");
				$.closePopup("#half");
			}, function() {
				//取消操作
			});
		});
		//选择人员json数据
		var vue = new Vue({
			el : '#app',
			data : {
				list : []
			}
		});
		$.ajax({
			type : "get",
			url : '${ctx}/sys/office/treejson',
			async : false,
			success : function(data) {
				vue.list = data;
				console.log(data);
			}
		});
		//人员列表伸缩
		$(document).on("click", "#item1", function() {
			$(this).parent().find(".nav-second").slideToggle(500);
			$(this).children("i").toggleClass("unfold");
		});
		$(document).on("click", "#item2", function() {
			$(this).parent().find(".nav-three").slideToggle(500);
			$(this).children("i").toggleClass("unfold");
		});
		$(document).on("click", "#item3", function() {
			$(this).parent().find(".nav-four").slideToggle(500);
			$(this).children("i").toggleClass("unfold");
		});
		/* 选择人员 */
		$(function() {
			var txiang = $("#txiang").attr("src");
			function djclick() {
				var txiang = $("#txiang").attr("src");
				console.log(txiang);
				var tupian = $('<img src="'+txiang+'" width="50px" height="50px"/>');
				$("#tspan").append(tupian);
				$.closePopup("#half");
				$("#item1").parent().find(".nav-second").slideUp(100);
				$("#item2").parent().find(".nav-three").slideUp(100);
			}

			$('.weui-cells_checkbox')
					.on(
							'touchstart',
							function() {
								var txiang = $("#txiang").attr("src");
								console.log(txiang);
								var tupian = $('<img src="'+txiang+'" width="50px" height="50px"/>');
								$("#tspan").append(tupian);
								$.closePopup("#half");
							});
		});
		/*  */
		$('.accordion-tit').click(function() {
			$parent = $(this).parent('li');
			if ($parent.hasClass('cur')) {
				$parent.removeClass('cur');
				$parent.siblings().removeClass('cur');
			} else {
				$parent.addClass('cur');
				$parent.siblings().removeClass('cur');
			}
		});

		$(document).on("click", "#tongyi", function() {
			$('#status').val('同意');
			var dshenpi = $("#dshenpi").html("已审批");
			// var yijian =$("#yijian").val();
			// $("#yijian_p").html(yijian);
			// $("#spyijian").hide();
			$.toast("审批完成");
		});
		$(document).on("click", "#bohui", function() {
			$('#status').val('驳回');
			var dshenpi = $("#dshenpi").html("已驳回");
			// var yijian =$("#yijian").val();
			// $("#yijian_p").html(yijian);
			// $("#spyijian").hide();
			$.toast("审批完成");
		});
		$(document).on("click", "#zhuanshen", function() {
			$("#half").popup();
			$('#status').val('转审');
			$('#flag').val("4");
			var dshenpi = $("#dshenpi").html("已转审");
		});
		$(document).on("click", "#aaa", function() {
			$.closePopup("#half");
			//        $.toast("绑定成功!",1000); 
		});
	</script>
  	
</body>
</html>