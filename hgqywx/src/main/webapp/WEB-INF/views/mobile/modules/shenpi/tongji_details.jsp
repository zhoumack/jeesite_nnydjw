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
<!-- mmenu -->
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
.detail_sp{
		padding-left: 10px;
  			color: #333;
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
			<div style="width: 95%;margin:20px auto;border-radius: 5px;background-color: #fff;">
			<div style="width: 88%;height: 50px;margin: 0 auto;border-bottom: 1px dashed #e5e5e5;position: relative;">
				<h4 style="padding: 17px 0px;">阳光的请假</h4>
				<div style="width: 50px;height: 16px;border: 1px solid #2AC845;border-radius: 2px;position: absolute;top: 17px;right: 0;">
					<span style="font-size: 10px;position: relative;top:-4px;color: #2AC845;">已完成</span>
				</div>
			</div>
			<div style="padding: 10px 21px;;">
				<p>请假类型<span class="detail_sp">病假</span></p>
				<p>开始时间<span class="detail_sp">2018-08-02 19:30</span></p>
				<p>开始时间<span class="detail_sp">2018-08-02 19:30</span></p>
				<p>请假天数<span class="detail_sp">1.5天</span></p>
				<p>请假事由<span class="detail_sp">2151515电脑机房内数据可能开始规划局事年度均具开发v模式宽带缴费ISO见覅偶阀门打开v模式卡少女紧身裤女</span></p>
			</div>
			<br style="clear: both;" />
		</div>
		<div style="width: 100%;height: 42px;background-color: #fff;position: absolute;bottom: 0;border-top: 1px solid #e5e5e5;">
			<button type="button" class="mui-btn mui-btn-block" style="border: 1px solid #fff;padding: 7px 0;margin-bottom:0px !important">处理</button>
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
		(function($) {
			$('.mui-scroll-wrapper').scroll({
				indicators : true
			//是否显示滚动条
			});
		})(mui);
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
			 alert(1);
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
		
		
		
	</script>

</body>

</html>