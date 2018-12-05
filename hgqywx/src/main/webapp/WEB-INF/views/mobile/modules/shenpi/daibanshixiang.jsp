<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"><title>待办事项</title>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.picker.all.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.dtpicker.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/imgeviewer.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />

<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.picker.all.js"></script>
<script src="${ctxStatic}/mui/js/mui.dtpicker.js"></script>
<script src="${ctxStatic}/mui/js/mui.previewimage.js"></script>
<script src="${ctxStatic}/mui/js/mui.zoom.js"></script>
<script src="${ctxStatic}/webuploader/webuploader.min.js"></script>


<link rel="stylesheet" href="${ctxStatic}/daiban/css/amazeui.min.css">
<link rel="stylesheet" href="${ctxStatic}/daiban/css/swiper-3.3.1.min.css">
<link rel="stylesheet" href="${ctxStatic}/daiban/css/wx.css">

<script src="${ctxStatic}/mui/js/loading.js"></script>

<script type="text/javascript" src="${ctxStatic}/daiban/js/swiper-3.3.1.min.js"></script>
</head>
<style type="text/css">
			body,
			html {
				width: 100%;
				height: 100%;
				line-height: normal;
				margin: 0;
				padding: 0;
				background-color: #eee;
				overflow-x: hidden;
			}
			
			input,
			textarea {
				background-color: transparent;
				font-size: 15px;
				color: #666;
				outline: none;
			}
			
			.header {
				text-align: center;
				font-size: 20px;
				background-color: #007CCF;
				color: white;
				height: 40px;
				padding-top: 10px;
			}
			
			.img_left img {
				width: 25px;
				height: 25px;
				position: absolute;
				top: 10px;
				left: 0;
			}
			
			.t_row {
				margin-top: 10px;
				position: relative;
			}
			
			.row_div {
				background-color: white;
				padding: 10px;
				padding-right: 20px;
				border-top: 1px solid #ddd;
			}
			
			.row_div:last-child {
				border-bottom: 1px solid #ddd;
			}
			
			.t_a {
				text-decoration: none !important;
				color: black;
			}
			
			.t_a:active {
				background-color: #ddd;
			}
			
			.t_span {
				position: absolute;
				font-size: 16px;
			}
			
			.t_div {
				padding-left: 80px;
			}
			
			.t_select {
				width: 100%;
			}
			
			.t_input {
				width: 100%;
				border: none !important;
				height: 21px !important;
				margin-bottom: 0 !important;
				text-align: right;
				padding: 0 !important;
			}
			
			.bt_span {
				color: red;
				padding-left: 5px;
				position: relative;
				top: 3px;
			}
			
			.t_ta_div {
				padding-top: 10px;
			}
			
			.t_textarea {
				width: 100%;
				resize: none;
				border: none;
				height: 70px;
			}
			
			.sel_a {
				width: 50px;
				height: 50px;
				display: inline-block;
				background: url(${ctxStatic}/weui/img/tianjia.png) no-repeat;
				background-size: 100% 100%;
			}
			
			.sel_a:active {
				opacity: 0.5;
			}
			
			.footer {
				width: 100%;
				position: absolute;
				bottom: 0;
			}
			
			.btn_div {
				padding: 10px 20px;
			}
			
			.sub_btn {
				width: 100%;
				height: 40px;
				font-size: 17px;
				color: white;
				background-color: #007CCF;
				display: block;
				border: none;
				border-radius: 4px;
				outline: none;
			}
			
			.sub_btn:active {
				opacity: 0.5;
			}
			
			.progressbar_div .progressbar_text {
				position: absolute;
				top: 13px;
				right: 20px;
				color: #007aff;
				font-size: 14px;
			}
			
			.sel_a_div,
			.sel_div,
			.upload_a_div {
				padding-top: 10px;
				text-align: center;
				position: relative;
			}
			
			.sel_icon {
				width: 50px;
				height: 50px;
			}
			
			.uploader_del {
				background-color: red;
				color: white;
				position: absolute;
				right: 6px;
				top: -6px;
				font-size: 8px;
				padding: 4px 5px;
			}
			#poper_m{
	width: 100%;height: 100%;background-color: #fff;z-index: 99999;position: absolute;top: 0;opacity: 0.8;display: none;
}
#poper_dv{
	z-index: 999999;position: absolute;bottom:57px;right: 17px;display: none;
}
img{
vertical-align:middle
}
			
			
		</style>

	
<body>
<!-- 悬浮区 -->
<%-- <img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png" style="z-index: 99999;position: absolute;width: 14%;right: 0px;bottom: 85px"> --%>

<img id="rc_btn" src="${ctxStatic}/mui/image/rc_more.png" style="z-index: 99999; position: absolute; width: 40px; right: 17px; bottom: 67px">
 <div id="poper_m"></div>
	<div id="poper_dv">
		<div style="margin-bottom: 8px">
			<span style="color: #777777;font-size: 18px">返回</span>
			<img id="xuanfu" src="${ctxStatic}/mui/image/fanhui.png" width="45px" />
		</div>
	</div>
	
