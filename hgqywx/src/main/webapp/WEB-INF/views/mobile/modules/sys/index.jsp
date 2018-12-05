<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<link href="${ctxStatic}/mui/css/mui.min.css" rel="stylesheet"/>
<link href="${ctxStatic}/mui/css/swiper.min.css" rel="stylesheet"/>
<title>重庆市南岸区人民检察院</title>
<style>
.bgimg {
	position: relative;
	top: 5px;
	width: 95%;
	height: 150px;
	margin: 0 auto;
	border-radius: 8px;
	background-image: url(${ctxStatic}/mui/image/bg@2x.png);
	background-size: 100% 100%;
}
.header_dv{
	width: 100%; background-color: #fff;
}
.header_dv_dv{
	padding-top: 48px;height: 125px;border-bottom: 1px solid #d7d7d7;
}
 .swiper-slide{width: 25%;margin: 0px !important;padding: 9px;}
.topmenu{height: 89px;background-color: white;border-bottom: 1px solid #CCCCCC;padding: 0 10px;line-height: 35px;font-family: "微软雅黑"}
.log_dv1{
	float: left;text-align: center;
}
.log_dv{
	width:25%;float: left;text-align: center;
}
.log_dv1 p{
	font-size: 12px;color: #333;margin-top: -7px;;
}
.log_dv p{
	font-size: 12px;color: #333;margin-top: 6px;;
}

.header_dv marquee {
    position: absolute;
    top: 9px;
    left: 44px;
	color: #333333;
	width: 87%;
	float: right;
	font-size: 14px;
	height: 20px;
	line-height: 15px;
	/* margin-top: 3px; */
}

.zonghe_dv {
	width: 100%;
	background-color: #fff;
	margin-top: 10px;         
	border-bottom: 1px solid #d7d7d7;
}

.zonghe_dv_dv {
	height: 44px;
	border-bottom: 1px solid #d7d7d7;
}

.zonghe_dv_dv img {
	margin: 10px 10px;
	float: left;
}

.zonghe_dv_dv span {
	font-size: 16px;
	color: #333;
	position: relative;
	top: 13px;
}

.zonghe_childv {
	float: right;
	position: relative;
}

.zonghe_childv span {
	font-size: 12px;
	color: #333;
	position: relative;
	top: 12px;
	float: right;
	padding-right: 20px;
}

.zonghe_childv img {
	position: absolute;
	right: 0px;
	top: 6px;
}

.pa1 {
	position: relative;
    top: -7.4em;
    left: 1.2em;
}

.weui-badge {
	display: inline-block;
	padding: .15em .4em;
	min-width: 8px;
	border-radius: 18px;
	background-color: #f43530;
	color: #fff;
	line-height: 1.2;
	text-align: center;
	font-size: 12px;
	vertical-align: middle;
}
.mui-bar{
	    box-shadow: initial;
}
.gray { 
    -webkit-filter: grayscale(100%);
    -moz-filter: grayscale(100%);
    -ms-filter: grayscale(100%);
    -o-filter: grayscale(100%);
    
    filter: grayscale(100%);
	
    filter: gray;
}
.mui-table-view-cell>a>.mui-badge{
	position: absolute;
    top: 20px;
    right: 13px;
}
.mui-segmented-control.mui-segmented-control-inverted .mui-control-item.mui-active{
	color: inherit !important;
	border-bottom: inherit !important;
    background:inherit !important;
}
</style>
</head>
<body bgcolor="#f2f2f2">
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon  mui-pull-right">
			<img src="${ctxStatic}/mui/image/xiaoxi.png" width="20px" />
		</a>
		<h1 class="mui-title" style="text-align: left;position: relative;left: 4px">重庆市南岸区智能移动检务</h1>
	</header>
	<div id="pullrefresh"  class="mui-content mui-scroll-wrapper">
	<div class="mui-scroll">
		<div class="header_dv" style="z-index: 99999" >
			<div class="bgimg"></div>
			<div class="topmenu">
			    <div class="swiper-container">
			        <div class="swiper-wrapper">
			            <span class="swiper-slide" style="">
			            	<a href="${ctx}/main/zuzhijiagou">
			            		<div class="log_dv1">
									<img src="${ctxStatic}/mui/image/zuzhijiagou.png" width="50px" height="50px"/>
									<p style="">组织架构</p>
								</div>
			            	</a>
			            </span>
			            <span class="swiper-slide">
			            	<a href="${ctx}/shenpi/wode">
			            		<div class="log_dv1">
									<img src="${ctxStatic}/mui/image/shenhe.png" width="50px" height="50px"/>
									<p style="">审批审核</p>
									<span class="mui-badge pa1" id="num"  style="background-color: red;color: #fff"></span>
								</div>
			            	</a>
			            </span>
			            <span class="swiper-slide" id="gzap">
			            	<a href="${ctx}/shenpi/renwu/form"><!-- ${ctx}/shenpi/renwu/form -->
			            		<div class="log_dv1">
									<img src="${ctxStatic}/mui/image/gongzuo.png" width="50px" height="50px"/>
									<p style="">工作安排</p>
								</div>
			            	</a>
			            </span>
			            <span class="swiper-slide">
			            	<a href="${ctx}/main/tongjifenxi">
			            		<div class="log_dv1">
									<img src="${ctxStatic}/mui/image/tongji.png" width="50px" height="50px"/>
									<p style="">统计分析</p>
								</div>
			            	</a>
			            </span>
			            <span class="swiper-slide">
			            	<a href="${ctx}/main/use_sc">
			            		<div class="log_dv1">
									<img src="${ctxStatic}/mui/image/shouce.png" width="50px" height="50px"/>
									<p style="">使用手册</p>
								</div>
			            	</a>
			            </span>
			        </div>
			    </div>
			</div>
			<div style="position: relative;top: -1px;">
				<img src="${ctxStatic}/mui/image/tongzhi1.png" width="18px" height="18px"
					style="width: 5%; position:absolute; top: 12px; left: 12px;" />
				<marquee direction="up" scrollamount="1"> 重庆市南岸区智能移动检务正式上线！
				</marquee>
				<br style="clear: both;" />
			</div>
			<br style="clear: both;" />
		</div>
		<!--综合事务-->
		<div class="zonghe_dv" style="margin-top: 11px;">
			<div class="zonghe_dv_dv">
				<img src="${ctxStatic}/mui/image/zongheshiwu.png" width="25px" height="25px" /> <span>综合事务</span>
				<div id="chakan1" class="zonghe_childv">
					<span id="cmore1">查看更多</span> <img src="${ctxStatic}/mui/image/more.png" width="6px" height="12px" />
				</div>
			</div>
			<div style="padding-top: 20px;">
				<a id="qingjia" href="${ctx}/shenpi/qingjia/form">
					<div class="log_dv">
						<img src="${ctxStatic}/mui/image/qingjia.png" width="45px" height="45px" />
						<p>请假</p>
					</div>
				</a>
				<a id="paiche" href="${ctx}/shenpi/paiche/form">
					<div class="log_dv">
						<img src="${ctxStatic}/mui/image/paiche.png" width="45px" height="45px" />
						<p>公务用车</p>
					</div>
				</a>
				<a id="weihu" href="${ctx}/shenpi/weixiu/form">
					<div class="log_dv">
						<img src="${ctxStatic}/mui/image/weixiu.png" width="45px" height="45px" />
						<p>设备维护</p>
					</div>
				</a>
				<a id="haocai" href="${ctx}/shenpi/bgyplq/form">
					<div class="log_dv">
						<img src="${ctxStatic}/mui/image/bangongyongpin.png" width="45px" height="45px" />
						<p>耗材配件</p>
					</div>
				</a>
			</div>
			<div style="padding-top: 20px;">
				<a id="yongjing" ><!--href="${ctx}/shenpi/yongjing/form"  -->
					<div class="log_dv">
						<img class="gray"  src="${ctxStatic}/mui/image/chujin.png" width="45px" height="45px" />
						<p>用警</p>
					</div>
				</a> 
				<a id="waichu"><!--  href="${ctx}/shenpi/waichu/form" -->
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/waichu.png" width="45px" height="45px" />
						<p>外出</p>
					</div>
				</a>
				<a id="jiaban" ><!-- href="${ctx}/shenpi/jiaban/form" -->
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/jiaban.png" width="45px" height="45px" />
						<p>加班</p>
					</div>
				</a>
				<a id="chuchai" ><!-- href="${ctx}/shenpi/chuchai/form" -->
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/chuchai.png" width="45px" height="45px" />
						<p>出差</p>
					</div>
				</a> 
			</div>
			<div class="more1" style="padding-top: 20px; display: none;">
				<a id="bangongqu"><!--href="${ctx}/shenpi/bangongqu/form"  -->
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/bangongqu.png" width="45px" height="45px" />
						<p>办公区</p>
					</div>
				</a> 
				<a id="jiedai"><!-- href="${ctx}/shenpi/jiedai/form"  -->
					<div class="log_dv">
						<img  class="gray" src="${ctxStatic}/mui/image/jiedai.png" width="45px" height="45px" />
						<p>接待申请</p>
					</div>
				</a> 
				<a href="#">
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/huiyi.png" width="45px" height="45px" />
						<p>会议管理</p>
					</div>
				</a>
				<a id="yongzhang" ><%-- href="${ctx}/shenpi/yongzhang/form" --%>
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/yongzhang.png" width="45px" height="45px" />
						<p>公务用章</p>
					</div>
				</a>
				<a href="#">
					<div  class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/gongwen.png" width="45px" height="45px" />
						<p>公文流转</p>
					</div>
				</a>
			</div>
			<br style="clear: both;" />
		</div>
		<!--个人事务-->
		<div class="zonghe_dv">
			<div class="zonghe_dv_dv">
				<img src="${ctxStatic}/mui/image/gerenshiwu.png" width="25px" height="25px" /> <span>个人事务</span>
				<div id="chakan2" class="zonghe_childv">
					<span id="cmore2">查看更多</span> <img src="${ctxStatic}/mui/image/more.png" width="6px" height="12px" />
				</div>
			</div>
			<div style="padding-top: 20px;">
				<a  href="${ctx}/grsw/rizhi/findDate">
					<div class="log_dv">
						<img src="${ctxStatic}/mui/image/rizhi.png" width="45px" height="45px" />
						<p>工作日志</p>
					</div>
				</a> 
				<a href="${ctx}/grsw/richeng/listDate">
					<div class="log_dv">
						<img  src="${ctxStatic}/mui/image/richeng.png" width="45px" height="45px" />
						<p>日程安排</p>
					</div>
				</a> 
				<a href="${ctx}/main/dbsw">
					<div class="log_dv">
						<img src="${ctxStatic}/mui/image/daiban.png" width="45px" height="45px" />
						<p>待办事项</p>
					</div>
				</a>
				<a href="${ctx}/shenpi/yitijiao">
            		<div class="log_dv">
						<img src="${ctxStatic}/mui/image/tijiao_jilu.png" width="45px" height="45px"/>
						<p style="">提交记录</p>
					</div>
            	</a> 
			</div>
			<div class="more2" style="padding-top: 20px; display: none;">
				<a href="#">
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/duban.png" width="45px" height="45px" />
						<p>督办管理</p>
					</div>
				</a>
				<a href="#">
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/dangjian.png" width="45px" height="45px" />
						<p>党建管理</p>
					</div>
				</a>
			</div>
			<br style="clear: both;" />
		</div>
		<!--辅助办案-->
		<div id="fzba" class="zonghe_dv">
			<div class="zonghe_dv_dv">
				<img src="${ctxStatic}/mui/image/zhihuibanan.png" width="25px" height="25px" /> <span>辅助办案</span>
				<div id="chakan3" class="zonghe_childv">
					<span id="cmore3">查看更多</span> <img src="${ctxStatic}/mui/image/more.png" width="6px" height="12px" />
				</div>
			</div>
			<div style="padding-top: 20px;">
				<a href="#">
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/taolun.png" width="45px" height="45px" />
						<p>案件讨论</p>
					</div>
				</a> <a href="#">
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/falv.png" width="45px" height="45px" />
						<p>法律法规</p>
					</div>
				</a> <a href="#">
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/zhushou.png" width="45px" height="45px" />
						<p>办案助手</p>
					</div>
				</a> <a href="#">
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/jainsuo.png" width="45px" height="45px" />
						<p>检索</p>
					</div>
				</a>
			</div>
			<div class="more3" style="padding-top: 20px; display: none;">
				<a href="#">
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/chaxun.png" width="45px" height="45px" />
						<p>信息查询</p>
					</div>
				</a> <a href="#">
					<div class="log_dv">
						<img class="gray" src="${ctxStatic}/mui/image/tixing.png" width="45px" height="45px" />
						<p>超期提醒</p>
					</div>
				</a> 
				<a href="#">
					<div class="log_dv">
						<img class="gray"  src="${ctxStatic}/mui/image/zhangju.png" width="45px" height="45px" />
						<p>指引助手</p>
					</div>
				</a>
			</div>
			<br style="clear: both;" />
		</div>
	</div>
	</div>
	<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/mui/js/swiper.min.js"></script>
	<script>
		
		/*  */
		$(function () {
	        var swiper = new Swiper('.swiper-container', {
	            spaceBetween: 20,
	            slidesPerView:'auto',
	            freeMode: true
	        });
	        
	        
	        $.ajax({
	        	url:"${ctx}/sys/role/getRoleByCurrentUser",
	        	success:function(data){
	        		console.log(data);
					if (data == "ganjing") {
						$("#gzap").css("display","none");
						$('.swiper-slide').css('width','25%');
					}
	        	},
	        	error:function(){
	        		console.log("错误！");
	        	}
	        	
	        });
	    })
		/*提示  */
		$(".gray").on('tap', function() {
			mui.alert('暂时未启用！', function() {
			});
		});
		/*下拉刷新  */
		mui.init({
			pullRefresh: {
				container: '#pullrefresh',
				down: {
					callback: pulldownRefresh
				}
			}
		});
		function pulldownRefresh() {
			setTimeout(function() {
				window.location.reload();
				mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
			}, 1000);
		}
		 mui.ready(function(){
				mui('body').on('tap', 'a', function() {
					if(this.href && this.href.indexOf("#") == -1 && !this.classList.contains('mui-action-back')) {
						var this_href = this.href;
						setTimeout(function() {
							window.location.href = this_href;
						}, 100);
					}
				});
			}); 
	/* 角标js*/
		$(document).ready(function(){
			$.ajax({
				url:"${ctx}/data/getShenpiSize",
				success:function(data){
					if(data==0){
						$("#num").css("visibility","hidden");
					}else{
						$("#num").css("visibility","visible");
						document.getElementById("num").innerText = data;
					}
					
				},
				error:function(e){
					
				}
			})
			});
	
		var h =document.documentElement.clientHeight;
		console.log(h);
		var h1 =h - 273;
	
	/* 点击查看更多js */
		 $('#chakan1').on('tap', function() {
			 console.log($(".more1").css('display') != 'none');
			 if ($(".more1").css('display') != 'none') {
				 $(".more1").hide(2000);
				 $("#cmore1").html("查看更多");
			}
			 else {
				 $('.mui-scroll-wrapper').animate({scrollTop:100},1000);
				 $(".more1").show();
				 $("#cmore1").html("收起");
				
			}
			 
		});
		 $('#chakan2').on('tap', function() {
			 console.log($(".more2").css('display') != 'none');
			 if ($(".more2").css('display') != 'none') {
				 $(".more2").hide(2000);
				 $("#cmore2").html("查看更多");
				 
			}
			 else {
				 $('.mui-scroll-wrapper').animate({scrollTop:100},1000);
				 $(".more2").show();
				 $("#cmore2").html("收起");
				 var _top = $("#fzba").offset().top; 
				 
			}
			 
			 //mui('.mui-scroll-wrapper').scroll().scrollTo(0,-200,100);//100毫秒滚动到顶
			 //$(window).animate({scrollTop:500},1000);
		});
		 $('#chakan3').on('tap', function() {
			 console.log($(".more3").css('display') != 'none');
			 if ($(".more3").css('display') != 'none') {
				 $(".more3").hide(2000);
				 $("#cmore3").html("查看更多");
				 
			}
			 else {
				 $('.mui-scroll-wrapper').animate({scrollTop:100},1000);
				 $(".more3").show();
				 $("#cmore3").html("收起");
			}
			
		});
		mui.init({
			swipeBack: true //启用右滑关闭功能
		});
	</script>
</body>
</html>