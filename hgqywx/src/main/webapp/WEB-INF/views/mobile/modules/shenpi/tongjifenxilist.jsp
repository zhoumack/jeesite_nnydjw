<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>统计分析</title>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.picker.all.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.dtpicker.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/imgeviewer.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />
<link type="text/css" rel="stylesheet" href="${ctxStatic}/mmenu/css/jquery.mmenu.all.css" />
<%-- <script src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script> --%>
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/mmenu/js/jquery.mmenu.all.js"></script>

<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.picker.all.js"></script>
<script src="${ctxStatic}/mui/js/mui.dtpicker.js"></script>
<script src="${ctxStatic}/mui/js/mui.previewimage.js"></script>
<script src="${ctxStatic}/mui/js/mui.zoom.js"></script>
<script src="${ctxStatic}/webuploader/webuploader.min.js"></script>
<script src="${ctxStatic}/mui/js/loading.js"></script>
<script src="${ctxStatic}/mui/js/echarts.common.min.js"></script>
</head>
<body>
<style>
	#poper_m{
		width: 100%;height: 100%;background-color: #fff;z-index: 99999;position: absolute;top: 0;opacity: 0.8;display: none;
	}
	#poper_dv{
		z-index: 999999;position: absolute;bottom:57px;right: 17px;display: none;
	}
	img{
	vertical-align:middle
	}
	a{
		color:#333;
	}
</style>
<script type="text/javascript">

</script>
	<!-- 悬浮区 -->
