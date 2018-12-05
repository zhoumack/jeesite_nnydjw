<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>请假</title>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css">
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css">
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css">
<link rel="stylesheet" href="${ctxStatic}/weui/css/style.css">
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/zepto.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/vue.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/common.js"></script>
<style type="text/css">
* {
	touch-action: pan-y;
}

.weui-cells_checkbox .weui-check:checked+.weui-icon-checked:before {
	color: #4187FA;
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
<body bgcolor="f8f8f8">
	<!--头部-->
	<div class="header">
		<a href="${ctx}/shenpi" class="img_left"> <img
			src="${ctxStatic}/weui/img/xiangzuo.png" />
		</a>
		<p>请假</p>
	</div>
	<!--内容区-->
	<form:form id="form" modelAttribute="qingjia"
		action="${ctx}/shenpi/qingjia/save" method="post">
		<form:hidden path="id" />
		<form:hidden path="act.taskId" />
		<form:hidden path="act.taskName" />
		<form:hidden path="act.taskDefKey" />
		<form:hidden path="act.procInsId" />
		<form:hidden path="act.procDefId" />
		<form:hidden path="user.id" />
		<form:hidden id="flag" path="act.flag" />
		<!--<sys:message content="${message}"/>-->
		<div class="weui-cells weui-cells_form">
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label"> 申请人 <img
						src="${qingjia.user.photo}" width="8" height="8"
						class="f_padding pr10" />
					</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="text" name="userName"
						value="${qingjia.userName}" required placeholder="请输入"
						emptyTips="请输入姓名" notMatchTips="请输入正确的姓名">
				</div>
				<div class="weui_cell_ft">
					<i class="weui_icon_warn"></i>
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label"> 请假类型 <img
						src="${ctxStatic}/weui/img/xinghao.png" width="8" height="8"
						class="f_padding pr10" />
					</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" name="type" type="text" id='qingjia'
						value="${qingjia.type}" placeholder="请输入" emptyTips="请选择"
						notMatchTips="请选择">
				</div>
			</div>
		</div>
		<div class="weui-cells weui-cells_form">
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label for="" class="weui-label"> 开始时间 <img
						src="${ctxStatic}/weui/img/xinghao.png" width="8" height="8"
						class="f_padding pr10" />
					</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" id="star"
						value="<fmt:formatDate value="${qingjia.starttime}" type="both" pattern="yyyy-MM-dd HH:mm"/>"
						name="starttime" placeholder="请选择" required emptyTips="请选择开始时间"
						notMatchTips="请选择" />
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label for="" class="weui-label"> 结束时间 <img
						src="${ctxStatic}/weui/img/xinghao.png" width="8" height="8"
						class="f_padding pr10" />
					</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" id="end" name="endtime"
						value="<fmt:formatDate value="${qingjia.endtime}" type="both" pattern="yyyy-MM-dd HH:mm"/>"
						placeholder="请选择" />
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">请假时长</label>
				</div>
				<div class="weui-cell__bd">
					<p id="lengtime"></p>
				</div>
			</div>
		</div>
		<div class="weui-cells__title">请假事由</div>
		<div class="weui-cells weui-cells_form">
			<div class="weui-cell">
				<div class="weui-cell__bd">
					<textarea class="weui-textarea" name="reason" id="weui-textarea"
						onkeyup="astrict()" placeholder="请输入200字以内" maxlength="200"
						rows="3">${qingjia.reason }</textarea>
					<div class="weui-textarea-counter">
						<span id="astrict-sl">0</span>/200
					</div>
				</div>
			</div>
		</div>
		</div>
		<a class="weui-media-box weui-media-box_appmsg weui-cells">
			<div class="weui-media-box__bd">
				<h4 class="weui-media-box__title">
					审批人 <img src="${ctxStatic}/weui/img/xinghao.png" width="8"
						height="8" class="${ctxStatic}/weui/img_padding" /> <span
						class="zhushi_c"> （已由管理员预设不可修改） </span>
				</h4>
				<p class="weui-media-box__desc">
					<img src="${ctxStatic}/weui/img/touxiang.jpg" width="50px"
						height="50px" />
				</p>
			</div>
		</a>
		<a class="weui-media-box weui-media-box_appmsg weui-cells">
			<div class="weui-media-box__bd">
				<h4 class="weui-media-box__title">抄送人</h4>
				<p class="weui-media-box__desc">
					<span id="tid" style="position: relative;"> </span> <img
						class="open-popup" id="abc"
						src="${ctxStatic}/weui/img/tianjia.png" width="60px" height="60px" />
				</p>
			</div>
		</a>
		<c:if test="${qingjia.status=='驳回' }">
			<div class="weui-cell weui_footer1">
				<input class="weui-input" type="text" name="act.comment"
					placeholder="审批意见">
			</div>
		</c:if>
		<a href="#" class="btn_div" id="formSubmitBtn"> <c:if
				test="${qingjia.status==null }">
				<button id="btn" type="submit" onclick="$('#flag').val('1')">提交</button>
			</c:if> <c:if test="${qingjia.status=='驳回' }">
				<button id="btn" type="submit" onclick="$('#flag').val('1')">请假审批</button>
			</c:if>
		</a>
		<!--弹出页面 ${ctxStatic}/weui/-->
		<div id="half" class="weui-popup__container">
			<div class="weui-popup__overlay"></div>
			<div class="weui-popup__modal" id="app">
				<!--头部导航-->
				<div class="header">
					<a class="img_left" id="aaa"> <img
						src="${ctxStatic}/weui/img/xiangzuo.png" />
					</a>
					<p>选择人员</p>
				</div>
				<!--内容区..........列表-->
				<script type="text/x-template" id="item-template">
				<li>
					<div :class="{bold: isFolder}" @click="toggle" @dblclick="changeType">
						<img src="${ctxStatic}/weui/img/bumen.png" width="20" height="20">
						<span>{{ model.name }}</span>
						<p style="display: none;">{{ model.id }}</p>
						<span v-if="isFolder">[{{ open ? '-' : '+' }}]</span>
					</div>
					<ul v-show="open" v-if="isFolder">
						<item class="item" v-for="(model, index) in model.children" :key="index" :model="model"></item>
					</ul>
				</li>
			</script>
				<ul id="demo">
					<item class="item" :model="treeData"></item>
				</ul>
				<act:histoicMobileFlowList procInsId="${qingjia.act.procInsId}" />
			</div>
		</div>
	</form:form>
	<script type="text/javascript" src="${ctxStatic}/weui/js/common.js"></script>
	<script type="text/javascript">
	    var ctx="${ctx}";
	    var imgurl="${ctxStatic}/weui/img/chahao.png";
	    getcslist(ctx ,imgurl);
/* 	   getjson(ctx); */
	   $(document).on("click", "#abc", function(){
		       $("#half").popup();
	    }); 
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
		    /* 选择请假类型 */
		   	$(function(){
				$("#qingjia").picker({
			        title: "选择请假类型",
			        toolbarCloseText:'确定',
			        cols: [
			          {
			            textAlign: 'center',
			            values: ['年假','事假','病假','调休假','婚假','产假','陪产假','其他'],
			          }
			        ]
			    });
	   });
		    /*  计算时长 */
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