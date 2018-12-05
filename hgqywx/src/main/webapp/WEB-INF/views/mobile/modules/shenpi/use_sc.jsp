<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>使用手册</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="${ctxStatic}/mui/css/mui.min.css" />
</head>
<body>
	<style>
	body{
   		background-color: #fff !important;
   	}
   	p{
   		color: #000;
   	}
   	.pc_sc{
   		
   	}
   	.use_p{
   		padding: 8px 30px;color: #000000;text-indent: 25px;
   	}
   	.text_i{
   		text-indent: 25px;
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
<div class="mui-scroll-wrapper">
	<div class="mui-scroll">
<h4 style="text-align: center;">企业微信使用手册</h4>
	<p class="use_p">企业微信，是腾讯微信团队为企业打造的专业办公管理工具。与微信一致的沟通体验，丰富免费的OA应用，并与微信消息、小程序、微信支付等互通，助力企业高效办公和管理。</p>
	<p class="use_p" style="padding: 0 30px;">安装企业微信移动客户端后，可先在手机上创建企业，先行体验企业微信的便捷高效。</p>
	<div style="padding-top: 20px;">
		<h4 class="text_i">一、手机创建企业</h4>
		<p class="text_i">1、选择微信登录</p>
		<p class="text_i">2、进行登录授权</p>
		<p class="text_i">3、输入手机号码以及企业邮箱账号</p>
		<p class="text_i">4、填写公司名称以及人员姓名</p>
		<p class="text_i">5、创建成功，开始体验企业微信</p>
		<div style="text-align: center;padding-top: 10px;">
			<img style=width:80%;margin: 10px;" src="${ctxStatic}/mui/image/1_1.jpg" width="150"/>
		</div>
	</div>
	<!--电脑注册企业-->
	<div style="padding-top: 20px;">
		<h4 style="text-indent: 25px;">二、电脑注册企业</h4>
		<p style="padding: 0px 30px;color: #000000;text-indent: 25px;">
			手机创建企业之后，你可以访问企业微信官网，提交企业注册。手机创建企业并非必须步骤，管理员也可跳过此步，直接通过官网创建和注册企业。
		</p>
		<div  style="padding: 8px 30px;font-size: 13px;">
			<p style="text-indent: 25px;">1、用电脑访问企业微信官网work.weixin.qq.com，点击右上角【企业注册】</p>
			<div style="text-align: center;">
				<img src="${ctxStatic}/mui/image/6.png" width="250"/>
			</div>
		</div>
		<div style="padding: 8px 30px;font-size: 13px;>
			<p style="text-indent: 25px;">2、用电脑访问企业微信官网work.weixin.qq.com，点击右上角【企业注册】</p>
			<div style="text-align: center;">
				<img src="${ctxStatic}/mui/image/7.png" width="250"/>
			</div>
		</div>
		<div style="padding: 8px 30px;font-size: 13px;>
			<p style="text-indent: 25px;">3、在对应主体类型下方填写企业名称，完善企业信息</p>
			<div style="text-align: center;">
				<img src="${ctxStatic}/mui/image/8.png" width="250"/>
			</div>
		</div>
		<div style="padding: 8px 30px;font-size: 13px;>
			<p style="text-indent: 25px;">4、提交管理员详细信息，包括姓名、手机，并收取及填写手机短信验证码</p>
			<div style="text-align: center;">
				<img src="${ctxStatic}/mui/image/9.png" width="250"/>
			</div>
		</div>
		<div style="padding: 8px 30px;font-size: 13px;>
			<p style="text-indent: 25px;">5、打开微信扫描页面下方的二维码进行管理员微信绑定。绑定成功后，即可用此微信登录管理后台。</p>
			<div style="text-align: center;">
				<img src="${ctxStatic}/mui/image/10.png" width="250"/>
			</div>
		</div>
		<div style="padding: 8px 30px;font-size: 13px;>
			<p style="text-indent: 25px;">6、勾选同意服务协议后，提交注册申请</p>
			<div style="text-align: center;">
				<img src="${ctxStatic}/mui/image/11.png" width="250"/>
			</div>
		</div>
		<div style="padding: 8px 30px;font-size: 13px;>
			<p style="text-indent: 25px;">7、用电脑访问企业微信官网work.weixin.qq.com，点击右上角【企业登录】。用此前绑定的管理员微信扫描屏幕上方二维码，登录管理后台。</p>
			<div style="text-align: center;">
				<img src="${ctxStatic}/mui/image/12.png" width="250"/>
			</div>
		</div>
	</div>
	<!--手机端邀请-->
	<div style="padding-top: 20px;">
		<h4 style="text-indent: 25px;">三、手机端邀请成员</h4>
		<p style="padding: 0px 30px;color: #000000;text-indent: 25px;">
			手机创建企业之后，你可以访问企业微信官网，提交企业注册。手机创建企业并非必须步骤，管理员也可跳过此步，直接通过官网创建和注册企业。
		</p>
		<p style="padding: 0px 30px;color: #000000;text-indent: 25px;">
			在没有通讯录的情况下，你可以选择用企业微信手机端分享邀请链接或微信二维码，快速邀请成员加入。
		</p>
		<div  style="padding: 8px 30px;font-size: 13px;">
			<p style="font-size: 15px;">
				 1、发送微信邀请
			</p>
			<p>设置入口：【手机端】>【会话列表】>【右上角+】>【邀请同事】。
企业微信手机客户端，切换至【通讯录】，在页面最底部，点击蓝色字样。点击底部【邀请加入】即可发送邀请通知。</p>
			<div style="text-align: center;">
				<img style="width: 100%;margin: 10px;" src="${ctxStatic}/mui/image/1_2.jpg" width="150"/>
			</div>
		</div>
		<div  style="padding: 8px 30px;font-size: 13px;">
			<p style="font-size: 15px;">
				 2、通过添加成员邀请
			</p>
			<p>设置入口：【手机端】>【通讯录】>【添加成员】。</p>
			<div style="text-align: center;">
				<img style="width: 100%" src="${ctxStatic}/mui/image/1_3.jpg" width="150"/>
			</div>
		</div>
		<div  style="padding: 8px 30px;font-size: 13px;">
			<p style="font-size: 15px;">
				3、微信二维码邀请
			</p>
			<p>设置入口：【管理后台】>【管理工具】>【成员加入】>【分享二维码】
可以将二维码制作成实体，供成员扫描。</p>
		</div>
		<div  style="padding: 8px 30px;font-size: 13px;">
			<p style="font-size: 15px;">
				 4、在手机上批量邀请
			</p>
			<p>对未加入企业的部分成员，管理员可通过以下步骤在手机上批量邀请。</p>
			<div style="text-align: center;">
				<img style="width: 100%" src="${ctxStatic}/mui/image/1_4.jpg" width="150"/>
			</div>
		</div>
	</div>
	
	<!--综合事务-->
	<div style="padding-top: 20px;">
		<h4 style="text-indent: 25px;">四、综合事务</h4>
		<p style="padding: 0px 30px;color: #000000;text-indent: 25px;">
			企业微信提供丰富的审批模板和精细化的审批设置，帮助你为企业办公定制更规范高效的审批流程。
		</p>
		<div  style="padding: 8px 30px;font-size: 13px;">
			<p style="font-size: 15px;">
				设置入口：【手机端】>【工作台】>【移动检务】
			</p>
			<div style="text-align: center;">
				<img style="width: 100%;margin: 10px;" src="${ctxStatic}/mui/image/1_5.jpg" width="150"/>
			</div>
		</div>
		
		<!--请假-->
		<div  style="padding: 8px 30px;font-size: 13px;">
			<p style="font-size: 15px;">
				 1、请假
			</p>
			<p>1)申请人请假</p>
			<p>点击栏目中【请假】，进入页面，在填写所有必填项后提交，即可完成请假申请</p>
			<div style="text-align: center;">
				<img style="width: 40%" src="${ctxStatic}/mui/image/23.png" width="150"/>
			</div>
			<p>2)审批人审核</p>
			<p>在【消息栏】或【工作台】>【移动检务】>【审批审核】可查看到待审核处理数据，点击进入即可审批</p>
			<div style="text-align: center;">
				<img style="width: 40%" src="${ctxStatic}/mui/image/24.png" width="150"/>
			</div>
			<p>审批人可根据情况对申请流程选择：【同意】、【不同意】、【继续审批】三种选择。“同意”、“不同意”选择后，流程直接结束。“继续审批”则是添加下一个审批人进行请假审批</p>
		</div>
		
		<!--派车-->
		<div  style="padding: 8px 30px;font-size: 13px;">
			<p style="font-size: 15px;">
				2、派车
			</p>
			<p>1)申请派车</p>
			<p>点击栏目中【派车】，进入页面，在填写所有必填项后提交，即可完成派车申请</p>
			<div style="text-align: center;">
				<img style="width: 40%" src="${ctxStatic}/mui/image/25.png" width="150"/>
			</div>
			<p>2)审批人审核</p>
			<p>在【消息栏】或【工作台】>【移动检务】>【审批审核】可查看到待审核处理数据，点击进入即可审批</p>
			<div style="text-align: center;">
				<img style="width: 40%" src="${ctxStatic}/mui/image/26.png" width="150"/>
			</div>
			<p>审批人可根据情况对申请流程选择：【同意】、【不同意】操作，流程根据实际情况进行流转。</p>
		</div>
		
		<!--设备维修-->
		<div  style="padding: 8px 30px;font-size: 13px;">
			<p style="font-size: 15px;">
				3、设备维修
			</p>
			<p>1)申请维修</p>
			<p>点击栏目中【设备维修】，进入页面，在填写所有必填项后提交，即可完成设备申请</p>
			<div style="text-align: center;">
				<img style="width: 40%" src="${ctxStatic}/mui/image/27.png" width="150"/>
			</div>
			<p>2)审批人审核</p>
			<p>在【消息栏】或【工作台】>【移动检务】>【审批审核】可查看到待审核处理数据，点击进入即可审批。</p>
			<div style="text-align: center;">
				<img style="width: 40%" src="${ctxStatic}/mui/image/28.png" width="150"/>
			</div>
			<p>审批人可根据情况对申请流程选择：【同意】、【不同意】操作，流程根据实际情况进行流转。</p>
		</div>
		
		<!--耗材配件-->
		<div  style="padding: 8px 30px;font-size: 13px;">
			<p style="font-size: 15px;">
				4、耗材配件
			</p>
			<p>1)申请耗材配件</p>
			<p>点击栏目中【耗材】，进入页面，在填写所有必填项后提交，即可完成耗材申请</p>
			<div style="text-align: center;">
				<img style="width: 40%" src="${ctxStatic}/mui/image/29.png" width="150"/>
			</div>
			<p>2)审批人审核</p>
			<p>在【消息栏】或【工作台】>【移动检务】>【审批审核】可查看到待审核处理数据，点击进入即可审批</p>
			<div style="text-align: center;">
				<img style="width: 40%" src="${ctxStatic}/mui/image/30.png" width="150"/>
			</div>
			<p>审批人可根据情况对申请流程选择：【同意】、【不同意】操作，流程根据实际情况进行流转。</p>
		</div>
	</div>
	</div>
</div>
	<script src="${ctxStatic}/mui/js/mui.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
	<script>
	mui('.mui-scroll-wrapper').scroll({
		deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
	});
	 /*控件拖动并返回  */
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
		startX = e.originalEvent.targetTouches
	
	[0].pageX; //获取点击点的X坐标    
		startY = e.originalEvent.targetTouches
	
	[0].pageY; //获取点击点的Y坐标
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
		moveX = e.originalEvent.targetTouches
	
	[0].pageX; //移动过程中X轴的坐标
		moveY = e.originalEvent.targetTouches
	
	[0].pageY; //移动过程中Y轴的坐标
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

</body>

</html>