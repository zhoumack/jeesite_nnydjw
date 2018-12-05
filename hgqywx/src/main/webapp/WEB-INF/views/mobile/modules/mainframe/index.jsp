<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>重庆市南岸区人民检察院</title>
<link rel="stylesheet" href="${ctxStatic}/mui/css/mui.min.css">
<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css">
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css">
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<style>
.mui-content {
	padding-top: 10px;
}

* {
	margin: 0;
	padding: 0;
}

.z_menu {
	width: 95%;
	height: 110px;
	background-color: #FFFFFF;
	margin: 0 auto;
	border-radius: 5px;
	position: absolute;
	top: 175px;
	left: 0;
	right: 0;
	box-shadow: 1px 2px #E7E7EB;
}

.z_menu_dv {
	width: 33%;
	text-align: center;
	float: left;
	padding-top: 20px;
	line-height: 30px;
}

.z_menu_dv1 {
	width: 25%;
	text-align: center;
	float: left;
	padding-top: 20px;
	line-height: 30px;
}

.z_menu_dv1 p {
	color: #999999;
	font-size: 12px;
}

.office_menu {
	width: 95%;
	background-color: #ffffff;
	height: 150px;
	border-radius: 5px;
}

.office_menu_dv1 {
	padding-left: 10px;
	padding-top: 10px;
	border-bottom: 1px solid #DCDCDC;
}

.office_menu_dv1 span {
	position: absolute;
	padding-left: 10px;
}

.office_menu_dv2 {
	padding-top: 8px;
	padding-left: 8px;
	width: 44%;
	float: left;
}

.office_menu_dv2 img {
	width: 120px;
	height: 80px;
}

.office_menu_dv2 p {
	font: "微软雅黑";
	font-size: 15px;
}

.bg_tu {
	width: 100%;
	height: 195px;
	background-image: url(${ctxStatic}/mui/img/BG@3x.png);
	background-size: 100% 100%;
}

.bg_tu_left {
	position: absolute;
	top: 10px;
	left: 10px;
}

.bg_tu_right {
	position: absolute;
	top: 10px;
	right: 10px;
}

.center_st {
	z-index: 999;
	position: absolute;
	top: 334px;
}

.center_st_dv1 {
	width: 95%;
	height: 150px;
	background-color: #FFFFFF;
	border-radius: 5px;
	margin: 0 auto;
	box-shadow: 1px 1px #E7E7EB;
}

.center_st_dv2 {
	width: 95%;
	height: 210px;
	background-color: #FFFFFF;
	border-radius: 5px;
	margin: 0 auto;
	margin-top: 10px;
	box-shadow: 1px 1px #E7E7EB;
}

.center_st_dv3 {
	width: 95%;
	background-color: #FFFFFF;
	border-radius: 5px;
	margin: 0 auto;
	margin-top: 10px;
	box-shadow: 1px 1px #E7E7EB;
}

.center_st_dv3_dv {
	padding-top: 10px;
	border-bottom: 1px solid #DCDCDC;
}

.center_st_dv3_dv img {
	width: 34%;
	float: left;
	padding-left: 10px;
}

.text_dv {
	width: 66%;
	float: right;
}

.text_dv_p1 {
	padding-left: 10px;
	font-size: 18px;
	color: #333333;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.text_dv_p2 {
	color: #887F7F;
	padding-left: 10px;
	line-height: 18px;
	font-size: 12px;
}

a {
	text-decoration: none;
	color: #000000;
}

/* .mui-slider {
	padding-top: 10px;
} */

.mui-table-view.mui-grid-view {
	width: 100%;
	/* border-radius: 8px; */
	margin: 0 auto;
}

.office_menu_dv {
	border-bottom: 1px solid #DCDCDC;
	height: 30px;
	padding-top: 5px;
}

.office_menu_dv span {
	padding-left: 10px;
	font-size: 15px;
}

.office_menu_dv img {
	line-height: 30px;
	margin-left: 10px;
}

.mui-media-body {
	font-size: 14px;
}
.pa1{
	position: absolute;
	left:70px;
	top:15px;
}
.mui-active{
	background-color: #2d44cd !important;
}

.image {
	width:160px !important;
	height: 116px !important;
}


</style>

