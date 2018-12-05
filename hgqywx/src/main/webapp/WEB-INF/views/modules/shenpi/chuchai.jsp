<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>出差</title>
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
   	<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css">
	<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css">
	<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css">
	<link rel="stylesheet" href="${ctxStatic}/weui/css/style.css">
	<script type="text/javascript" src="${ctxStatic}/weui/js/vue.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/weui/js/common.js"></script>  
	<style type="text/css">
		* { touch-action: pan-y; } 
        .weui-cells_checkbox .weui-check:checked+.weui-icon-checked:before{
        	color: #4187FA;
        }
        ul,li,i{ list-style:none; padding:0; margin:0; font-style:normal;}
		i{ width:14px; height:14px; float:left;}
		.box{ width:100%; max-width:300px; margin:0 auto;}
		.nav-ml{ width:100%; background: white;}
		.nav-ml ul{ margin-left:20px;}
		.nav-ml a{display:block; font-size:14px; height:20px; padding:3px 0; color:#666; overflow:hidden;}
		.nav-first,.nav-second,.nav-three,nav-four{ margin-left:20px;}
		.fold{ display:none;}
		#txiang{
			padding-left:20px;
		}
	</style>
	
</head>
<body>
	<!--头部-->
	<div class="header">
		<a href="${ctx}/shenpi" class="img_left">
			<img src="${ctxStatic}/weui/img/xiangzuo.png" />
		</a>
		<p>出差</p>
	</div>
	<!--内容区-->
	<form:form id="form" modelAttribute="chuchai" action="${ctx}/shenpi/chuchai/save" method="post">
		<form:hidden path="id"/>
		<form:hidden path="act.taskId"/>
		<form:hidden path="act.taskName"/>
		<form:hidden path="act.taskDefKey"/>
		<form:hidden path="act.procInsId"/>
		<form:hidden path="act.procDefId"/>
		<form:hidden path="user.id"/>
		<form:hidden id="flag" path="act.flag"/>
	<div class="weui-cells weui-cells_form">
  		<div class="weui-cell">
			    <div class="weui-cell__hd">
			    	<label class="weui-label">
			    	申请人
			    	<img src="${chuchai.user.photo}" width="8" height="8" class="f_padding pr10" />
			    	</label>
			    </div>
			    <div class="weui-cell__bd">
			      <input class="weui-input" type="text"  name="userName"  value="${chuchai.userName}" required placeholder="请输入" emptyTips="请输入姓名" notMatchTips="请输入正确的姓名">
			  	</div>
			  	<div class="weui_cell_ft">
	                <i class="weui_icon_warn"></i>
	            </div>
		    </div>
	    <div class="weui-cell">
		    <div class="weui-cell__hd"><label class="weui-label">出差地点</label></div>
		    <div class="weui-cell__bd">
		      <input class="weui-input" type="text" id="direct" name="direction" value="${chuchai.direction}"  placeholder="请输入">
		  	</div>
	    </div>
	    <div class="weui-cell">
		    <div class="weui-cell__hd"><label for="" class="weui-label">开始时间</label></div>
		    <div class="weui-cell__bd">
		      <input class="weui-input" id="star" value="<fmt:formatDate value="${chuchai.starttime}" type="both" pattern="yyyy-MM-dd"/>" name="starttime" placeholder="请选择开始时间" required emptyTips="请选择开始时间" notMatchTips="请选择"/>
		    </div>
	    </div>
	    <div class="weui-cell">
		    <div class="weui-cell__hd"><label for="" class="weui-label">结束时间</label></div>
		    <div class="weui-cell__bd">
		      <input class="weui-input" id="end" value="<fmt:formatDate value="${chuchai.endtime}" type="both" pattern="yyyy-MM-dd"/>" name="endtime" placeholder="请选择结束时间" required emptyTips="请选择开始时间" notMatchTips="请选择"/>
		    </div>
	    </div>
    </div>
    <div class="weui-cells__title">出差事由</div>
	<div class="weui-cells weui-cells_form">
	  <div class="weui-cell">
	    <div class="weui-cell__bd">
	      <textarea class="weui-textarea" id="weui-textarea" value="${chuhai.event}" name="event"  placeholder="请输入内容"></textarea>
	      <div class="weui-textarea-counter"></div>
	    </div>
	  </div>
	</div>
	<a href="xuanzetuisongren.html" class="weui-media-box weui-media-box_appmsg weui-cells">
      <div class="weui-media-box__bd">
	        <h4 class="weui-media-box__title">
	        	审批人
	        	<img src="${ctxStatic}/weui/img/xinghao.png" width="8" height="8" class="${ctxStatic}/weui/img_padding" />
	        	<span class="zhushi_c">
	        		（已由管理员预设不可修改）
	        	</span>
	        </h4>
	        <p class="weui-media-box__desc">
	        	<img src="${ctxStatic}/weui/img/touxiang.jpg" width="50px" height="50px"/>
	        </p>
	      </div>
    </a>
		<a class="weui-media-box weui-media-box_appmsg weui-cells">
			<div class="weui-media-box__bd">
				<h4 class="weui-media-box__title">抄送人</h4>
				<p class="weui-media-box__desc">
					<span id="tid" style="position: relative;"> </span> 
					<img class="open-popup" id="abc" src="${ctxStatic}/weui/img/tianjia.png" width="60px" height="60px" />
				</p>
			</div>
		</a>
		<c:if test="${chuchai.status=='驳回' }">
		    <div class="weui-cell weui_footer1"> 
		      <input class="weui-input" type="text" name="act.comment"   placeholder="审批意见">
			</div>
		</c:if>
	    <a href="#" class="btn_div" id="formSubmitBtn"> 
	    	<c:if test="${chuchai.status==null }">
	    			<button id="btn" type="submit" onclick="$('#flag').val('1')">提交</button>
	    	</c:if>
	    	<c:if test="${chuchai.status=='驳回' }">
	    			<button id="btn" type="submit" onclick="$('#flag').val('1')">出差审批</button>
	    	</c:if>
	    </a>
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
		<div class="timeline" style="background-color: white;">
	  	<ul>
	    <c:forEach items="${histoicFlowList}" var="act"  varStatus="status">
				<%-- <td>${act.histIns.activityName}</td>
				<td>${act.assigneeName}</td>
				<td><fmt:formatDate value="${act.histIns.startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${act.histIns.endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td style="word-wrap:break-word;word-break:break-all;">${act.comment}</td>
				<td>${act.durationTime}</td> --%>
			<li class="timeline-item"> 
				<c:if test="${status.first==true}">
					<div class="timeline-item-head-first"> 
				  		<i class="weui_icon weui_icon_success_no_circle timeline-item-checked"></i> 
				  	</div> 
				</c:if>
				<c:if test="${status.first==true}">
					<div  class="timeline-item-head"> 
				   		<i class="weui_icon weui_icon_success_no_circle timeline-item-checked hide" ></i> 
				   	</div> 
				</c:if>
			   	<div class="timeline-item-tail" ></div> 
			   	<div class="timeline-item-content"> 
			   		<h4>${act.assigneeName}</h4> 
			   		<p><fmt:formatDate value="${act.histIns.endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;${act.histIns.activityName}</p> 
			   	</div> 
		   	</li>
		</c:forEach>
		</ul>
  </div>
	</div>
   </div>
	</form:form >
    <script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js" ></script>
	<script type="text/javascript" src="${ctxStatic}/weui/js/common.js"></script>    
    <script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js" ></script>
    <script type="text/javascript">
	    $(document).on("click", "#abc", function () {
			var ctx="${ctx}";
			var ctxStatic="${ctxStatic}/weui/img/chahao.png";
	       	getcslist(ctx,ctxStatic);
	         
	    });
	    window.onload = function(){
			var star = $("#star");
			settime(star);
			var end = $("#end");
			settime(end);
		}
		function settime(obj) {
			$(obj).datetimePicker({
				dateFormat:'yyyy-MM-dd',
		        title: "选择时间",
		        min: "1990-12-12",
		        max: "2022-12-12 12:12",
		        onChange: function (picker, values, displayValues) {
		          console.log(values);
		        }
		      });
		}
		    /*  */
	 		function astrict(){
	        var tarea=document.getElementById("weui-textarea");
	        var maxlength=200;
	        var length=tarea.value.length;
	        var count=maxlength-length;
	
	        var sp=document.getElementById("astrict-sl");
	        sp.innerHTML=count;
	        if(count<=25){
	         sp.style.color="red";
	        }else{
	         sp.removeAttribute("style");
	        }
	     }
    </script>
</body>
</html>