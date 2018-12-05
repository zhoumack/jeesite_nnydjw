<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>个人事务</title>
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" href="${ctxStatic}/mui/css/mui.min.css">
	<style>
	   *{
			margin: 0;
			padding: 0;
		}
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
		.cent_menus{
		  position:relative;
		  overflow:hidden;
		}
		.cent_menu{
		  position:relative;
		  float:left;
		  padding:20px 10px;
		  width:33.33333333%;
		  box-sizing:border-box;
		}
		.cent_menu:before{
		  content:" ";
		  position:absolute;
		  right:0;
		  top:0;
		  width:1px;
		  bottom:0;
		  border-right:1px solid #D9D9D9;
		  color:#D9D9D9;
		  -webkit-transform-origin:100% 0;
		          transform-origin:100% 0;
		  -webkit-transform:scaleX(0.5);
		          transform:scaleX(0.5);
		}
		.cent_menu:after{
		  content:" ";
		  position:absolute;
		  left:0;
		  bottom:0;
		  right:0;
		  height:1px;
		  border-bottom:1px solid #D9D9D9;
		  color:#D9D9D9;
		  -webkit-transform-origin:0 100%;
		          transform-origin:0 100%;
		  -webkit-transform:scaleY(0.5);
		          transform:scaleY(0.5);
		}
		.cent_menu:active{
		  background-color:#ECECEC;
		}
		.cent_menu_dv{
			width:28px;
			height:28px;
			margin:0 auto;
			}
		.cent_menu p{
			 display:block;
			  text-align:center;
			  color:#887f7f;
			  font-size:14px;
			  white-space:nowrap;
			  text-overflow:ellipsis;
			  overflow:hidden;
			  margin-top:5px;
			  font-size: 12px;
		}
		.cent_menu_dv img{
			display:block;
			  width:80%;
			  height:80%;
			  margin-top:5px;
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
		a{
			text-decoration: none;
		}
		.footer_menu{
			display: block;
			width: 100%;
			height: 60px;
			border-top: 1px solid #D7D7D7;
			position: absolute;
			bottom: 0;
			background-color: #fff;
			z-index: 999;
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
	</style>
</head>
<body>
<!--头部-->
	<%-- <div class="head_menu">
		<a href="${ctx }/main/index">
			<img  src="${ctxStatic}/mui/img/fanhui.png"/>
		</a>
		<p>综合事务</p>
	</div> --%>
	<!--九宫格内容区-->
	<div class="mui-scroll-wrapper" style="position: absolute;">
		<div class="mui-scroll">
			<a href="#" class="cent_menu">
				<div class="cent_menu_dv">
					<img src="${ctxStatic}/mui/img/gongzuorizhi.png"/>
				</div>
				<p>工作日志</p>
			</a>
			<a href="#" class="cent_menu">
				<div class="cent_menu_dv">
					<img src="${ctxStatic}/mui/img/richenganpai.png"/>
				</div>
				<p>日程安排</p>
			</a>
			<a href="#" class="cent_menu">
				<div class="cent_menu_dv">
					<img src="${ctxStatic}/mui/img/daibanshixiang.png"/>
				</div>
				<p>待办事项</p>
			</a>
			<a href="#" class="cent_menu">
				<div class="cent_menu_dv">
					<img src="${ctxStatic}/mui/img/dangjianguanli.png"/>
				</div>
				<p>党建管理</p>
			</a>
			<a href="#" class="cent_menu">
				<div class="cent_menu_dv">
					<img src="${ctxStatic}/mui/img/dubanshixiang.png"/>
				</div>
				<p>督办管理</p>
			</a>
			<a href="/hgqywx/a/logout" class="cent_menu">
				<div class="cent_menu_dv">
					<img src="${ctxStatic}/mui/img/dangjianguanli.png"/>
				</div>
				<p>注销账号</p>
			</a>
		</div>
	</div>
	<!--底部导航-->
	<%-- <div class="footer_menu">
		<div class="footer_menu_dv">
			<a href="${ctx}/main/shenqing">
				<img src="${ctxStatic}/mui/img/new.png" width="20px" height="20px"/>
				<p>新申请</p>
			</a>
		</div>
		<div class="footer_menu_dv">
			<a href="${ctx}/shenpi/wode">
				<img src="${ctxStatic}/mui/img/shenpi.png" width="20px" height="20px"/>
				<p>我审批的</p>
			</a>
		</div>
		<div class="footer_menu_dv">
			<a href="${ctx}/shenpi/yitijiao">
				<img src="${ctxStatic}/mui/img/tijiao1.png" width="20px" height="20px"/>
				<p>已提交</p>
			</a>
		</div>
	</div> --%>
	<script type="text/javascript" src="${ctxStatic}/mui/js/mui.min.js" ></script>
	<script>
		mui('.mui-scroll-wrapper').scroll({
		deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
	});
	</script>
</body>
</html>