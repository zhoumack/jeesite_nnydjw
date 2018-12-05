<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>出差申请</title>
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
		</style>
<script type="text/javascript">
			var options = [{
				value: '1',
				text: '事假'
			}];
			//请假类型变量
			var no_qjlx = true;
			$(document).ready(function() {

				var _url = "${ctx}/main/getDictList";
				$.getJSON(_url, {
					type: 'qingjiaType'
				}, function(rsp) {
					if(rsp) {
						for(var i in rsp) {
							rsp[i].text = rsp[i].label;
						}
						options = rsp;
					}
				});
			});

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
					/* $.ajax({
						type:"get",
						url:"${ctx}/store/qjstore/syts",
						data: data,
						async: false,
						success:function(res) {
							var qjsy = res;
							no_qjlx = false;
							if(qjsy == -1){
								qjsy = '-';
							}
							$("#qjsy_input").val(qjsy);
						}
					}); */
					
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
					calc_qjsj();
					time_picker.dispose();
				});
			}

			function calc_qjsj() {
				var starttime_val = $.trim($("#starttime").val());
				var endtime_val = $.trim($("#endtime").val());

				if(starttime_val && endtime_val) {
					var starttime_sp = starttime_val.split(' ');
					var starttime = starttime_sp[0];
					var start_sx = starttime_sp[1];

					var endtime_sp = endtime_val.split(' ');
					var endtime = endtime_sp[0];
					var end_sx = endtime_sp[1];

					var oDate1 = new Date(starttime);
					var oDate2 = new Date(endtime);

					if(oDate1.getTime() > oDate2.getTime()) {
						mui.toast('请假时间必须小于截止时间');
						$("#qjsc").val(0);
						return false;
					}

					var day = getDays(starttime, endtime);
					var day_sx = 0;
					if(start_sx == '上午') {
						if(end_sx == '上午') {
							day_sx = 0.5;
						} else {
							day_sx = 1;
						}
					} else {
						if(end_sx == '上午') {
							day_sx = 0;
						} else {
							day_sx = 0.5;
						}
					}
					day += day_sx;
					$("#qjsc").val(day);
				}
				return true;
			}

			function getDays(date1, date2) {
				var date1Str = date1.split("-"); //将日期字符串分隔为数组,数组元素分别为年.月.日			
				//根据年 . 月 . 日的值创建Date对象			
				var date1Obj = new Date(date1Str[0], (date1Str[1] - 1), date1Str[2]);
				var date2Str = date2.split("-");
				var date2Obj = new Date(date2Str[0], (date2Str[1] - 1), date2Str[2]);
				var t1 = date1Obj.getTime();
				var t2 = date2Obj.getTime();
				var dateTime = 1000 * 60 * 60 * 24; //每一天的毫秒数			
				var minusDays = Math.floor((t2 - t1) / dateTime); //计算出两个日期的天数差			
				var days = Math.abs(minusDays); //取绝对值			
				return days;
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
				
				var direction = $("#direction").val();
					if(!direction){
						mui.toast('请填写出差地点');
						return false;
					}
					
				 var event = $("#event").val();
					if(!event){
						mui.toast('请填写出差事由');
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
				
				var starttime_val = $.trim($("#starttime_hid").val());
				var endtime_val = $.trim($("#endtime_hid").val());
				if(starttime_val && endtime_val) {
					starttime_val = starttime_val.replace(/-/g,"/");
					endtime_val = endtime_val.replace(/-/g,"/");
					
					var oDate1 = new Date(starttime_val);
					var oDate2 = new Date(endtime_val);
					if(oDate1.getTime() > oDate2.getTime()) {
						mui.toast('开始时间必须小于结束时间');
						return false;
					}
				}
				
				var spr = $("#spr").val();
				if(!spr){
					mui.toast('请选择审批人');
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
					/* alert(JSON.stringify(rsp)); */
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
<img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png" style="z-index: 99999;position: absolute;width: 14%;right: 0px;bottom: 85px">
<!--内容  -->
	<%@include file="/WEB-INF/views/include/mmenu.jsp" %>
			<div class="div_body">
				<form:form id="qj_form" action="${ctx}/shenpi/chuchai/save" modelAttribute="chuchai" method="post" onsubmit="sub_form(this);return false;">
					<form:hidden path="id" />
					<form:hidden path="act.taskId" />
					<form:hidden path="act.taskName" />
					<form:hidden path="act.taskDefKey" />
					<form:hidden path="act.procInsId" />
					<form:hidden path="act.procDefId" />
					<form:hidden path="user.id" />
					<form:hidden id="flag" path="act.flag" />

					<div class="t_row">
	 					<div class="row_div">
 							<a class="t_a" href="#">
	 							<span class="t_span">出差地点<span class="bt_span">*</span></span>
	 							<div class="t_div">
								<input id="direction" placeholder="出差地点" class="t_input" type="text" name="direction" /> 
	 							</div> 
	 						</a> 
	 					</div> 
					</div>

					<div class="t_row">
						<div class="row_div">
							<a class="t_a" onclick="openTimePicker(this)" href="#">
								<span class="t_span">开始时间<span class="bt_span">*</span></span>
								<div class="t_div">
									<input id="starttime" type="text" name="starttime" placeholder="请选择" class="t_input" readonly="readonly" />
								</div>
							</a>
						</div>
						<div class="row_div">
							<a class="t_a" onclick="openTimePicker(this)" href="#">
								<span class="t_span">结束时间<span class="bt_span">*</span></span>
								<div class="t_div">
									<input id="endtime" type="text" name="endtime" placeholder="请选择" class="t_input" readonly="readonly" />
								</div>
							</a>
						</div>
						<div class="row_div">
							<a class="t_a" href="#">
								<span class="t_span">出差时长<span class="bt_span">*</span></span>
								<div class="t_div" style="padding-right: 20px;position: relative;">
									<input id="qjsc" name="totaldays" class="t_input" type="text" value="0" readonly="readonly" style="color: red;" />
									<span style="position: absolute;top:0;right: 0;color: gray;">天</span>
								</div>
							</a>
						</div>
					</div>

					<div class="t_row">
						<div class="row_div">
							<div>出差事由<span class="bt_span">*</span></div>
							<div class="t_ta_div">
								<textarea id="event" name="event" placeholder="请输入出差事由" class="t_textarea" type="text"></textarea>
							</div>
						</div>
					</div>
					<div class="t_row">
						<div class="row_div">
							<div>说明附件</div>
							<div class="progressbar_div mui-hidden">
								<span id="upload_progressbar" style="height: 2px;"></span>
								<div class="progressbar_text">
									<span id="progressbar_text" class="mui-ellipsis" style="padding-right: 1px;">正在上传 </span> (
									<span id="progressbar_num">0</span>%)
								</div>
							</div>
							<div class="t_ta_div mui-row mui-col-xs-12 mui-text-center sel_top_div">
								<div class="mui-col-xs-3 upload_a_div">
									<input id="smfj_input" name="filepath" type="hidden" />
									<a id="smfj_a" class="sel_a"></a>
									<div id="picker" style="display: none;"></div>
								</div>
							</div>
						</div>
					</div>

					<div class="t_row">
						<div class="row_div">
							<div>审批人<span class="bt_span">*</span></div>
							<div class="t_ta_div mui-row mui-col-xs-12 sel_top_div">
								<div class="mui-col-xs-3 sel_a_div">
									<a class="sel_a" href="#menu" sel_type="spr" onclick="sel_click(this)"></a>
									<input id="spr" name="approve" type="hidden" value='' />
								</div>
							</div>
						</div>
					</div>

					<div class="t_row">
						<div class="row_div">
							<div>
								抄送人
								<!-- <span style="font-size: 12px;color: gray;padding-left: 5px;">（已由管理员预设不可修改）</span> -->
							</div>
							<div class="t_ta_div mui-row mui-col-xs-12 sel_top_div">
								<!-- <div class="mui-col-xs-3 sel_div">
									<img class="sel_icon" src="weui/img/bumen1.png">
									<h5>张三三</h5>
								</div> -->
								<div class="mui-col-xs-3 sel_a_div">
									<a class="sel_a" href="#menu" sel_type="csr" onclick="sel_click(this)"></a>
									<input id="csr" name="copy" type="hidden" value='' />
								</div>
							</div>
						</div>
					</div>

					<div class="btn_div">
						<button type="submit" class="sub_btn">提交</button>
					</div>
				</form:form>
			</div>
		</body>
<script type="text/javascript">
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

				// 初始化Web Uploader
				uploader = WebUploader.create({

					//			method: 'get',
					//
					//			sendAsBinary: true,

					// 选完文件后，是否自动上传。
					auto: false,

					// swf文件路径
					swf: "${ctxStatic}/webuploader/Uploader.swf",

					// 文件接收服务端
					server: '${ctx}/data/uploadFiles',

					//文件上传域的name
					fileVal: 'files',

					//文件上传请求的参数表，每次发送都会发送此对象中的参数
					formData: {
						//STUTYPE: vue.strSTUID ? 0 : 1
					},

					// 内部根据当前运行是创建，可能是input元素，也可能是flash.
					pick: {
						id: '#picker'
					},

					// 压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
					resize: true,

					//去重复文件
					duplicate: true,

					//一次最多上传10个
					//fileNumLimit: 10,

					//同时上传文件的数量
					threads: 5,

					//文件大小
					fileSingleSizeLimit: 500 * 1000 * 1024, //500M

					// 只允许选择图片文件。
					accept: {
						title: 'ImagesAndVideo',
						/* extensions: 'gif,jpg,jpeg,bmp,png,vob,ifo,mpg,mpeg,dat,mp4,3gp,mov,rm,ram,rmvb,wmv,asf,avi,asx,drc,mkv',
						mimeTypes: 'image/*,video/*' */
						extensions: 'gif,jpg,jpeg,bmp,png',
						mimeTypes: 'image/*'
					},
				});
				
				var fileSize = 0,fileUpSize = 0;
				
				uploader.on('filesQueued', function(files) {
					fileSize = files.length;
					$.each(files,function(i,_file){
						var ratio = window.devicePixelRatio || 1;
						// 缩略图大小
						var thumbnailWidth = $(window).width() * 0.3 * ratio;
						var thumbnailHeight = $(window).width() * 0.3 * ratio;

						uploader.makeThumb(_file, function(error, src) {
							if(error) {
								mui.toast('生成缩略图失败');
								return;
							}

							var str = '<div class="mui-col-xs-3 sel_div">';
							str += '<span class="mui-badge mui-btn-red uploader_del" fileId="' + _file.id + '">X</span>';
							str += '<img class="sel_icon" src="'+src+'" data-preview-src="" data-preview-group="1">';
							str += '</div>';
							$(".upload_a_div").before(str);

						}, thumbnailWidth, thumbnailHeight);
					});

				});

				// 文件上传过程中创建进度条实时显示。
				uploader.on('uploadProgress', function(file, percentage) {
// 					$(".progressbar_div").removeClass('mui-hidden');
// 					var progress = parseInt(percentage * 100);
// 					$("#progressbar_num").html(progress);
// 					mui("#upload_progressbar").progressbar().setProgress(progress);
					$.showLoading();
				});

				// 文件上传失败。
				uploader.on('uploadError', function(file, reason) {
					mui.toast('上传出错');
					console.log(JSON.stringify(reason));
				});

				// 文件上传成功。
				uploader.on('uploadSuccess', function(file, response) {
					
					console.log(JSON.stringify(response));
					if(response.success == 0) {
						$.toast(file.name+" 上传失败！");
						return;
					}
					fileUpSize++;
// 					var _file = file;

// 					var ratio = window.devicePixelRatio || 1;
// 					// 缩略图大小
// 					var thumbnailWidth = $(window).width() * 0.3 * ratio;
// 					var thumbnailHeight = $(window).width() * 0.3 * ratio;

// 					uploader.makeThumb(_file, function(error, src) {
// 						if(error) {
// 							mui.toast('生成缩略图失败');
// 							return;
// 						}

// 						var str = '<div class="mui-col-xs-3 sel_div">';
// 						str += '<span class="mui-badge mui-btn-red uploader_del" fileId="' + _file.id + '">X</span>';
// 						str += '<img class="sel_icon" src="'+response.fileName+'" data-preview-src="" data-preview-group="1">';
// 						str += '</div>';
// 						$(".upload_a_div").before(str);
// 					}, thumbnailWidth, thumbnailHeight);
					
					var hide_upload_val = $("#smfj_input").val() ? $("#smfj_input").val() + "," : '';
					hide_upload_val += response.fileName + ",";
					if(hide_upload_val) {
						hide_upload_val = hide_upload_val.substring(0, hide_upload_val.length - 1);
					}
					$("#smfj_input").val(hide_upload_val);
					fileSize = $('[fileId]').length;
					if(fileSize==fileUpSize){
						ajaxForm($("#qj_form")[0]);
					}
				});

				uploader.on('uploadComplete', function(file, response) {
// 					setTimeout(function() {
// 						$(".progressbar_div").addClass('mui-hidden');
// 					}, 300);
					$.hideLoading();
				});

				uploader.on('error', function(type) {
					mui.toast('上传出错');
				});

				load_progress();
			}

			function load_progress() {
				mui("#upload_progressbar").progressbar({
					progress: 0
				}).show();
			}
			/* 返回 */
			 mui.ready(function(){
					ele_drag("#xuanfu");
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