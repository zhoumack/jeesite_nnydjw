<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>审批</title>
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
   	<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css">
	<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css">
	<style>
	   	.weui-grid:before{
    		border: none;
    	}
    	.weui-grid:after{
    		border: none;
    	}
   </style>
</head>
<body>
	<!--头部-->
	<div class="header">
		<a href="${ctx}/main/index" class="img_left">
			<img src="${ctxStatic}/weui/img/xiangzuo.png" />
		</a>
		<p>审批</p>
	</div>
	<!--内容区-->
	 <div class="weui-grids">
        <a href="${ctx}/shenpi/qingjia/form" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="${ctxStatic}/weui/img/qingjia.png" alt="">
            </div>
            <p class="weui-grid__label">请假</p>
        </a>
        <a href="${ctx}/shenpi/chuchai/form" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="${ctxStatic}/weui/img/chuchai.png" alt="">
            </div>
            <p class="weui-grid__label">出差</p>
        </a>
        <a href="${ctx}/shenpi/paiche/form" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="${ctxStatic}/weui/img/paiche.png" alt="">
            </div>
            <p class="weui-grid__label">派车</p>
        </a>
        <a href="${ctx}/shenpi/weixiu/form" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="${ctxStatic}/weui/img/weixiu.png" alt="">
            </div>
            <p class="weui-grid__label">维修</p>
        </a>
        <a href="${ctx}/shenpi/baoxiao/form" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="${ctxStatic}/weui/img/baoxiao.png" alt="">
            </div>
            <p class="weui-grid__label">报销</p>
        </a>
        <a href="${ctx}/shenpi/yongzhang/form" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="${ctxStatic}/weui/img/yongzhang.png" alt="">
            </div>
            <p class="weui-grid__label">用章</p>
        </a>
        <a href="${ctx}/shenpi/waichu/form" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="${ctxStatic}/weui/img/waichu.png" alt="">
            </div>
            <p class="weui-grid__label">外出</p>
        </a>
        <a href="${ctx}/shenpi/bgyplqsq/form" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="${ctxStatic}/weui/img/lingyong.png" alt="">
            </div>
            <p class="weui-grid__label">办公品领用</p>
        </a>
        <a href="${ctx}/shenpi/jiedai/form" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="${ctxStatic}/weui/img/jiedai.png" alt="">
            </div>
            <p class="weui-grid__label">接待</p>
        </a>
        <a href="${ctx}/shenpi/gdzcsq/form" class="weui-grid">
            <div class="weui-grid__icon">
                <img src="${ctxStatic}/weui/img/caigou.png" alt="">
            </div>
            <p class="weui-grid__label">固定资产采购</p>
        </a>
    </div>
    <div class="footer">
		<div class="footer_dv">
			<a href="${ctx}/shenpi/list">
				<img class="footer_dv_img" src="${ctxStatic}/weui/img/new.png" />
				<p class="footer_dv_p tab_color">新申请</p>
			</a>
		</div>
		<div class="footer_dv pr">
			<a href="${ctx}/shenpi/wode">
				<img class="footer_dv_img" src="${ctxStatic}/weui/img/woshenpi1.png" />
				<span class="weui-badge pa">5</span>
				<p class="footer_dv_p">我审批的</p>
			</a>
		</div>
		<div class="footer_dv pr">
			<a href="${ctx}/shenpi/yitijiao">
				<img class="footer_dv_img" src="${ctxStatic}/weui/img/tijiao.png" />
				<span class="weui-badge pa">3</span>
				<p class="footer_dv_p">已提交</p>
			</a>
		</div>
	</div>
</body>
</html>