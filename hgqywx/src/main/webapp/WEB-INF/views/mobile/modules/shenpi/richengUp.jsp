<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>日程修改</title>
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
<script type="text/javascript">
			function openTimePicker(ele) {
				var _option = {};
				var time_picker = new mui.DtPicker(_option);
				time_picker.show(function(rs) {
					$(ele).find('input[type="text"]').val(rs.value);
					time_picker.dispose();
				});
			}
			//添加审批人departmentId,userId
			function add_spr(dataId, dataType, dataImg, dataName) {
				if(!sel_a_obj) {
					mui.toast('选择的标签获取失败');
					return true;
				}
				var sel_a_div = $(sel_a_obj).parents('.sel_a_div');

				//数据
				var in_val = $.trim(sel_a_div.find("input[type='hidden']").val());
				if(in_val && in_val.indexOf(dataId) != -1){
					mui.toast('请不要选择重复人员');
					return false;
				}
				var data = {
					"departmentId": "",
					"userId": ""
				};
				if(in_val) {
					data = JSON.parse(in_val);
				}
				if(dataType == '1') { //部门
					var department_arr = data.departmentId ? data.departmentId.split(',') : [];
					department_arr.push(dataId);
					var departmentId = department_arr.join(',');
					data.departmentId = departmentId;
				}
				if(dataType == '2') { //用户
					var user_arr = data.userId ? data.userId.split(',') : [];
					user_arr.push(dataId);
					var userId = user_arr.join(',');
					data.userId = userId;
				}
				sel_a_div.find("input[type='hidden']").val(JSON.stringify(data));
				
				//头像
				var tx = '<div class="mui-col-xs-3 sel_div">';
				//if($(sel_a_obj).attr('sel_type') == 'csr'){//抄送人
					tx += '<span class="mui-badge mui-btn-red uploader_del" dataType="'+dataType+'" dataId="'+dataId+'">X</span>';
				//}
				tx += '<img class="sel_icon" src="' + dataImg + '">';
				tx += '<span style="position: absolute;top: 20px;right: -8px;font-size: 20px;color: #999;">...</span>';
				tx += '<h5>' + dataName + '</h5>';
				tx += '</div>';
				sel_a_div.before(tx);
				
				return true;
			}

			var sel_a_obj = null;

			function sel_click(ele) {
				sel_a_obj = ele;
			}
			
			//表单验证
			function sub_vail() {
				var theme = $("#theme").val();
				if(!theme){
					mui.toast('请填写日程主题');
					return false;
				}
				var starttime = $("#starttime").val();
				if(!starttime){
					mui.toast('请选择开始时间');
					return false;
				}
				var endtime = $("#endtime").val();
				if(!endtime){
					mui.toast('请选择结束时间');
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
				ajaxForm(_form);
				
			}
			
			function ajaxForm(_form) {
				var data = form_to_jsonStr(_form,true);
				console.log(JSON.stringify(data));
				$.post($(_form).attr('action'),data,function(rsp){
					if(rsp.success!='1'){
						$.toast('提交失败！','cancel');
						return;
					}
					$.toast('提交成功!',function(){
						console.log('提交成功！');
					});
					setTimeout(function(){
						window.location.href = "${ctx}"+rsp.url;
					},500);
				},'json');
			}
		</script>
	
<body>
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
<%-- 	<%@include file="/WEB-INF/views/include/mmenu.jsp" %> --%>
		<div class="div_body">
				<%-- <form:form id="qj_form" action="${ctx}/shenpi/chuchai/save" modelAttribute="chuchai" method="post" onsubmit="sub_form(this);return false;">
					 --%>
			<form:form id="richeng_form" action="${ctx}/grsw/richeng/save" modelAttribute="richeng" method="post" onsubmit="sub_form(this);return false;">
					<input type="hidden" name="id" value="${richeng.id}">
					<div class="t_row">
	 					<div class="row_div">
 							<a class="t_a" href="#">
	 							<span class="t_span">日程主题<span class="bt_span">*</span></span>
	 							<div class="t_div">
								<input id="theme" placeholder="主题" class="t_input" type="text" name="theme" value="${richeng.theme }" /> 
	 							</div> 
	 						</a> 
	 					</div> 
					</div>

					<div class="t_row">
						<div class="row_div">
							<a class="t_a" onclick="openTimePicker(this)" href="#">
								<span class="t_span">开始时间<span class="bt_span">*</span></span>
								<div class="t_div">
									<input id="starttime" type="text" name="startTime" value="<fmt:formatDate value="${richeng.startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>" placeholder="请选择" class="t_input" readonly="readonly" />
								</div>
							</a>
						</div>
						<div class="row_div">
							<a class="t_a" onclick="openTimePicker(this)" href="#">
								<span class="t_span">结束时间<span class="bt_span">*</span></span>
								<div class="t_div">
									<input id="endtime" type="text" name="endTime"  value="<fmt:formatDate value="${richeng.endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>" placeholder="请选择" class="t_input" readonly="readonly" />
								</div>
							</a>
						</div>
						<div class="row_div">
 							<a class="t_a" href="#">
	 							<span class="t_span">地点</span>
	 							<div class="t_div">
								<input id="addr" placeholder="地点" class="t_input"  value="${richeng.addr}" type="text" name="addr" /> 
	 							</div> 
	 						</a> 
	 					</div> 
					</div>

					<div class="t_row">
						<div class="row_div">
							<div>日程详情</div>
							<div class="t_ta_div">
								<textarea id="event" name="content" placeholder="请填写详情"   class="t_textarea" type="text">${richeng.content}</textarea>
							</div>
						</div>
					</div>
					<!-- <div class="t_row">
						<div class="row_div">
							<div>
								参与人
							</div>
							<div class="t_ta_div mui-row mui-col-xs-12 sel_top_div">
								<div class="mui-col-xs-3 sel_a_div">
									<a class="sel_a" href="#menu" sel_type="csr" onclick="sel_click(this)"></a>
									<input id="csr" name="people" type="hidden" value='' />
								</div>
							</div>
						</div>
					</div> -->

					<div class="btn_div">
						<button type="submit" class="sub_btn">保存</button>
					</div>
				 </form:form>
			</div>
		
		</body>
<script type="text/javascript">
			mui.previewImage();
			$(function() {
				load_uploader();
				
				
				$("#rc_btn").on("tap",function(){
					$("#poper_m").show();
					$("#poper_dv").show();
				});
				$("#poper_m").on("tap",function(){
					$("#poper_m").hide();
					$("#poper_dv").hide();
				});
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

			}
			/* 返回 */
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
		</script>
</html>