<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/style.css" />
<script type="text/javascript" src="${ctxStatic}/weui/js/zepto.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/vue.min.js"></script>
<title>选择部门</title>
<style>
	#txiang {
		padding-left: 20px;
	}
	
	.item {
		cursor: pointer;
	}
	
	ul {
		padding-left: 1em;
		line-height: 1.5em;
		list-style: none;
		color: #2d2828;
	}
	._box{
		width: 100%;height: 50px;border: 1px solid #CCCCCC;background-color: #FFFFFF;position: absolute;bottom: 0;
	}
	._box_dv{
		width:50px;height: 40px;float: right;background-color: #4669f2;text-align: center;line-height: 40px;margin-top: 5px;color: white;border-radius: 5px;
	}
	.weui-cells:after{
		border: none;
	}
	.weui-cells:before{
		border: none;
	}
</style>
</head>
<body>
<!--头部-->
		<div class="header">
			<a href="#" class="img_left">
				<img src="${ctxStatic}/weui/img/xiangzuo.png" />
			</a>
			<p>抄送</p>
		</div>
		<!--内容区-->
		<form id="form">
			<a href="#" class="weui-media-box weui-media-box_appmsg weui-cells">
				<div class="weui-media-box__bd">
					<h4 class="weui-media-box__title">抄送人</h4>
					<p  class="weui-media-box__desc">
						<span id="tid" style="position: relative;"></span>
						<img class="open-popup" id="abc" src="${ctxStatic}/weui/img/tianjia.png" width="60px" height="60px" />
					</p>
				</div>
			</a>
			<a href="tongzhi.html" class="btn_div" id="formSubmitBtn">
				<button id="btn" type="submit">提交</button>
			</a> 
		</form>
		<!--弹出页面-->
		<div id="half" class="weui-popup__container">
			<div class="weui-popup__overlay"></div>
			<div class="weui-popup__modal" id="app">
				<!--头部导航-->
				<div class="header">
					<a href="#" class="img_left" id="aaa">
						<img src="${ctxStatic}/weui/img/xiangzuo.png" />
					</a>
					<p>选择人员</p>
				</div>
				<!--内容区..........列表-->
				<div class="overlay" style="top: 45px;">
       				 <div class="overlay-content scrolling">
						<script type="text/x-template" id="item-template">
							<li>
								<div :class="{bold: isFolder}" @click="toggle" @dblclick="changeType">
									<div class="weui-cells weui-cells_checkbox">
										<label class="weui-cell weui-check__label" v-bind:for="model.id" style="width: 10%;float: left;">
								      <input type="checkbox" class="weui-check" name="checkbox1" v-bind:id="model.id" v-bind:class="getId(model.pid)" @click="change_val(model.id,model.layer,model.name,model.type)" >
								      <i class="weui-icon-checked"></i>
								  	</label>
										<div id="name" class="weui-cell__bd" style="line-height:42px;">
											<img v-if="model.type==1" src="${ctxStatic}/weui/img/bumen1.png" height="20px" width ="20px"></img>
											<span><img v-if="model.type==2" src="${ctxStatic}/weui/img/anjianzhencha.png" width="20px" height="20px"></span>
											<span>{{ model.name }}</span>
											<p style="display: none;">{{model.id}}</p>
										</div>
									</div>
								</div>
								<ul v-show="open" v-if="isFolder">
									<item class="item" v-for="(model, index) in model.children" :key="index" :model="model"></item>
								</ul>
						</script>
						<ul id="demo" style="background-color: white;">
							<item class="item" :model="treeData"></item>
						</ul>
					</div>
				</div>
				<div class="_box">
					<div class="_box_dv" onclick="add()">确定</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>

		<script type="text/javascript">
			Vue.component('item', {
				template: '#item-template',
				props: {
					model: Object
				},
				data: function() {
					return {
						open: false
					}
				},
				computed: {
					isFolder: function() {
						return this.model.children && this.model.children.length
					}
				},
				methods: {
					toggle: function() {
						if(this.isFolder) {
							this.open = !this.open
						}
					},
					changeType: function() {
						if(!this.isFolder) {
							Vue.set(this.model, 'children', [])
							this.addChild()
							this.open = true
						}
					},
					change_val: function(_id, _layer,_name,_type) {
						if($("#" + _id).prop('checked') == true){
							var p = $('<span id="' + _id + '" name="username" style="padding: 10px">' + _name + '<img id="deimg" src="${ctxStatic}/weui/img/chahao.png"  onclick="del()" width="15px" height="15px" style="position: absolute;"/></span>');
							if(!$("._box").children('span[id=' + _id + ']').text()) {
								$("._box").append(p);
							} else {
								$.toast("已添加", "text");
	
							}
						}
						else{
							$("._box span").eq($(this).index()).remove();
						}
//						console.log($("#" + _id).prop('checked'));
						if(_layer == 1) { //一级
							if($("#" + _id).prop('checked')){
								$("#demo").find('input[type="checkbox"]').prop('checked',true);
							}else{
								$("#demo").find('input[type="checkbox"]').prop('checked',false);
							}
						}
						if(_layer == 2) { //二级
							var ach = $('#' + _id).parent().parent().parent().parent();
							var _ul = ach.find('ul');
							if($("#" + _id).prop('checked')) {
								_ul.find('input[type="checkbox"]').prop('checked', true);
							} else {
								_ul.find('input[type="checkbox"]').prop('checked', false);
							}
							
							//选择一级
							var p_ul = ach.parent();
							var tow_all_ch = true;
							p_ul.find('input[type="checkbox"]').each(function(){
								if(!$(this).prop('checked')){
									tow_all_ch = false;
									return false;
								}
							});
							if(tow_all_ch){
								p_ul.prev('.bold').find('input[type="checkbox"]').prop('checked', true);
							}else{
								p_ul.prev('.bold').find('input[type="checkbox"]').prop('checked', false);
							}
						}
						if(_layer == 3) { //三级
							var _ul = $('#' + _id).parent().parent().parent().parent().parent();
							var is_all_ch = true;
							var _ul2 = _ul.find('ul');
							if($("#" + _id).prop('checked')) {
								_ul2.find('input[type="checkbox"]').prop('checked', true);
							} else {
								_ul2.find('input[type="checkbox"]').prop('checked', false);
							}
							_ul.find('input[type="checkbox"]').each(function() {
								if(!$(this).prop('checked')) {
									is_all_ch = false;
									return false;
								}
							});
							if(is_all_ch) {
								_ul.prev('.bold').find('input[type="checkbox"]').prop('checked', true);
							} else {
								_ul.prev('.bold').find('input[type="checkbox"]').prop('checked', false);
							}
							//选择一级
							var p_ul = _ul.parent().parent();
							var tow_all_ch = true;
							p_ul.find('input[type="checkbox"]').each(function(){
								if(!$(this).prop('checked')){
									tow_all_ch = false;
									return false;
								}
							});
							if(tow_all_ch){
								p_ul.prev('.bold').find('input[type="checkbox"]').prop('checked', true);
							}else{
								p_ul.prev('.bold').find('input[type="checkbox"]').prop('checked', false);
							}
						}
						if(_layer == 4) { //四级
							var _ul1 = $('#' + _id).parent().parent().parent().parent().parent();
							var is_all_ch1 = true;
							_ul1.find('input[type="checkbox"]').each(function() {
								if(!$(this).prop('checked')) {
									is_all_ch1 = false;
									return false;
								}
							});
							console.log(is_all_ch1);
							if(is_all_ch1){
								_ul1.prev('.bold').find('input[type="checkbox"]').prop('checked', true);
							}else{
								_ul1.prev('.bold').find('input[type="checkbox"]').prop('checked', false);
							}
							//选择一级
							var p_ul = _ul1.parent().parent().parent();
							var tow_all_ch = true;
							p_ul.find('input[type="checkbox"]').each(function(){
								if(!$(this).prop('checked')){
									tow_all_ch = false;
									return false;
								}
							});
							if(tow_all_ch){
								p_ul.prev('.bold').find('input[type="checkbox"]').prop('checked', true);
							}else{
								p_ul.prev('.bold').find('input[type="checkbox"]').prop('checked', false);
							}
							
						}
					},
					getId: function(_id) {
						return 'class_' + _id;
					},
				}
			})
			var demo = new Vue({
				el: '#demo',
				data: {
					treeData: []
				}
			})
			$.ajax({
				type: "get",
				url: '${ctxStatic}/weui/test.json',
				async: false,
				beforeSend: function() {},
				success: function(data) {
					demo.treeData = data[0];
					demo.cdata = data[0].children
				},
				error: function() {
					$.toptip('加载失败', 'error');
				}
			});
			//添加值到抄送界面
			function add() {
				var val = $("._box").children("span")
//				console.log(val);
				$("#tid").append(val);
				$.closePopup("#half");
			}
			//删除选中的值
			function del() {
//				$("._box span").eq($(this).index()).remove();
				$("#tid span").eq($(this).index()).remove();
			}
			$(document).on("click", "#abc", function() {
				$("#half").popup();
			});
			$(document).on("click", "#aaa", function() {
				$.closePopup("#half");
			});
		</script>
</body>
</html>