<%-- 	<img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png" style="z-index: 99999; position: absolute; width: 14%; right: 0px; bottom: 85px"> --%>
	 <img id="rc_btn" src="${ctxStatic}/mui/image/rc_more.png" style="z-index: 99999; position: absolute; width: 40px; right: 17px; bottom: 67px">
	 <div id="poper_m"></div>
		<div id="poper_dv">
		<div style="margin-bottom: 8px">
			<span style="color: #777777;font-size: 18px">返回</span>
			<img id="xuanfu" src="${ctxStatic}/mui/image/fanhui.png" width="45px" />
		</div>
	</div>
	<!--内容  -->
	<!--侧滑菜单容器-->
	<div class="mui-scroll-wrapper">
		<div class="mui-scroll">
		<div class="mui-content">
				<ul class="mui-table-view mui-table-view-chevron">
						
						<c:forEach items="${list}" var="act">
								<c:set var="task" value="${act.task}" />
								<c:set var="vars" value="${act.vars}" />
								<c:set var="procDef" value="${act.procDef}" /><%--
								<c:set var="procExecUrl" value="${act.procExecUrl}" /> --%>
								<c:set var="status" value="${act.status}" />
								<c:set var="isClaim" value="javascript:claim('${task.id}');" />
								<c:set var="isDone" value="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}" />
								<%-- <c:out value="${isDone}"/>
								 <c:set var="task" value="${act.histTask}" />
								<c:out value="${isClaim}"/> --%>
								<div  class="weui-tab__bd-item weui-tab__bd-item--active">
									<div class="weui-panel weui-panel_access">
										<c:if test='${state =="0"}'>
											<a id="xiangqing1" href="${empty task.assignee?isClaim:isDone}" class="media_box">
										</c:if>
										<c:if test='${state !="0"}'>
											 <a id="xiangqing1" href="${ctx}/act/task/form?taskId=${act.histTask.id}&taskName=${fns:urlEncode(act.histTask.name)}&taskDefKey=${act.histTask.taskDefinitionKey}&procInsId=${act.histTask.processInstanceId}&procDefId=${act.histTask.processDefinitionId}&status=${status}" class="media_box">
										</c:if>
									    
											<li class="mui-table-view-cell mui-media" style="position: relative;">
													<img class="mui-media-object mui-pull-left" src="${act.user.photo }">
													<div class="mui-media-body">
													${vars.map.title}
													<c:if test="${empty task.assignee}">
														<p class="media_box_dv_p">(签收任务)</p>
													</c:if>
														
														 <c:if test='${state =="0"}'>
															<p class='mui-ellipsis' style="color: green;padding-top: 5px;">审批中</p>
														</c:if>
														<c:if test='${state =="1"}'>
															<p class='mui-ellipsis' style="color: green;padding-top: 5px;">已办</p>
														</c:if>
														<c:if test='${state =="2"}'>
															<p class='mui-ellipsis' style="color: green;padding-top: 5px;">申请</p>
														</c:if>
														
													</div>
													<c:if test='${state =="0"}'>
														<span class="mui-pull-right" style="position: absolute;top: 8px;right: 9px;font-size: 13px;"><p><fmt:formatDate value="${task.createTime}" type="both" pattern="yyyy-MM-dd HH:mm"/></p></span>
													</c:if>
													<c:if test='${state !="0"}'>
														<span class="mui-pull-right" style="position: absolute;top: 8px;right: 9px;font-size: 13px;"><p><fmt:formatDate value="${act.histTask.createTime}" type="both" pattern="yyyy-MM-dd HH:mm"/></p></span>
													</c:if>
													
											</li>
										</a>
									</div>
							    </div>
						</c:forEach>
					</ul>
			</div>
		</div>
	</div>
	<script>
	mui('.mui-scroll-wrapper').scroll({
		deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
	});
	//全局权限
		$("#rc_btn").on("tap",function(){
			$("#poper_m").show();
			$("#poper_dv").show();
		});
		$("#poper_m").on("tap",function(){
			$("#poper_m").hide();
			$("#poper_dv").hide();
		});
		function pulldownRefresh() {
			setTimeout(function() {
				window.location.reload();
				mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
			}, 1000);
		}

		mui.ready(function() {
			mui('body') .on( 'tap', 'a', function() {
								if (this.href
										&& this.href.indexOf("#") == -1
										&& !this.classList
												.contains('mui-action-back')) {
									var this_href = this.href;
									setTimeout(function() {
										window.location.href = this_href;
									}, 100);
								}
							});
			ele_drag("#rc_btn");
		});

		/*  */
		mui.init({
			swipeBack : false
		});
		/* (function($) {
			$('.mui-scroll-wrapper').scroll({
				indicators : true
			//是否显示滚动条
			});
		})(mui); */
		var h = document.documentElement.clientHeight;
		var h1 = h - 98;
		$(".mui-control-content").css("min-height", h1);

		/* 控件拖动以及返回 */
		$('#xuanfu').on('tap', function() {
			mui.openWindow({
				url : "${ctx}/main/index"
			})
		})
		/* 控件拖动 */
		function ele_drag(ele) {
			var cont = $(ele);
			var contW = $(ele).width();
			var contH = $(ele).height();
			var startX, startY, sX, sY, moveX, moveY;
			var winW = $(window).width();
			var winH = $(window).height();
			cont.on({ //绑定事件
				touchstart : function(e) {
					startX = e.originalEvent.targetTouches[0].pageX; //获取点击点的X坐标    
					startY = e.originalEvent.targetTouches[0].pageY; //获取点击点的Y坐标
					//console.log("startX="+startX+"************startY="+startY);
					sX = $(this).offset().left; //相对于当前窗口X轴的偏移量
					sY = $(this).offset().top; //相对于当前窗口Y轴的偏移量
					/* if(vue.scrollY) {
						sY = sY - vue.scrollY
					} */
					//console.log("sX="+sX+"***************sY="+sY);
					leftX = startX - sX; //鼠标所能移动的最左端是当前鼠标距div左边距的位置
					rightX = winW - contW + leftX; //鼠标所能移动的最右端是当前窗口距离减去鼠标距div最右端位置
					topY = startY - sY; //鼠标所能移动最上端是当前鼠标距div上边距的位置
					bottomY = winH - contH + topY; //鼠标所能移动最下端是当前窗口距离减去鼠标距div最下端位置       
				},
				touchmove : function(e) {
					e.preventDefault();
					moveX = e.originalEvent.targetTouches[0].pageX; //移动过程中X轴的坐标
					moveY = e.originalEvent.targetTouches[0].pageY; //移动过程中Y轴的坐标
					//console.log("moveX="+moveX+"************moveY="+moveY);
					if (moveX < leftX) {
						moveX = leftX;
					}
					if (moveX > rightX) {
						moveX = rightX;
					}
					if (moveY < topY) {
						moveY = topY;
					}
					if (moveY > bottomY) {
						moveY = bottomY;
					}
					$(this).css({
						"left" : moveX + sX - startX,
						"top" : moveY + sY - startY,
					});
				}
			});
		}
		$(".t_div1").on("tap",function(){
			 openTimePicker(this)
		});
		$("#select1").on("tap",function(){
			// alert(1);
		});
		
		
		$('#offCanvasHide').on('tap',function(){
			var start =  $('#starttime').val();
			var end =  $('#endtime').val();
			
			if(role=="0"){
				getData(start,end);
				getData1(start,end);
			}else if(role=="1"){
				var userId = $("#userId").val();
				if(userId=="0"){
					$("#area3").css("display","none");
					$("#area4").css("display","none");
					getData2(start,end);
				}else{
					$("#area2").css("display","none");
					getData3(start,end,userId);
					getData4(start,end,userId);
				}
			}else if(role=="2"){
				
			}
			
			
		});
		
		
		function claim(taskId) {
			$.get('${ctx}/act/task/claim' ,{taskId: taskId}, function(data) {
				console.log(data == true);
				if (data == 'true'){
					mui.toast('签收完成');
					window.setTimeout(function () {
				    }, 2000);
		            location = '${ctx}/shenpi/wode/';
				}else{
					mui.toast('签收失败');
				}
		    });
		}
		
	</script>

</body>

</html>