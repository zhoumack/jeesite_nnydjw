<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	    <title>任务安排</title>
	    <link rel="stylesheet" href="${ctxStatic}/weui/css/public.css" />
	    <link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
	    <link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
	    <script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
		<script type="text/javascript"src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
		<script type="text/javascript" src="${ctxStatic}/weui/js/zepto.min.js"></script>
		<script type="text/javascript" src="${ctxStatic}/weui/js/vue.min.js"></script>
		<script type="text/javascript" src="${ctxStatic}/weui/js/common.js"></script>
	</head>
	<body bgcolor="#f5f5f5">
		<!--头部导航-->
		<div class="header">
			<a href="${ctx}/main/rwap" class="img_left">
				<img src="${ctxStatic}/weui//img/xiangzuo.png" />
			</a>
			<p>发布任务</p>
		</div>
		<!--内容区-->
		<form:form id="form" modelAttribute="renwu"
			action="${ctx}/task/renwu/save" method="post">
		<!--内容区..........列表-->
		<div class="weui-cells weui-cells_form">
	  		<div class="weui-cell">
			    <div class="weui-cell__hd"><label class="weui-label">任务主题</label></div>
			    <div class="weui-cell__bd">
			      <input class="weui-input" type="text" name="theme" value="${renwu.theme}" placeholder="请输入">
			  	</div>
		    </div>
		    <div class="weui-cell">
			    <div class="weui-cell__hd"><label class="weui-label">负责人</label></div>
			    <div class="weui-cell__bd">
			      <input class="weui-input" type="text" name="userName" value="${renwu.userName }"  placeholder="请输入">
			  	</div>
		    </div>
		    <div class="weui-cell">
                <div class="weui-cell__hd">
                	<label for="" class="weui-label">
                		开始时间
                		<img src="${ctxStatic}/weui/img/xinghao.png"  width="8" height="8" class="f_padding pr10" /> 
                	</label>
                </div>
                <div class="weui-cell__bd">
                    <input id="star" class="weui-input" name="starttime"  value="${renwu.starttime }" placeholder="请选择" required emptyTips="请选择开始时间" notMatchTips="请选择"/>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd">
                	<label for="" class="weui-label">
                		结束时间
                		<img src="${ctxStatic}/weui/img/xinghao.png" width="8" height="8" class="f_padding pr10" />
                	</label>
                </div>
                <div class="weui-cell__bd">
                    <input  id="end" class="weui-input" name="endtime" value="${renwu.endtime }"  placeholder="请选择"/>
                </div>
            </div>
		    <div class="weui-cell">
			    <div class="weui-cell__hd"><label class="weui-label">任务时长</label></div>
			    <div class="weui-cell__bd">
			      <p id="lengtime"></p> 
			  	</div>
		    </div>
	    </div>
	    <div class="weui-cells__title">内容安排</div>
		<div class="weui-cells weui-cells_form">
		  <div class="weui-cell">
		    <div class="weui-cell__bd">
		      <textarea class="weui-textarea" id="weui-textarea" name="plan"  placeholder="请输入内容">${renwu.plan }</textarea>
		      <div class="weui-textarea-counter"></div>
		    </div>
		  </div>
		</div>
		<a href="xuanzetuisongren.html" class="weui-media-box weui-media-box_appmsg weui-cells">
	      <div class="weui-media-box__bd">
	        <h4 class="weui-media-box__title">推送人</h4>
	        <p class="weui-media-box__desc">
	        	<span>
	        		<img src="${ctxStatic}/weui/img/tianjia.png" width="70px" height="70px"/>
	        	</span>
	        	<img src="${ctxStatic}/weui/img/tianjia.png" width="70px" height="70px"/>
	        </p>
	      </div>
	    </a>
	    <a href="${ctx}/task/renwu/save" class="btn_div"> 
	     	<button id="btn" type="submit">提交</button>
	    </a>
	    </form:form>
	    <script type="text/javascript" src=".${ctxStatic}/weui/js/jquery.min.js" ></script>
	    <script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js" ></script>
	    <script type="text/javascript">
	    	var stime;
	    	$("#star").change(function(){
			    var jtime= $("#star").val();
			    stime = jtime.replace(/-/g,"/"); 
			});
			 var etime,min;
			 var lengtime =$("#lengtime");
			$("#end").change(function(){
			    $("#end").attr("value",$(this).val());
			    console.log(stime);
			    var vtime= $("#end").val();
			    etime = vtime.replace(/-/g,"/");
			    min =Math.round(parseInt(new Date(etime )- new Date(stime)) / 1000 / 60)
			    var d=parseInt(min/60/24);
			    var h=parseInt(min/60%24);
				var m=parseInt(min% 60);
				lengtime.html(d+"天" +h+"小时"+m+"分钟");
			});
			//开始时间
	      $("#star").datetimePicker({
			        title: '开始时间',
			        min: "1990-12-12",
			        max: "2022-12-12 12:12",
			        onChange: function (picker, values, displayValues) {
		        }
		      });
	      //结束时间
	      $("#end").datetimePicker({
			        title: '结束时间',
			        min: "1990-12-12",
			        max: "2022-12-12 12:12",
			        onChange: function (picker, values, displayValues) {
			        }
			      });
	    </script>
	</body>
</html>