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
<title>重庆市南岸区人民检察院</title>
<style>
*{
margin: 0;
padding: 0;
}
.bgimg {
	position: relative;
	top: 20px;
	width: 95%;
	height: 150px;
	margin: 0 auto;
	border-radius: 8px;
	background-image: url(${ctxStatic}/mui/image/bg@2x.png);
	background-size: 100% 100%;
}

.header_dv {
	height: 330px;
	width: 100%;
	background-color: #fff;
}

.header_dv_dv {
	padding-top: 30px;
	height: 115px;
	border-bottom: 1px solid #d7d7d7;
}

.log_dv {
	width: 25%;
	float: left;
	text-align: center;
}

.log_dv p {
	font-size: 12px;
	color: #333;
	margin-top: 6px;
}

.header_dv marquee {
	color: #333333;
	width: 87%;
	float: right;
	margin-top:-17px;
	font-size: 14px;
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
</style>
</head>
<body bgcolor="#f2f2f2">
	<!--首部-->
	<div class="header_dv">
		<div style="">
			<span id="" style="color: #333; font-size: 18px; padding-bottom: 30px; position: relative; left: 13px; top: 10px;">
				重庆市南岸区人民检察院 
			</span> 
			<img src="${ctxStatic}/mui/image/xiaoxi.png" width="20px" style="float: right; margin-right: 12px; margin-top: 8px;" />
		</div>
		<div class="bgimg"></div>
		<div class="header_dv_dv">
			<a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/zuzhijiagou.png" width="50px" height="50px" />
					<p>组织架构</p>
				</div>
			</a> <a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/shouce.png" width="50px" height="50px" />
					<p>使用手册</p>
				</div>
			</a> 
			<a href="${ctx}/shenpi/wode">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/shenhe.png" width="50px" height="50px" />
					<p>审批审核</p>
					<span class="weui-badge pa1" id="num"></span>
				</div>
			</a> 
			<a href="${ctx}/shenpi/yitijiao">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/jilu.png" width="50px" height="50px" />
					<p>提交记录</p>
				</div>
			</a>
		</div>
		<img src="${ctxStatic}/mui/image/tongzhi.png" width="18px" height="18px"
			style="width: 5%; position: relative; top: 12px; right: 225px;" />
		<marquee direction="up" scrollamount="1"> 重庆市南岸区智能移动检务正式上线！
		</marquee>
		<br style="clear: both;" />
	</div>

	<!--综合事务-->
	<div class="zonghe_dv">
		<div class="zonghe_dv_dv">
			<img src="${ctxStatic}/mui/image/zongheshiwu.png" width="25px" height="25px" /> <span>综合事务</span>
			<div onclick="chakan1()" class="zonghe_childv">
				<span>查看更多</span> <img src="${ctxStatic}/mui/image/more.png" width="6px" height="12px" />
			</div>
		</div>
		<div style="padding-top: 20px;">
			<a href="${ctx}/shenpi/chuchai/form">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/chuchai.png" width="45px" height="45px" />
					<p>出差申请</p>
				</div>
			</a> 
			<a href="${ctx}/shenpi/qingjia/form">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/qingjia.png" width="45px" height="45px" />
					<p>请假申请</p>
				</div>
			</a> 
			<a href="${ctx}/shenpi/yongzhang/form">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/yongzhang.png" width="45px" height="45px" />
					<p>用章申请</p>
				</div>
			</a> 
			<a href=""${ctx}/shenpi/jiaban/form">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/jiaban.png" width="45px" height="45px" />
					<p>加班申请</p>
				</div>
			</a>
		</div>
		<div style="padding-top: 20px;">
			<a href="${ctx}/shenpi/weixiu/form">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/weixiu.png" width="45px" height="45px" />
					<p>设备维护</p>
				</div>
			</a>
			<a href="${ctx}/shenpi/waichu/form">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/waichu.png" width="45px" height="45px" />
					<p>外出申请</p>
				</div>
			</a>
			<a href="${ctx}/shenpi/bgyplq/form">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/bangongyongpin.png" width="45px" height="45px" />
					<p>耗材配件</p>
				</div>
			</a>
			<a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/huiyi.png" width="45px" height="45px" />
					<p>会议管理</p>
				</div>
			</a>
		</div>
		<div id="more1" style="padding-top: 20px; display: none;">
			<a href="${ctx}/shenpi/yongjing/form">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/bangongqu.png" width="45px" height="45px" />
					<p>用警申请</p>
				</div>
			</a> 
			<a href="${ctx}/shenpi/bangongqu/form">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/chujin.png" width="45px" height="45px" />
					<p>办公区申请</p>
				</div>
			</a> 
			<a href="${ctx}/shenpi/jiedai/form">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/jiedai.png" width="45px" height="45px" />
					<p>接待申请</p>
				</div>
			</a> 
			<a href="${ctx}/shenpi/paiche/form">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/paiche.png" width="45px" height="45px" />
					<p>派车申请</p>
				</div>
			</a> 
			<a href="${ctx}/shenpi/renwu/form">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/renwu.png" width="45px" height="45px" />
					<p>任务安排</p>
				</div>
			</a> 
			<a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/gongwen.png" width="45px" height="45px" />
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
			<div onclick="chakan2()" class="zonghe_childv">
				<span>查看更多</span> <img src="${ctxStatic}/mui/image/more.png" width="6px" height="12px" />
			</div>
		</div>
		<div style="padding-top: 20px;">
			<a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/rizhi.png" width="45px" height="45px" />
					<p>工作日志</p>
				</div>
			</a> <a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/richeng.png" width="45px" height="45px" />
					<p>日程安排</p>
				</div>
			</a> <a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/daiban.png" width="45px" height="45px" />
					<p>待办事项</p>
				</div>
			</a> <a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/dangjian.png" width="45px" height="45px" />
					<p>党建管理</p>
				</div>
			</a>
		</div>
		<div id="more2" style="padding-top: 20px; display: none;">
			<a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/duban.png" width="45px" height="45px" />
					<p>督办管理</p>
				</div>
			</a>
		</div>
		<br style="clear: both;" />
	</div>
	<!--辅助办案-->
	<div class="zonghe_dv">
		<div class="zonghe_dv_dv">
			<img src="${ctxStatic}/mui/image/zhihuibanan.png" width="25px" height="25px" /> <span>辅助办案</span>
			<div onclick="chakan3()" class="zonghe_childv">
				<span>查看更多</span> <img src="${ctxStatic}/mui/image/more.png" width="6px" height="12px" />
			</div>
		</div>
		<div style="padding-top: 20px;">
			<a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/taolun.png" width="45px" height="45px" />
					<p>案件讨论</p>
				</div>
			</a> <a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/falv.png" width="45px" height="45px" />
					<p>法律法规</p>
				</div>
			</a> <a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/zhushou.png" width="45px" height="45px" />
					<p>办案助手</p>
				</div>
			</a> <a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/jainsuo.png" width="45px" height="45px" />
					<p>检索</p>
				</div>
			</a>
		</div>
		<div id="more3" style="padding-top: 20px; display: none;">
			<a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/chaxun.png" width="45px" height="45px" />
					<p>信息查询</p>
				</div>
			</a> <a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/tixing.png" width="45px" height="45px" />
					<p>超期提醒</p>
				</div>
			</a> <a href="#">
				<div class="log_dv">
					<img src="${ctxStatic}/mui/image/zhangju.png" width="45px" height="45px" />
					<p>指引助手</p>
				</div>
			</a>
		</div>
		<br style="clear: both;" />
	</div>
	<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
	<script>
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
	
	/*  */
		function chakan1() {
			$("#more1").toggle();
		}
		function chakan2() {
			$("#more2").toggle();
		}
		function chakan3() {
			$("#more3").toggle();
		}
	</script>
</body>
</html>