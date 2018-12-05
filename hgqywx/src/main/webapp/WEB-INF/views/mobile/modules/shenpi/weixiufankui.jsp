<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>维护反馈</title>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.picker.all.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.dtpicker.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/imgeviewer.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />

<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.picker.all.js"></script>
<script src="${ctxStatic}/mui/js/mui.dtpicker.js"></script>
<script src="${ctxStatic}/mui/js/mui.previewimage.js"></script>
<script src="${ctxStatic}/mui/js/mui.zoom.js"></script>
<script src="${ctxStatic}/webuploader/webuploader.min.js"></script>
<script src="${ctxStatic}/mui/js/loading.js"></script>
</head>
<style type="text/css">
			body,
			html {
				width: 100%;
				height: 100%;
				line-height: normal;
				margin: 0;
				padding: 0;
				background-color: #eee;
				overflow-x: hidden;
			}
			
			input,
			textarea {
				background-color: transparent;
				font-size: 15px;
				color: #666;
				outline: none;
			}
			
			.header {
				text-align: center;
				font-size: 20px;
				background-color: #007CCF;
				color: white;
				height: 40px;
				padding-top: 10px;
			}
			
			.img_left img {
				width: 25px;
				height: 25px;
				position: absolute;
				top: 10px;
				left: 0;
			}
			
			.t_row {
				margin-top: 10px;
				position: relative;
			}
			
			.row_div {
				background-color: white;
				padding: 10px;
				padding-right: 20px;
				border-top: 1px solid #ddd;
			}
			
			.row_div:last-child {
				border-bottom: 1px solid #ddd;
			}
			
			.t_a {
				text-decoration: none !important;
				color: black;
			}
			
			.t_a:active {
				background-color: #ddd;
			}
			
			.t_span {
				position: absolute;
				font-size: 16px;
			}
			
			.t_div {
				padding-left: 80px;
			}
			
			.t_select {
				width: 100%;
			}
			
			.t_input {
				width: 100%;
				border: none !important;
				height: 21px !important;
				margin-bottom: 0 !important;
				text-align: right;
				padding: 0 !important;
			}
			
			.bt_span {
				color: red;
				padding-left: 5px;
				position: relative;
				top: 3px;
			}
			
			.t_ta_div {
				padding-top: 10px;
			}
			
			.t_textarea {
				width: 100%;
				resize: none;
				border: none;
				height: 70px;
			}
			
			.sel_a {
				width: 50px;
				height: 50px;
				display: inline-block;
				background: url(${ctxStatic}/weui/img/tianjia.png) no-repeat;
				background-size: 100% 100%;
			}
			
			.sel_a:active {
				opacity: 0.5;
			}
			
			.footer {
				width: 100%;
				position: absolute;
				bottom: 0;
			}
			
			.btn_div {
				padding: 10px 20px;
			}
			
			.sub_btn {
				width: 100%;
				height: 40px;
				font-size: 17px;
				color: white;
				background-color: #007CCF;
				display: block;
				border: none;
				border-radius: 4px;
				outline: none;
			}
			
			.sub_btn:active {
				opacity: 0.5;
			}
			
			.progressbar_div .progressbar_text {
				position: absolute;
				top: 13px;
				right: 20px;
				color: #007aff;
				font-size: 14px;
			}
			
			.sel_a_div,
			.sel_div,
			.upload_a_div {
				padding-top: 10px;
				text-align: center;
				position: relative;
			}
			
			.sel_icon {
				width: 50px;
				height: 50px;
			}
			
			.uploader_del {
				background-color: red;
				color: white;
				position: absolute;
				right: 6px;
				top: -6px;
				font-size: 8px;
				padding: 4px 5px;
			}
			.fankui_input{
			color: #a7a4a4;
			}
			/* 悬浮加号 */
#poper_m{
	width: 100%;
	height: 100%;
	background-color: #fff;
	z-index: 99999;
	position: absolute;
	top: 0;
	opacity: 0.8;
	display: none;
}
#poper_dv{
	z-index: 999999;
	position: absolute;
	bottom:57px !important;
	right: 17px !important;
	display: none;
}

