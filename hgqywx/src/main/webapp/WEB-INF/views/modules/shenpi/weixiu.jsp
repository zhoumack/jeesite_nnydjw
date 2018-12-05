<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="${ctxStatic}/weui/css/public.css" />
    <link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
    <link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
    <link rel="stylesheet" href="${ctxStatic}/weui/css/style.css" />
    <title>日常维修</title>
    <style>
    	
    </style>
</head>
<body>
	<!--头部-->
	<div class="header">
		<a href="${ctx}/shenpi" class="${ctxStatic}/weui/img/img_left">
			<img src="${ctxStatic}/weui/img/xiangzuo.png" />
		</a>
		<p>日常维修</p>
	</div>
	<!--内容区-->
	<form:form id="form" modelAttribute="weixiu" action="${ctx}/shenpi/weixiu/save" method="post">
		<form:hidden path="id"/>
		<form:hidden path="act.taskId"/>
		<form:hidden path="act.taskName"/>
		<form:hidden path="act.taskDefKey"/>
		<form:hidden path="act.procInsId"/>
		<form:hidden path="act.procDefId"/>
		<form:hidden path="user.id"/>
		<form:hidden id="flag" path="act.flag"/>
		<div class="weui-cells weui-cells_form">
	  		<div class="weui-cell">
			    <div class="weui-cell__hd">
			    	<label class="weui-label">
			    	申请人
			    	<img src="${weixiu.user.photo}" width="8" height="8" class="f_padding pr10" />
			    	</label>
			    </div>
			    <div class="weui-cell__bd">
			      <input class="weui-input" type="text"  name="userName"  value="${weixiu.userName}" required placeholder="请输入" emptyTips="请输入姓名" notMatchTips="请输入正确的姓名">
			  	</div>
			  	<div class="weui_cell_ft">
	                <i class="weui_icon_warn"></i>
	            </div>
		    </div>
		    <div class="weui-cell">
			    <div class="weui-cell__hd">
			    	<label class="weui-label">
			    		故障设备
			    		<img src="${ctxStatic}/weui/img/xinghao.png" width="8" height="8" class="f_padding pr10" />
			    	</label>
			    </div>
			    <div class="weui-cell__bd">
			      <input class="weui-input" type="text" name="item" value="${weixiu.item}"  placeholder="请输入">
			  	</div>
		    </div>
		    
	    </div>
	    <div class="weui-cells weui-cells_form">
	  		<div class="weui-cell">
			    <div class="weui-cell__hd">
			    	<label for="" class="weui-label">
			    		报修时间
			    		<img src="${ctxStatic}/weui/img/xinghao.png" width="8" height="8" class="f_padding pr10" />
			    	</label>
			    </div>
			    <div class="weui-cell__bd">
			      <input class="weui-input" id="weixiu" type="text" name="date" value="<fmt:formatDate value="${weixiu.date}" type="both" pattern="yyyy-MM-dd HH:mm"/>" placeholder="请选择">
			    </div>
		    </div>
		    <div class="weui-cell">
			    <div class="weui-cell__hd"><label class="weui-label">预计费用</label></div>
			    <div class="weui-cell__bd">
			      <input class="weui-input" type="text" name="fee" value="${weixiu.fee }" placeholder="请输入">
			  	</div>
		    </div>
		</div>
	    <div class="weui-cells__title">
	    	故障描述
	    	<img src="${ctxStatic}/weui/img/xinghao.png" width="8" height="8"/>
	    </div>
		<div class="weui-cells weui-cells_form">
		  	<div class="weui-cell">
			    <div class="weui-cell__bd">
			      <textarea class="weui-textarea" id="weui-textarea" onkeyup="astrict()"  placeholder="请输入200字以内" maxlength="200" rows="3">${weixiu.event}</textarea>
			      <div class="weui-textarea-counter"><span id="astrict-sl">0</span>/200</div>
			    </div>
		  	</div>
		</div>
		<a href="xuanzetuisongren.html" class="weui-media-box weui-media-box_appmsg weui-cells">
	      <div class="weui-media-box__bd">
	        <h4 class="weui-media-box__title">审批人</h4>
	        <p class="weui-media-box__desc">
	    		<img src="${ctxStatic}/weui/img/touxiang.jpg" width="50px" height="50px"/>
	        </p>
	      </div>
	    </a>
	    <a href="#" class="weui-media-box weui-media-box_appmsg weui-cells">
	      	<div class="weui-media-box__bd">
		        <h4 class="weui-media-box__title">抄送人</h4>
		        <p class="weui-media-box__desc">  
		        	<span id="tid" style="position: relative;"></span>
		        	<img class="open-popup" id="abc"  src="${ctxStatic}/weui/img/tianjia.png" width="60px" height="60px"/>
		        </p>
	      	</div>
	    </a>
	    <a href="tongzhi.html" class="btn_div" id="formSubmitBtn" > 
	     	<button id="btn" type="submit">提交</button>
	    </a>
	</form:form>
    <!--选择人员界面-->
    <div id="half" class="weui-popup__container">
	  <div class="weui-popup__overlay"></div>
	  	<div class="weui-popup__modal" id="app">
		 	<!--头部导航-->
			<div class="header"> 
				<a  class="img_left" id="aaa">
					<img src="img/xiangzuo.png" />
				</a>
				<p>选择人员</p>
			</div>
			<!--内容区..........列表-->
		  	<script type="text/x-template" id="item-template">
				<li>
					<div :class="{bold: isFolder}" @click="toggle" @dblclick="changeType">
						<img src="img/bumen.png" width="20" height="20">
						<span>{{ model.name }}</span>
						<p style="display: none;">{{ model.id }}</p>
						<span v-if="isFolder">[{{ open ? '-' : '+' }}]</span>
					</div>
					<ul v-show="open" v-if="isFolder">
						<item class="item" v-for="(model, index) in model.children" :key="index" :model="model"></item>
					</ul>
				</li>
			</script>
			<ul id="demo">
				<item class="item" :model="treeData"></item>
			</ul>
		</div>
	</div>
	<script type="text/javascript" src="js/vue.min.js" ></script>
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/jquery-weui.min.js" ></script>
    <script type="text/javascript">
    	var demo = new Vue({
				el: '#demo',
				data: {
					treeData: [] 
				}
			})
			$.ajax({
				type: "get",
				url: 'test.json',
				async: false,
				success: function(data) {
					demo.treeData = data[0];
					demo.cdata = data[0].children
					console.log(demo.cdata);
				},
//				error: function(){
//					$.toptip('加载失败', 'error');
//				}
			});
    	//人员选择数据循环
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
						return this.model.children &&this.model.children.length
					}
				},
				methods: {
					toggle: function() {
						if(this.isFolder) {
							this.open = !this.open
						}
						else{
							var a =this.$options;
							var b =a.propsData;
							var c =b.model;
							var name =c.name;
							var nid = c.id;
							var p =$('<span id="'+nid+'" name="username" style="padding: 10px">' + name + '<img id="deimg" src="img/chahao.png"  onclick="del()" width="15px" height="15px" style="position: absolute;"/></span>');
							if(!$('#tid').children('span[id='+nid+']').text()){
								$("#tid").append(p);
								$.closePopup("#half"); 
							}
							else{
								$.toast("不能重复添加", "text");
							}
						}
					},
					changeType: function() {
						if(!this.isFolder) {
							Vue.set(this.model, 'children', [])
							this.addChild()
							this.open = true
						}
					},
				}
			})
			
		//删除选择人员
		function del (){
          $("#tid span").eq($(this).index()).remove();
		}
		//弹出界面
    	$(document).on("click", "#abc", function() { 
		       $("#half").popup();
	    });
	    //关闭弹出界面
	    $(document).on("click", "#aaa", function() {
	        $.closePopup("#half");
	    });
	    //请假事由限制
    	function astrict(){
           var tarea=document.getElementById("weui-textarea");
           var maxlength=200;
           var length=tarea.value.length;
           var count=maxlength-length;

           var sp=document.getElementById("astrict-sl");
           sp.innerHTML=count;
           if(count<=25){
            sp.style.color="red";
           }else{
            sp.removeAttribute("style");
           }
        }
    	//维修时间
    	window.onload = function(){
				var weixiu =document.getElementById("weixiu");
				set(weixiu);
			};
	   	function set(obj){
	   			$(obj).datetimePicker({
		        title: '出发时间',
		        min: "1990-12-12",
		        max: "2022-12-12 12:12",
		        onChange: function (picker, values, displayValues) {
		          console.log(values);
		        }
		      });
	   	};
    </script>
</body>
</html>