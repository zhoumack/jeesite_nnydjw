<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>派车</title>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css">
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css">
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css">
<link rel="stylesheet" href="${ctxStatic}/weui/css/style.css">
<script type="text/javascript" src="${ctxStatic}/weui/js/vue.min.js"></script>
<style type="text/css">
* {
	touch-action: pan-y;
}

.weui-cells_checkbox .weui-check:checked+.weui-icon-checked:before {
	color: #4187FA;
}

ul, li, i {
	list-style: none;
	padding: 0;
	margin: 0;
	font-style: normal;
}

i {
	width: 14px;
	height: 14px;
	float: left;
}

.box {
	width: 100%;
	max-width: 300px;
	margin: 0 auto;
}

.nav-ml {
	width: 100%;
	background: white;
}

.nav-ml ul {
	margin-left: 20px;
}

.nav-ml a {
	display: block;
	font-size: 14px;
	height: 20px;
	padding: 3px 0;
	color: #666;
	overflow: hidden;
}

.nav-first, .nav-second, .nav-three, nav-four {
	margin-left: 20px;
}

.fold {
	display: none;
}

#txiang {
	padding-left: 20px;
}
</style>
</head>
<body>
	<!--头部-->
	<div class="header">
		<a href="${ctx}/shenpi" class="img_left"> <img
			src="${ctxStatic}/weui/img/xiangzuo.png" />
		</a>
		<p>派车</p>
	</div>
	<!--内容区-->
	<form:form id="form" modelAttribute="paiche"
		action="${ctx}/shenpi/paiche/save" method="post">
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
						src="${paiche.user.photo}" width="8" height="8"
						class="f_padding pr10" />
					</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="text" name="userName"
						value="${paiche.userName}" required placeholder="请输入"
						emptyTips="请输入姓名" notMatchTips="请输入正确的姓名">
				</div>
				<div class="weui_cell_ft">
					<i class="weui_icon_warn"></i>
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">用车类别</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="text" id='yongche'
						value="${paiche.type}" name="type" placeholder="请输入">
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">用车人数</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="number" name="pnums" value="${paiche.pnums}"
						placeholder="请输入">
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label for="" class="weui-label">用车时间</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" id="car"  value="<fmt:formatDate value="${paiche.starttime}" type="both" pattern="yyyy-MM-dd HH:mm"/>"  name="starttime"  placeholder="请选择" required emptyTips="请选择开始时间" notMatchTips="请选择"/>
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">出车地点</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="text" name="startplace" value="${paiche.startplace }"
						placeholder="请输入">
				</div>
			</div>
		</div>
		<div class="weui-cells weui-cells_form">
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">驾驶员</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="text" name="driver" value="${paiche.driver }"
						placeholder="请输入">
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">车牌</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="text" name="plate" value="${paiche.plate }"
						placeholder="请输入">
				</div>
			</div>
		</div>
		<div class="weui-cells__title">用车说明</div>
		<div class="weui-cells weui-cells_form">
			<div class="weui-cell">
				<div class="weui-cell__bd">
					<textarea class="weui-textarea" id="weui-textarea"
						onkeyup="astrict()" name="event" placeholder="请输入内容">${paiche.event}</textarea>
					<div class="weui-textarea-counter"></div>
				</div>
			</div>
		</div>
		<a href="xuanzetuisongren.html"
			class="weui-media-box weui-media-box_appmsg weui-cells">
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
		<a href="xuanzetuisongren.html"
			class="weui-media-box weui-media-box_appmsg weui-cells">
			<div class="weui-media-box__bd">
				<h4 class="weui-media-box__title">抄送人</h4>
				<p class="weui-media-box__desc">
					<span id="tid" style="position: relative;"> </span> <img
						class="open-popup" id="abc"
						src="${ctxStatic}/weui/img/tianjia.png" width="60px" height="60px" />
				</p>
			</div>
		</a>
		<c:if test="${chuchai.status=='驳回' }">
			<div class="weui-cell weui_footer1">
				<input class="weui-input" type="text" name="act.comment"
					placeholder="审批意见">
			</div>
		</c:if>
		<a href="#" class="btn_div" id="formSubmitBtn"> <c:if
				test="${chuchai.status==null }">
				<button id="btn" type="submit" onclick="$('#flag').val('1')">提交</button>
			</c:if> <c:if test="${chuchai.status=='驳回' }">
				<button id="btn" type="submit" onclick="$('#flag').val('1')">请假审批</button>
			</c:if>
		</a>
		<!--弹出页面-->
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
				<div class="nav-ml">
					<ul class="nav-first" style="margin-left: 0;" v-for="one in list">
						<li>
							<div class="weui-cell item-1" id="item1">
								<div class="weui-cell__hd">
									<img src="${ctxStatic}/weui/img/bumen.png" width="20"
										height="20">
								</div>
								<div class="weui-cell__bd">
									<p>{{one.name}}</p>
								</div>
							</div>
							<ul class="nav-second fold">
								<li v-for="two in one.children">
									<div class="weui-cell item-2" id="item2">
										<div class="weui-cell__hd">
											<img src="${ctxStatic}/weui/img/bumen.png" width="20"
												height="20">
										</div>
										<div class="weui-cell__bd">
											<p>{{two.name}}</p>
										</div>
									</div>
									<ul class="nav-three fold">
										<li v-for="three in two.children">
											<div class="weui-cell item-3" id="item3">
												<div class="weui-cell__hd">
													<img src="${ctxStatic}/weui/img/bumen.png" width="20"
														height="20">
												</div>
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
						<c:forEach items="${histoicFlowList}" var="act" varStatus="status">
							<%-- <td>${act.histIns.activityName}</td>
				<td>${act.assigneeName}</td>
				<td><fmt:formatDate value="${act.histIns.startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${act.histIns.endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td style="word-wrap:break-word;word-break:break-all;">${act.comment}</td>
				<td>${act.durationTime}</td> --%>
							<li class="timeline-item"><c:if test="${status.first==true}">
									<div class="timeline-item-head-first">
										<i
											class="weui_icon weui_icon_success_no_circle timeline-item-checked"></i>
									</div>
								</c:if> <c:if test="${status.first==true}">
									<div class="timeline-item-head">
										<i
											class="weui_icon weui_icon_success_no_circle timeline-item-checked hide"></i>
									</div>
								</c:if>
								<div class="timeline-item-tail"></div>
								<div class="timeline-item-content">
									<h4>${act.assigneeName}</h4>
									<p>
										<fmt:formatDate value="${act.histIns.endTime}" type="both"
											pattern="yyyy-MM-dd HH:mm:ss" />
										&nbsp;&nbsp;${act.histIns.activityName}
									</p>
								</div></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</form:form>
	<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
	<script type="text/javascript">
		/* 选择抄送人 */
		$(document)
				.on(
						"click",
						"#rclick",
						function() {
							var nid = $(this).children("span").text();
							var name = $(this).children("p").text();
							var p = $('<span id="'+nid+'" name="username" style="padding: 10px">'
									+ name
									+ '<img id="deimg" src="${ctxStatic}/weui/img/chahao.png"  onclick="del()" width="15px" height="15px" style="position: absolute;"/></span>');
							if (!$('#tid').children('span[id=' + nid + ']')
									.text()) {
								$("#tid").append(p);
								$.closePopup("#half");
							} else {
								$.alert("您已经添加了！");
							}
						});
		/* 删除抄送人 */
		function del() {
			$("#tid span").eq($(this).index()).remove();
		}
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
				//               console.log(data);
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
		/*  */
		$(document).on("click", "#abc", function() {
			$("#half").popup();

		});
		$(document).on("click", "#aaa", function() {
			$.closePopup("#half");
			//	        $.toast("绑定成功!",1000); 
		});
		/*  */
		function astrict() {
			var tarea = document.getElementById("weui-textarea");
			var maxlength = 200;
			var length = tarea.value.length;
			var count = maxlength - length;

			var sp = document.getElementById("astrict-sl");
			sp.innerHTML = count;
			if (count <= 25) {
				sp.style.color = "red";
			} else {
				sp.removeAttribute("style");
			}
		}
		$(function() {
			$("#yongche").picker({
				title : "选择类型",
				toolbarCloseText : '确定',
				cols : [ {
					textAlign : 'center',
					values : [ '执勤', '抓捕', '其他' ],
				} ]
			});
		});
		window.onload = function(){
    		var star = $("#car");
    		settime(star);
    	}
		function settime(obj) {
			$(obj).datetimePicker({
		        title: "选择时间",
		        min: "1990-12-12",
		        max: "2022-12-12 12:12",
		        onChange: function (picker, values, displayValues) {
		          console.log(values);
		        }
		      });
		}
	</script>
</body>
</html>