img{
vertical-align:middle
}
.mm-page{
	position: inherit !important;
}
		</style>
<script type="text/javascript">

			function openPicker(ele) {
				var pop_picker = new mui.PopPicker();
				pop_picker.setData(options);
				pop_picker.show(function(items) {
					var qjlx_type = items[0].value;
					var user_id = "${qingjia.user.id}";
					var data = {
						"type": qjlx_type,
						"userId": user_id
					};
					$.ajax({
						type:"get",
						url:"${ctx}/store/qjstore/syts",
						data: data,
						async: false,
						success:function(res) {
							var qjsy = res;
							if(qjsy == -1){
								qjsy = '-';
							}
							$("#qjsy_input").val(qjsy);
						}
					});
					
					$("#qjlx_text").val(items[0].text);
					$("#qjlx_val").val(items[0].value);
					pop_picker.dispose();
				});
			}

			function openTimePicker(ele) {
				var _option = {};
				var time_picker = new mui.DtPicker(_option);
				time_picker.show(function(rs) {
					$(ele).find('input[type="text"]').val(rs.value);
					$(ele).find('input[type="hidden"]').val(rs.value);
					//calc_qjsj();
					time_picker.dispose();
				});
			}

		

			

			var sel_a_obj = null;

			function sel_click(ele) {
				sel_a_obj = ele;
			}
			
			//表单验证
			function sub_vail() {
				 var result = $("#result").val();
				if(!result){
					mui.toast('请输入处理结果');
					return false;
				}
				
				var starttime_hid = $("#starttime_hid").val();
				if(!starttime_hid){
					mui.toast('请选择完成时间');
					return false;
				}
				return true;
			}
			
			function form_to_jsonStr(_form, obj_bl) {
				var form_data = $(_form).serializeArray();
				var data = {};
				$.each(form_data, function() {
					data[this.name] = $.trim(this.value);
				});
				if(obj_bl) {
					return data;
				}
				return JSON.stringify(data);
			}
			
			function sub_form(_form){
				if(!sub_vail()){
					return;
				}
				if(uploader.getFiles().length != 0){
					uploader.upload();
				}else{
					ajaxForm(_form);
				}
			}
			
			function ajaxForm(_form) {
				var data = form_to_jsonStr(_form,true);
				console.log(JSON.stringify(data));
				$.post($(_form).attr('action'),data,function(rsp){
					 alert(JSON.stringify(rsp)); 
					if(rsp.success!='1'){
						$.toast('提交失败！','cancel');
						return;
					}
					$.toast('提交成功!');
					setTimeout(function(){
						window.location.href = "${ctx}"+rsp.url;
					},500);
				},'json');
			}
		</script>
	
<body>
<!-- 悬浮区 -->
<%-- <img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png"> --%>
<img id="rc_btn" src="${ctxStatic}/mui/image/rc_more.png"
		style="z-index: 999; position: absolute; width: 40px; right: 17px; bottom: 67px">
	<div id="poper_m"></div>
	<div id="poper_dv">
		<div style="margin-bottom: 8px">
			<span style="color: #777777; font-size: 18px">返回</span> <img
				id="xuanfu" src="${ctxStatic}/mui/image/fanhui.png" width="45px" />
		</div>
	</div>