</head>


<body bgcolor="#F5F5F5">
	<div style="position: relative;">
		<div class="bg_tu" style="text-align: center;">
			<%-- <img class="bg_tu_left" src="${ctxStatic}/mui/img/list.png"
				width="20px" height="15px" />  --%>
			<%-- <img src="${ctxStatic}/mui/img/LOGO@3x.png" style="width: 50%;position: relative;top:10px;"> --%>
			<%-- <img class="bg_tu_right" src="${ctxStatic}/mui/img/sourch.png" width="20px" height="20px" /> --%>
		</div>
		<div class="z_menu">
			<div class="z_menu_dv">
				<a href="${ctx}/main/shenqing"> 
					<img src="${ctxStatic}/mui/img/zonghe.png" width="35px" height="35px" />
					<p>综合事务</p>
				</a>
				<span class="weui-badge pa1" id="num"></span>
			</div>
			
			<div class="z_menu_dv">
				<a href="${ctx}/main/gerenshiwu">
					<img src="${ctxStatic}/mui/img/geren.png" width="35px" height="35px" />
					<p>个人事务</p>
				</a>
			</div>
			<div class="z_menu_dv">
				<a href="${ctx}/main/fuzhubanan">
					<img src="${ctxStatic}/mui/img/banan.png" width="35px" height="35px" />
					<p>辅助办案</p>
				</a>
			</div>
		</div>
	</div>
	<div id="vue_content" class="mui-content" style="margin-top: 90px;">
		<div class="center_st_dv1">
			<div class="office_menu_dv">
				<img src="${ctxStatic}/mui/img/yingyong.png" width="20px"
					height="20px" /> <span style="position: absolute;">常用应用</span>
			</div>
			
			<div class="mui-slider">
		        <div class="mui-slider-group mui-slider-loop">
		        	<!-- 额外增加的一个节点(循环轮播：第一个节点是最后一个图文表格) -->
		            <div class="mui-slider-item mui-slider-item-duplicate">
		                <ul class="mui-table-view mui-grid-view">
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/weihu1.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">日常维护</div></a></li>
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/huiyi.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">会议管理</div></a></li>
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/renwuanp.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">任务安排</div></a></li>
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/yongz.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">用章申请</div></a></li>
		                </ul>
		            </div>
		            <div class="mui-slider-item">
		                <ul class="mui-table-view mui-grid-view">
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/weihu1.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">日常维护</div></a></li>
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/huiyi.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">会议管理</div></a></li>
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/renwuanp.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">任务安排</div></a></li>
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/yongz.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">用章申请</div></a></li>
		                </ul>
		            </div>
		            <div class="mui-slider-item">
		                <ul class="mui-table-view mui-grid-view">
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/weihu1.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">日常维护</div></a></li>
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/huiyi.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">会议管理</div></a></li>
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/renwuanp.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">任务安排</div></a></li>
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/yongz.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">用章申请</div></a></li>
		                </ul>
		            </div>
		            <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一个图文表格) -->
		            <div class="mui-slider-item mui-slider-item-duplicate">
		               <ul class="mui-table-view mui-grid-view">
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/weihu1.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">日常维护</div></a></li>
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/huiyi.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">会议管理</div></a></li>
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/renwuanp.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">任务安排</div></a></li>
		                    <li class="mui-table-view-cell mui-media mui-col-xs-3"><a href="#"><img class="mui-media-object" src="${ctxStatic}/mui/img/yongz.png" style="width:45px;height:45px" />
		                            <div class="mui-media-body">用章申请</div></a></li>
		                </ul>
		            </div>
		        </div>
		        <div class="mui-slider-indicator mui-text-center" style="position: relative;">
						<div class="mui-indicator mui-active"></div>
						<div class="mui-indicator"></div>
				 </div>
		    </div>
		    
		</div>
		
		<div class="center_st_dv2">
			<div class="office_menu_dv">
				<img src="${ctxStatic}/mui/img/tuijian.png" width="20px" height="20px" /> <span style="position: absolute;">推荐阅读</span>
			</div>
			
			<!-- 循环动态 --> 
				<div class="mui-slider">
			        <div class="mui-slider-group mui-slider-loop">
			        	<div>检察动态</div>
			        	<!-- 额外增加的一个节点(循环轮播：第一个节点是最后一个图文表格) -->
			            <div class="mui-slider-item mui-slider-item-duplicate" >
			                <ul class="mui-table-view mui-grid-view">
			                    <li class="mui-table-view-cell mui-media mui-col-xs-6" v-for="(item,index) in items" v-if="index==0 || index==1">
			                    <a v-bind:href='"${ctx}/cms/article/formData?id="+item.id'>
			                    	<img class="mui-media-object image" v-bind:src="item.image">
			                            <div class="mui-media-body">{{item.title}}</div>
			                     </a>
			                     </li>
			                </ul>
			            </div>
						 <div class="mui-slider-item">
			                <ul class="mui-table-view mui-grid-view">
			                    <li class="mui-table-view-cell mui-media mui-col-xs-6" v-for="(item,index) in items" v-if="index==0 || index==1">
			                    <a v-bind:href='"${ctx}/cms/article/formData?id="+item.id'>
			                    	<img class="mui-media-object image" v-bind:src="item.image">
			                            <div class="mui-media-body">{{item.title}}</div>
			                     </a>
			                     </li>
			                    
			                </ul>
			            </div>
			           <div class="mui-slider-item">
			                <ul class="mui-table-view mui-grid-view">
			                    <li class="mui-table-view-cell mui-media mui-col-xs-6" v-for="(item,index) in items" v-if="index==3 || index==2">
			                    <a v-bind:href='"${ctx}/cms/article/formData?id="+item.id'>
			                    <img class="mui-media-object image" v-bind:src="item.image">
			                            <div class="mui-media-body">{{item.title}}</div></a></li>
			                    
			                </ul>
			            </div>
			          <%--  额外增加的一个节点(循环轮播：最后一个节点是第一个图文表格)--%>
			            <div class="mui-slider-item mui-slider-item-duplicate">
			                <ul class="mui-table-view mui-grid-view">
			                    <li class="mui-table-view-cell mui-media mui-col-xs-6" v-for="(item,index) in items" v-if="index==3 || index==2">
			                    <a v-bind:href='"${ctx}/cms/article/formData?id="+item.id'>
			                    <img class="mui-media-object image" v-bind:src="item.image">
			                            <div class="mui-media-body">{{item.title}}</div></a></li>
			                </ul>
			            </div>
			        </div> 
			        
			        
			        <div class="mui-slider-indicator mui-text-center">
						<div class="mui-indicator mui-active"></div>
						<div class="mui-indicator"></div>
					</div>
			    </div>
			
			
			
			<%-- <act:articleList procInsId=""></act:articleList> --%>
		    
		</div>

		<div class="center_st_dv3">
			<div class="office_menu_dv">
				<img src="${ctxStatic}/mui/img/dongtai.png" width="20px" height="20px" /> <span
					style="position: absolute;">检察动态</span>
			</div>
			<div class="center_st_dv3_dv " v-for="(item,index) in items" v-if="index<2">
				<a v-bind:href='"${ctx}/cms/article/formData?id="+item.id'>
				<img v-bind:src="item.image" width="100px" height="88px" />
				<div class="text_dv">
					<p class="text_dv_p1">{{item.title}}</p>
					<p class="text_dv_p2">做到五个坚持，给西部留下不走的老师做到 五个坚持...</p>
					<p class="text_dv_p2">
						2018-09-17</span>
				</div>
				</a>
				<br style="clear: both;">
			</div>
			
			<div class="center_st_dv3_dv "  v-for="(item,index) in items" v-if="index==2">
					<button style="margin-left: 40%">查看更多</button>
			</div>
			
			
		</div> 
		
	</div>
</body>
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js" ></script>
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/vue.min.js"></script>
<script type="text/javascript" >
		var vue = new Vue({
			el: '#vue_content',
			data: {
				items: []
			}
		});
		
		var slider = mui("#slider");
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
		});
		
		$.ajax({
			url:"${ctx}/cms/article/listData?category.id=900b1464226a4f619bec61f03792ac10",
			type:"get",
			success:function(jsonData){
				vue.items = jsonData;
			},
			error:function(e){
				alert("不明错误");
			}
		});
		
		
		});
		
</script>
</html>