<!--内容  -->
<div class="wx-handle-main">
    <div class="am-g">
        <div class="am-u-sm-6">
            <p class="wx-basics-launch-name">申请人</p>
        </div>
        <div class="am-u-sm-6 wx-basics-launch-select">
            事项名称
        </div>
    </div>
    <div class="wx-basics-handel-modular am-cf">
        <div class="wx-basics-handel-modular-checkbox">
            <label class="am-checkbox am-success">
                <input type="checkbox" value="" data-am-ucheck class="userid">
            </label>
        </div>
        <div class="wx-basics-handel-modular-main">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="javascript:;" class="wx-basics-handel-modular-a">
                            <div class="am-g wx-basics-handel-introduce">
                                <div class="am-u-sm-3 wx-basics-handel-introduce-user">
                                    <img src="${ctxStatic}/daiban/images/launch-user-img05.png">
                                </div>
                                <div class="am-u-sm-6 wx-basics-handel-introduce-main am-padding-left-0">
                                    <p>Join<span>10分钟前</span></p>
                                    <p class="am-text-truncate">发来一封邮件，需处理！</p>
                                </div>
                                <div class="am-u-sm-3 wx-basics-handel-introduce-state">
                                	  邮件
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide wx-basics-handel-introduce-span">
                        <a href="javascript:;">删除</a>
                        <a href="javascript:;">查看</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="wx-basics-handel-modular am-cf">
        <div class="wx-basics-handel-modular-checkbox">
            <label class="am-checkbox am-success">
                <input type="checkbox" value="" data-am-ucheck class="userid">
            </label>
        </div>
        <div class="wx-basics-handel-modular-main">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="javascript:;" class="wx-basics-handel-modular-a">
                            <div class="am-g wx-basics-handel-introduce">
                                <div class="am-u-sm-3 wx-basics-handel-introduce-user">
                                    <img src="${ctxStatic}/daiban/images/launch-user-img05.png">
                                </div>
                                <div class="am-u-sm-6 wx-basics-handel-introduce-main am-padding-left-0">
                                    <p>Job<span>11/11</span></p>
                                    <p class="am-text-truncate">发来一封邮件，需处理！</p>
                                </div>
                                <div class="am-u-sm-3 wx-basics-handel-introduce-state">
                                	  邮件
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide wx-basics-handel-introduce-span">
                        <a href="javascript:;">删除</a>
                        <a href="javascript:;">查看</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="wx-basics-handel-modular am-cf">
        <div class="wx-basics-handel-modular-checkbox">
            <label class="am-checkbox am-success">
                <input type="checkbox" value="" data-am-ucheck class="userid">
            </label>
        </div>
        <div class="wx-basics-handel-modular-main">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="javascript:;" class="wx-basics-handel-modular-a">
                            <div class="am-g wx-basics-handel-introduce">
                                <div class="am-u-sm-3 wx-basics-handel-introduce-user">
                                    <img src="${ctxStatic}/daiban/images/launch-user-img05.png">
                                </div>
                                <div class="am-u-sm-6 wx-basics-handel-introduce-main am-padding-left-0">
                                    <p>Join<span>11/01</span></p>
                                    <p class="am-text-truncate">发来日程安排，请查看！</p>
                                </div>
                                <div class="am-u-sm-3 wx-basics-handel-introduce-state">
                                	  日志
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide wx-basics-handel-introduce-span">
                        <a href="javascript:;">删除</a>
                        <a href="javascript:;">查看</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="wx-basics-handel-modular am-cf">
        <div class="wx-basics-handel-modular-checkbox">
            <label class="am-checkbox am-success">
                <input type="checkbox" value="" data-am-ucheck class="userid">
            </label>
        </div>
        <div class="wx-basics-handel-modular-main">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="javascript:;" class="wx-basics-handel-modular-a">
                            <div class="am-g wx-basics-handel-introduce">
                                <div class="am-u-sm-3 wx-basics-handel-introduce-user">
                                    <img src="${ctxStatic}/daiban/images/launch-user-img07.png">
                                </div>
                                <div class="am-u-sm-6 wx-basics-handel-introduce-main am-padding-left-0">
                                    <p>陈静蕾<span>03/22</span></p>
                                    <p class="am-text-truncate">日程安排，请查阅！</p>
                                </div>
                                <div class="am-u-sm-3 wx-basics-handel-introduce-state">
                                    日程
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide wx-basics-handel-introduce-span">
                        <a href="javascript:;">删除</a>
                        <a href="javascript:;">查看</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
var swiper = new Swiper('.swiper-container', {
	slidesPerView: 'auto',
	spaceBetween: 0,
	freeMode: true,
	freeModeSticky : true,
	resistance:true,
});
			/* 返回 */
			 mui.ready(function(){
					ele_drag("#rc_btn");
					
					
					$("#rc_btn").on("tap",function(){
						$("#poper_m").show();
						$("#poper_dv").show();
					});
					$("#poper_m").on("tap",function(){
						$("#poper_m").hide();
						$("#poper_dv").hide();
					});
				});
			
			$('#xuanfu').on('tap', function() {
				history.go(-1);
			});
			/* 控件拖动 */
			function ele_drag(ele) {
				var cont = $(ele);
				var contW = $(ele).width();
				var contH = $(ele).height();
				var startX, startY, sX, sY, moveX, moveY;
				var winW = $(window).width();
				var winH = $(window).height();
				cont.on({ //绑定事件
					touchstart: function(e) {
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
					touchmove: function(e) {
						e.preventDefault();
						moveX = e.originalEvent.targetTouches[0].pageX; //移动过程中X轴的坐标
						moveY = e.originalEvent.targetTouches[0].pageY; //移动过程中Y轴的坐标
						//console.log("moveX="+moveX+"************moveY="+moveY);
						if(moveX < leftX) {
							moveX = leftX;
						}
						if(moveX > rightX) {
							moveX = rightX;
						}
						if(moveY < topY) {
							moveY = topY;
						}
						if(moveY > bottomY) {
							moveY = bottomY;
						}
						$(this).css({
							"left": moveX + sX - startX,
							"top": moveY + sY - startY,
						});
					}
				});
			}
		</script>
</html>