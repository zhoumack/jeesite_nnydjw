<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>我</title>
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
   	<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css">
	<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css">
	<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css">
	<link rel="stylesheet" href="${ctxStatic}/weui/css/weuix.min.css">
	<style>
		html,body{ background:#f4f4f4; }
		.weui-cells{ font-size: 15px; }
		.head{
			text-align: center;
			height: 45px;
			line-height: 45px;
			box-shadow: 0 1px 1px 1px #e4e4e4;
			background:#fff;
			position: fixed;
			left: 0;
			top: 0;
			z-index: 100;
			width: 100%;
			}
		.head .return{
			position: absolute;
			left: 0;
			top: 0;
			width: 45px;
			height: 45px;
		}
		.head .return:after{
			content: " ";
		    display: inline-block;
		    height: 13px;
		    width: 13px;
		    border-width: 2px 2px 0 0;
		    border-color: #C8C8CD;
		    border-style: solid;
		    -webkit-transform: matrix(0.71, 0.71, -0.71, 0.71, 0, 0);
		    transform: matrix(0.71, 0.71, -0.71, 0.71, 0, 0);
		    position: absolute;
		    transform:rotate(225deg);
		    left: 16px;
		    top: 14px;
		}
		.head .operation{
			position: absolute;
			right: 0;
			top: 0;
			width: 60px;
			height: 45px;
			color:#00d26d;
		}
		
		.personal .tx{
			width: 60px;
			height: 60px;
			border-radius: 50%;
		}
		.personal .weui-input{
			color: #999;
		}
	</style>
</head>
<body>
   <div class="head"><a href="${ctx}/main/wo" class="return"></a>个人信息 <a href="bianjigerenxinxi.html" class="operation">编辑</a></div>
   <div class="personal f15" style="padding-top: 50px;">
       	<div class="weui-cells m0">
  <div class="weui-cell">
    <div class="weui-cell__bd">
      头像
    </div>
    <div class=""><img class="tx" src="${ctxStatic}/weui/img/touxiang.jpg" alt=""></div>
  </div>
</div>

<div class="weui-cells mt5">
  <div class="weui-cell">
		    <div class="weui-cell__bd">
		      员工姓名
		    </div>
		    <div class="weui-cell__price">杨过</div>
		  </div>
		  <div class="weui-cell ">
		    <div class="weui-cell__bd">
		      员工昵称
		    </div>
		    <div class="weui-cell__price">Miss Yang</div>
		  </div>
		  <div class="weui-cell">
		    <div class="weui-cell__bd">
		     员工级别
		    </div>
		    <div class="weui-cell__price">普通员工</div>
		  </div>
		  <div class="weui-cell">
		    <div class="weui-cell__bd">
		      员工部门
		    </div>
		    <div class="weui-cell__price">软件部</div>
		  </div>
		  <div class="weui-cell">
		    <div class="weui-cell__bd">
		      手机号码
		    </div>
		    <div class="weui-cell__price">13728936556</div>
		  </div>
		  <div class="weui-cell">
		    <div class="weui-cell__bd">
		      所在城市
		    </div>
		    <div class="">重庆九龙坡</div>
		  </div>
		  <div class="weui-cell weui-cell_access">
		    <div class="weui-cell__bd">
		      姓别
		    </div>
		    <div class="weui-cell__price">男</div>
		  </div>
		  <div class="weui-cell">
		    <div class="weui-cell__bd">
		      出生年月
		    </div>
		    <div class="">1992-08-21</div>
		  </div>
		  <div class="weui-cell">
		    <div class="weui-cell__bd">
		      QQ
		    </div>
		    <div class="weui-cell__price">1390391475</div>
		  </div>
		  <div class="weui-cell">
		    <div class="weui-cell__bd">
		      电子邮箱
		    </div>
		    <div class="weui-cell__price">1390391475@qq.com</div>
		  </div>
		</div>
    </div>
	<script src="${ctxStatic}/weui/js/jquery.min.js"></script>
	<script src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
</body>
</html>