<!--内容  -->
	<%@include file="/WEB-INF/views/include/mmenu.jsp" %>

			<div class="div_body">
				 <form:form id="qi_form" action="${ctx}/shenpi/weixiu/saveAudit" modelAttribute="weixiu" method="post" onsubmit="sub_form(this);return false;">
					<form:hidden path="id"/>
					<form:hidden path="act.taskId"/>
					<form:hidden path="act.taskName"/>
					<form:hidden path="act.taskDefKey"/>
					<form:hidden path="act.procInsId"/>
					<form:hidden path="act.procDefId"/>
					<form:hidden path="user.id"/>
					<form:hidden id="flag" path="act.flag"/>

					<div class="t_row"> 
						<div class="row_div">
							<a class="t_a" href="#">
								<span class="t_span">事项来源</span>
								<div class="t_div">
									<input id="gzsb" readonly="readonly" class="t_input fankui_input" type="text" value="${weixiu.esource}" /> 
								</div>
							</a>
						</div>
					</div>
					
					<div class="t_row"> 
						<div class="row_div">
							<a class="t_a" href="#">
								<span class="t_span">房号</span>
								<div class="t_div">
									<input id="houseNumber" readonly="readonly" class="t_input fankui_input" type="text" value="${weixiu.houseNumber}" /> 
								</div>
							</a>
						</div>
					</div>

					<div class="t_row">
						<div class="row_div">
							<a class="t_a" href="#">
								<span class="t_span">受理时间<span class="bt_span">*</span></span>
								<div class="t_div">
									<input id="starttime" name="date" type="text" value="<fmt:formatDate
						value="${weixiu.date}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />"  class="t_input fankui_input" readonly="readonly" />
								</div>
							</a>
						</div>
						<div class="row_div">
							<a class="t_a" href="#">
								<span class="t_span">申请部门</span>
								<div class="t_div">
									<input id="gzsb" readonly="readonly" class="t_input fankui_input" type="text" name="office" value="${weixiu.user.office.name}" /> 
								</div>
							</a>
						</div>
						<%-- <div class="row_div">
							<a class="t_a" href="#">
								<span class="t_span">申请人</span>
								<div class="t_div">
									<input id="gzsb" readonly="readonly" class="t_input fankui_input" type="text" name="userName" value="${weixiu.user.name }" /> 
								</div>
							</a>
						</div> --%>
						<%-- <div class="row_div">
							<a class="t_a" href="#">
								<span class="t_span">委托人</span>
								<div class="t_div">
									<input id="gzsb" readonly="readonly" class="t_input fankui_input" type="text" 
									<c:choose >
										<c:when test="${weixiu.truster == null || weixiu.truster.name == null }">
										    value="无"
										</c:when>
										<c:otherwise>
										  value="${weixiu.truster.name }"
										</c:otherwise>
									</c:choose>
									 /> 
								</div>
							</a>
						</div> --%>
					</div>

					<div class="t_row">
						<div class="row_div">
							<div>事项</div>
							<div class="t_ta_div">
								<textarea name="event" readonly="readonly"  class="t_textarea fankui_input" type="text">${weixiu.event }</textarea>
							</div>
						</div>
					</div>
					
					<div class="t_row">
						<div class="row_div">
							<a class="t_a" href="#">
								<span class="t_span">处理结果<span class="bt_span">*</span></span>
								<div class="t_div">
									<input id="result" placeholder="请输入" class="t_input" type="text" name="result" value="${weixiu.result}"/>
								</div>
							</a>
						</div>
						<div class="row_div">
							<a class="t_a" onclick="openTimePicker(this)" href="#">
								<span class="t_span">完成时间<span class="bt_span">*</span></span>
								<div class="t_div">
									<input id="starttime textInput" type="text" placeholder="请选择" class="t_input" readonly="readonly" />
									<input type="hidden" id="starttime_hid" name="donedate" value="${weixiu.donedate }">
								</div>
							</a>
						</div>
						<div class="row_div">
							<a class="t_a" href="#">
								<span class="t_span">涉及金额</span>
								<div class="t_div" style="padding-right: 20px;position: relative;">
									<input id="fee textInput"  name="cost" class="t_input" type="number" placeholder="0" value="${weixiu.cost }" />
									<span style="position: absolute;top:0;right: 0;color: gray;">元</span>
								</div>
							</a>
						</div>
					</div>
					<div class="t_row">
						<div class="row_div">
							<div>备注</div>
							<div class="t_ta_div">
								<textarea  name="remarks" placeholder="请输入" class="t_textarea" type="text"></textarea>
							</div>
						</div>
					</div>

					<div class="btn_div">
						<button type="submit" onclick="$('#flag').val('1')" id="tongyi" class="sub_btn">提交</button>
					</div>
				 </form:form>
			</div>
		</body>
