<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<title>综合事务</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="stylesheet" href="${ctxStatic}/mui/css/mui.min.css">
	</head>
	<body>
		<style>
			.head_menu{
				width: 100%;
				height: 50px;
				background-color: #318df0;
			}
			.head_menu p{
				font-size: 15px;
				color: white;
				text-align: center;
				line-height: 50px;
			}
			.head_menu img{
				width: 20px;
				height: 20px;
				position: absolute;
				top: 14px;
				left: 5px;
			}
			body{
				color: #887F7F;
			}
			.mui-slider-progress-bar{
				height: 1px;
			}
			.mui-control-content {
				background-color: white;
				/*min-height: 426px;*/
			}
			.mui-control-content .mui-loading {
				margin-top: 50px;
			}
			.mui-title{
				color: #fff;
			}
			.mui-bar{
				background-color: #318df0;
			}
			.mui-control-item{
				color: #888888;
			}
			.mui-active{
				color: #318df0;
			}
			.footer_menu{
				display: block;
				width: 100%;
				height: 60px;
				border-top: 1px solid #D7D7D7;
				position: absolute;
				bottom: 0;
				background-color: #fff;
			}
			.footer_menu_dv{
				width: 33%;
				float: left;
				text-align: center;
				padding-top: 11px;
				line-height: 14px;
			}
			.footer_menu_dv p{
				color: #887f7f;
				font-size: 12px;
				padding-top: 5px;
			}
			.sp_dv{
		    	width: 50px;
		    	height: 15px;
		    	border: 1px solid  #74C3F9;
		    	text-align: center;
		    	line-height: 13px;
		    	position: absolute;
		    	top:22px;
		    	left: 120px;
		    	border-radius: 3px;
		    }
		    .sp_dv span{
		    	color: #387AC9;
		    	font-size: 12px;
		    }
		    .sp_dv1{
		    	width: 50px;
		    	height: 15px;
		    	border: 1px solid  #5aca5e;
		    	text-align: center;
		    	line-height: 13px;
		    	position: absolute;
		    	top:22px;
		    	left: 120px;
		    	border-radius: 3px;
		    }
		    .sp_dv1 span{
		    	color: #5aca5e;
		    	font-size: 12px;
		    }
		    .sp_dv2{
		    	width: 50px;
		    	height: 15px;
		    	border: 1px solid  #EC8B89;
		    	text-align: center;
		    	line-height: 13px;
		    	position: absolute;
		    	top:22px;
		    	left: 120px;
		    	border-radius: 3px;
		    }
		    .sp_dv2 span{
		    	color: #F43530;
		    	font-size: 12px;
		    }
		    .media_box{
		    	display: flex;position: relative;padding: 10px;border-bottom: 1px solid  #DCDCDC;
		    }
		    .media_box_dv{
		    	padding: 10px;
		    }
		    .media_box_dv_p{
		    	font-size: 18px;color: #000000;
		    }
		    .media_box_span{
		    	float: right;color: #808080;position: absolute;right: 9px;top: 10px;padding: 10px;
		    }
		</style>
		<header class="head_menu">
			<p>综合事务</p>
		</header>
		<div class="mui-content">
			<div id="slider" class="mui-slider">
				<div style="background-color: #fff;" id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
					<a class="mui-control-item mui-active" href="#item1mobile">
						待处理
					</a>
					<a class="mui-control-item" href="#item2mobile">
						已处理
					</a>
					<a class="mui-control-item" href="#item3mobile">
						抄送我
					</a>
				</div>
				<div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-4" style="background-color: #318df0;"></div>
				<div class="mui-slider-group">
					<div id="item1mobile" class="mui-slider-item mui-control-content">
						<div id="scroll1" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<a href="xiangqing1.html" class="media_box">
									<div class="media_box_dv">
										<p class="media_box_dv_p">黄蓉的请假</p>
										<p>申请人：黄蓉</p>
										<p>请假类型：年假</p>
										<p>开始时间：2018/10/8 上午</p>
									</div>
									<span class="media_box_span" style="">2018/9/20</span>
									<div class="sp_dv">
							        	<span>审批中</span>
							      </div> 
								</a>
							</div>
						</div>
					</div>
					<div id="item2mobile" class="mui-slider-item mui-control-content">
						<div id="scroll2" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<a href="#" class="media_box">
									<div class="media_box_dv">
										<p class="media_box_dv_p">曹操的请假</p>
										<p>申请人：曹操</p>
										<p>请假类型：年假</p>
										<p>开始时间：2018/10/8 上午</p>
									</div>
									<span class="media_box_span" style="">2018/9/20</span>
									<div class="sp_dv2">
							        	<span>已拒绝</span>
							      </div> 
								</a>
							</div>
						</div>
					</div>
					<div id="item3mobile" class="mui-slider-item mui-control-content">
						<div id="scroll3" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<a href="#" class="media_box">
									<div class="media_box_dv">
										<p class="media_box_dv_p">杨过的请假</p>
										<p>申请人：杨过</p>
										<p>请假类型：年假</p>
										<p>开始时间：2018/10/8 上午</p>
									</div>
									<span class="media_box_span" style="">2018/9/20</span>
									<div class="sp_dv1">
							        	<span>已通过</span>
							      </div> 
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!--底部导航-->
    	<div class="footer_menu">
			<div class="footer_menu_dv">
				<a href="${ctx}/main/shenqing">
					<img src="${ctxStatic}/mui/img/new1.png" width="20px" height="20px"/>
					<p>新申请</p>
				</a>
			</div>
			<div class="footer_menu_dv">
				<a href="woshenpi1.html">
					<img src="${ctxStatic}/mui/img/shenpi1.png" width="20px" height="20px"/>
					<p>我审批的</p>
				</a>
			</div>
			<div class="footer_menu_dv">
				<a href="${ctx}/main/yichuli">
					<img src="${ctxStatic}/mui/img/tijiao1.png" width="20px" height="20px"/>
					<p>已提交</p>
				</a>
			</div>
		</div>
		<script src="${ctxStatic}/mui/js/mui.min.js"></script>
		<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.8.3.min.js" ></script>
		<script>
			mui.init({
				swipeBack: false
			});
			(function($) {
				$('.mui-scroll-wrapper').scroll({
					indicators: true //是否显示滚动条
				});
			})(mui);
			var h =document.documentElement.clientHeight;
			var h1 =h - 142;
			$(".mui-control-content").css("min-height",h1);
		</script>

	</body>

</html>