<script type="text/javascript">
window.onresize=function(){ 
    document.activeElement.scrollIntoView(false);     
}  
var bfscrolltop = document.body.scrollTop;
$("input").focus(function(){
     interval = setInterval(function(){
     document.body.scrollTop = document.body.scrollHeight;
     },100)
 }).blur(function(){
     clearInterval(interval);
     document.body.scrollTop = bfscrolltop;
 });
mui.previewImage();
$(function() {
	load_uploader();
});
var uploader;

function load_uploader() {
	$('#smfj_a').on('tap', function() {
		$('#picker input[name="file"]').click();
	});
	/* $('.sel_uploader_div') */
	$(document).on('tap','.uploader_del',function(){
		var _self = this;
		var parent = $(_self).parent();
		var sel_top_div = $(_self).parents('.sel_top_div');
		if(sel_top_div.find('#picker').length != 0){//上传附件删除
			var hide_upload_val = $("#smfj_input");
			var obj = parent.find('img');
			if(obj.length == 0) {
				obj = parent.find('video');
			}
			var obj_val = obj.attr('src');
			var val_arr = $.trim(hide_upload_val.val()).split(',');
			var new_val = '';
			for(var i in val_arr) {
				if(val_arr[i] != obj_val) {
					new_val += val_arr[i] + ",";
				}
			}
			if(new_val) {
				new_val = new_val.substring(0, new_val.length - 1);
			}
			hide_upload_val.val(new_val);

			//webuploader文件删除
			if(_self.getAttribute('fileId')) {
				uploader.removeFile(_self.getAttribute('fileId'));
			}
		}else{//审批人，抄送人删除
			var hid_inp = sel_top_div.find('input[type="hidden"]');
			var hide_upload_val = hid_inp.val();
			var data = JSON.parse(hide_upload_val);
			var dataType = $(_self).attr('dataType');
			var dataId = $(_self).attr('dataId');
			if(dataType=='1'){//部门
				var arr = data.departmentId.split(',');
				var new_val = '';
				for(var i in arr){
					if(arr[i] != dataId){
						new_val+=arr[i] + ",";
					}
				}
				if(new_val){
					new_val = new_val.substring(0,new_val.length-1);
				}
				data.departmentId = new_val;
			}
			if(dataType=='2'){//人员
				var arr = data.userId.split(',');
				var new_val = '';
				for(var i in arr){
					if(arr[i] != dataId){
						new_val+=arr[i] + ",";
					}
				}
				if(new_val){
					new_val = new_val.substring(0,new_val.length-1);
				}
				data.userId = new_val;
			}
			hid_inp.val(JSON.stringify(data));
		}
		
		//dom元素删除
		parent.remove();
	});
	
	/* $(document).on("click", "#tongyi", function() {
		var dshenpi = $("#dshenpi").html("已审批");
		// var yijian =$("#yijian").val();
		// $("#yijian_p").html(yijian);
		// $("#spyijian").hide();
		$.toast("反馈完成");
	}); */
}
mui.ready(function(){
	ele_drag("#rc_btn");
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
			startX = e.originalEvent.targetTouches[0].pageX; //获取点击点的X坐标    
			startY = e.originalEvent.targetTouches[0].pageY; //获取点击点的Y坐标
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
			moveX = e.originalEvent.targetTouches[0].pageX; //移动过程中X轴的坐标
			moveY = e.originalEvent.targetTouches[0].pageY; //移动过程中Y轴的坐标
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
/* 加号点击 */
$("#rc_btn").on("tap",function(){
	$("#rc_btn").hide();
	$("#poper_m").show();
	$("#poper_dv").show();
});
$("#poper_m").on("tap",function(){
	$("#poper_m").hide();
	$("#poper_dv").hide();
	$("#rc_btn").show();
});		
		</script>
</html>