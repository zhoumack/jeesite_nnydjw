<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>发起会议</title>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.picker.all.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/imgeviewer.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />

<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.picker.all.js"></script>
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
		/*.t_ta_div {
			padding-top: 10px;
		}*/
		
		.t_textarea {
			width: 100%;
			resize: none;
			border: none;
		}
		
		.sel_a {
			width: 50px;
			height: 50px;
			display: inline-block;
			background: url(weui/img/tianjia.png) no-repeat;
			background-size: 100% 100%;
		}
		
		.sel_a:active,
		.sel_file:active {
			opacity: 0.5;
		}
		
		.sel_file {
			width: 50px;
			height: 50px;
			display: inline-block;
			background: url(weui/img/new1.png) no-repeat;
			background-size: 100% 100%;
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
		.img_upload_a_div,
		.upload_a_div {
			padding-top: 10px;
			text-align: center;
			position: relative;
		}
		
		.sel_icon {
			width: 50px;
			height: 50px;
		}
		
		.uploader_del,
		.img_uploader_del {
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
		function openTimePicker(ele) {
			var _option = {
				"type": "date"
			};
			var time_picker = new mui.DtPicker(_option);
			time_picker.show(function(rs) {
				$(ele).find('input[type="text"]').val(rs.value);
				time_picker.dispose();
			});
		}

		function openHourPicker(ele) {
			var _option = {
				"type": "time"
			};
			var time_picker = new mui.DtPicker(_option);
			time_picker.show(function(rs) {
				$(ele).find('input[type="text"]').val(rs.value);
				time_picker.dispose();
			});
		}

		function openPicker(ele) {
			var options = $(ele).attr('dataOptions') ? JSON.parse($(ele).attr('dataOptions')) : [];
			var pop_picker = new mui.PopPicker();
			pop_picker.setData(options);
			pop_picker.show(function(items) {
				$(ele).find('input[type="text"]').val(items[0].text);
				$(ele).find('input[type="hidden"]').val(items[0].value);

				pop_picker.dispose();
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
			if(in_val && in_val.indexOf(dataId) != -1) {
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
			tx += '<span class="mui-badge mui-btn-red uploader_del" dataType="' + dataType + '" dataId="' + dataId + '">X</span>';
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

			var spr = $("#spr").val();
			if(!spr) {
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

		function sub_form(_form) {
			if(!sub_vail()) {
				return;
			}
			if(uploader.getFiles().length != 0) {
				uploader.upload();
			} else {
				ajaxForm(_form);
			}
		}

		function ajaxForm(_form) {
			var data = form_to_jsonStr(_form, true);
			console.log(JSON.stringify(data));
			$.post($(_form).attr('action'), data, function(rsp) {
				/* alert(JSON.stringify(rsp)); */
				if(rsp.success != '1') {
					$.toast('提交失败！', 'cancel');
					return;
				}
				$.toast('提交成功!', function() {
					console.log('提交成功！');
				});
				setTimeout(function() {
					window.location.href = "${ctx}" + rsp.url;
				}, 500);
			}, 'json');
		}
	</script>

	<body>

		<div class="div_body">
			<form:form id="qj_form" action="${ctx}/shenpi/qingjia/save" modelAttribute="qingjia" method="post" onsubmit="sub_form(this);return false;">
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
						<a class="t_a" onclick="openTimePicker(this)" href="#">
							<span class="t_span">会议日期<span class="bt_span">*</span></span>
							<div class="t_div">
								<input id="huiyi_ymd" type="text" placeholder="请选择" class="t_input" readonly="readonly" />
							</div>
						</a>
					</div>
					<div class="row_div">
						<a class="t_a" onclick="openHourPicker(this)" href="#">
							<span class="t_span">开始时间<span class="bt_span">*</span></span>
							<div class="t_div">
								<input id="starttime" type="text" placeholder="请选择" class="t_input" readonly="readonly" />
							</div>
						</a>
					</div>
					<div class="row_div">
						<a class="t_a" onclick="openHourPicker(this)" href="#">
							<span class="t_span">结束时间<span class="bt_span">*</span></span>
							<div class="t_div">
								<input id="endtime" type="text" placeholder="请选择" class="t_input" readonly="readonly" />
							</div>
						</a>
					</div>
					<div class="row_div">
						<a class="t_a" onclick="openPicker(this)" href="#" dataOptions='[{"value": "1","text": "会议室(默认)"}]'>
							<span class="t_span">会议地点<span class="bt_span">*</span></span>
							<div class="t_div">
								<input placeholder="请选择" class="t_input" type="text" readonly="readonly" />
								<input type="hidden" />
							</div>
						</a>
					</div>
				</div>

				<div class="t_row">
					<div class="row_div">
						<a class="t_a" href="#">
							<span class="t_span">主题<span class="bt_span">*</span></span>
							<div class="t_div">
								<input placeholder="请选择会议主题" class="t_input" type="text" />
								<input type="hidden" />
							</div>
						</a>
					</div>
					<div class="row_div">
						<div>议题</div>
						<div class="t_ta_div">
							<textarea name="reason" placeholder="请输入会议议题" class="t_textarea" type="text"></textarea>
						</div>
						<div class="t_ta_div mui-row mui-col-xs-12 mui-text-center sel_top_div">
							<!--<div class="mui-col-xs-3 sel_div">
									<span class="mui-badge mui-btn-red img_uploader_del">X</span>
									<img class="sel_icon" src="weui/img/bumen1.png" data-preview-src="" data-preview-group="1">
								</div>-->
							<div class="mui-col-xs-3 img_upload_a_div">
								<input id="hy_img" name="hy_img" type="hidden" />
								<a id="hy_img_a" class="sel_file"></a>
								<div id="img_picker" style="display: none;"></div>
							</div>
						</div>
					</div>
					<div class="row_div">
						<div>附件</div>
						<div class="t_ta_div mui-row mui-col-xs-12 mui-text-center sel_top_div">
							<!--<div class="mui-col-xs-3 sel_div">
								<span class="mui-badge mui-btn-red uploader_del">X</span>
								<img class="sel_icon" src="weui/img/bumen1.png" data-preview-src="" data-preview-group="1">
								<h6>123.txt</h6>
							</div>-->
							<div class="mui-col-xs-3 upload_a_div">
								<input id="filepath" name="filepath" type="hidden" />
								<a id="filepath_a" class="sel_a"></a>
								<div id="picker" style="display: none;"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="t_row">
					<div class="row_div">
						<a class="t_a" onclick="openPicker(this);" href="#" dataOptions='[{"value": "1","text": "记录人1"},{"value": "2","text": "记录人2"}]'>
							<span class="t_span">记录人</span>
							<div class="t_div">
								<input type="text" placeholder="请选择" class="t_input" readonly="readonly" />
							</div>
						</a>
					</div>
					<div class="row_div">
						<a class="t_a" href="#" onclick="openPicker(this)" dataOptions='[{"value": "1","text": "参会人1"},{"value": "2","text": "参会人2"}]'>
							<span class="t_span">参会人</span>
							<div class="t_div">
								<input id="chr" type="text" placeholder="请选择" class="t_input" readonly="readonly" />
							</div>
						</a>
					</div>
				</div>

				<div class="btn_div">
					<button type="submit" class="sub_btn">发布</button>
				</div>
			</form:form>
		</div>
	</body>
	<script type="text/javascript">
		mui.previewImage();
		$(function() {
			load_uploader();
			img_load_uploader();
		});
		var uploader, img_uploader;
		var fileSize = 0,
			fileUpSize = 0;

		function img_load_uploader() {
			$('#hy_img_a').on('click', function() {
				$('#img_picker input[name="file"]').click();
			});
			$(document).on('click', '.img_uploader_del', function() {
				var _self = this;
				var parent = $(_self).parent();
				var sel_top_div = $(_self).parents('.sel_top_div');
				var hide_upload_val = sel_top_div.find('input[type="hidden"]');
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
					img_uploader.removeFile(_self.getAttribute('fileId'));
				}
				fileSize--;
				//dom元素删除
				parent.remove();
			});

			// 初始化Web Uploader
			img_uploader = WebUploader.create({

				//			method: 'get',
				//
				//			sendAsBinary: true,

				// 选完文件后，是否自动上传。
				auto: false,

				// swf文件路径
				swf: "webuploader/Uploader.swf",

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
					id: '#img_picker'
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
				//		fileSingleSizeLimit: 500 * 1000 * 1024, //500M

				// 只允许选择图片文件。
				accept: {
					title: 'ImagesAndVideo',
					/* extensions: 'gif,jpg,jpeg,bmp,png,vob,ifo,mpg,mpeg,dat,mp4,3gp,mov,rm,ram,rmvb,wmv,asf,avi,asx,drc,mkv',
					mimeTypes: 'image/*,video/*' */
					extensions: 'gif,jpg,jpeg,bmp,png',
					mimeTypes: 'image/*'
				},
			});

			img_uploader.on('filesQueued', function(files) {
				fileSize += files.length;
				$.each(files, function(i, _file) {

					var ratio = window.devicePixelRatio || 1;
					// 缩略图大小
					var thumbnailWidth = $(window).width() * 0.3 * ratio;
					var thumbnailHeight = $(window).width() * 0.3 * ratio;

					img_uploader.makeThumb(_file, function(error, src) {
						if(error) {
							mui.toast(_file.name + ' 生成缩略图失败');
							return;
						}

						var str = '<div class="mui-col-xs-3 sel_div">';
						str += '<span class="mui-badge mui-btn-red img_uploader_del" fileId="' + _file.id + '">X</span>';
						str += '<img class="sel_icon" src="' + src + '" data-preview-src="" data-preview-group="1">';
						str += '</div>';
						$(".img_upload_a_div").before(str);

					}, thumbnailWidth, thumbnailHeight);
				});

			});

			// 文件上传过程中创建进度条实时显示。
			img_uploader.on('uploadProgress', function(file, percentage) {
				$.showLoading("上传中..");
			});

			// 文件上传失败。
			img_uploader.on('uploadError', function(file, reason) {
				mui.toast('上传出错');
				console.log(JSON.stringify(reason));
			});

			// 文件上传成功。
			img_uploader.on('uploadSuccess', function(file, response) {

				console.log(JSON.stringify(response));
				if(response.success == 0) {
					$.toast(file.name + " 上传失败！", 'cannel');
					return;
				}
				fileUpSize++;

				var hide_upload_val = $("#hy_img").val() ? $("#hy_img").val() + "," : '';
				hide_upload_val += response.fileName + ",";
				if(hide_upload_val) {
					hide_upload_val = hide_upload_val.substring(0, hide_upload_val.length - 1);
				}
				$("#hy_img").val(hide_upload_val);
				if(fileSize == fileUpSize) {
					ajaxForm($("#qj_form")[0]);
				}
			});

			img_uploader.on('uploadComplete', function(file, response) {
				$.hideLoading();
			});

			img_uploader.on('error', function(type) {
				mui.toast('上传出错');
			});
		}

		function load_uploader() {
			$('#filepath_a').on('click', function() {
				$('#picker input[name="file"]').click();
			});
			$(document).on('click', '.uploader_del', function() {
				var _self = this;
				var parent = $(_self).parent();
				var sel_top_div = $(_self).parents('.sel_top_div');
				if(sel_top_div.find('#picker').length != 0) { //上传附件删除
					var hide_upload_val = sel_top_div.find('input[type="hidden"]');
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
				} else { //审批人，抄送人删除
					var hid_inp = sel_top_div.find('input[type="hidden"]');
					var hide_upload_val = hid_inp.val();
					var data = JSON.parse(hide_upload_val);
					var dataType = $(_self).attr('dataType');
					var dataId = $(_self).attr('dataId');
					if(dataType == '1') { //部门
						var arr = data.departmentId.split(',');
						var new_val = '';
						for(var i in arr) {
							if(arr[i] != dataId) {
								new_val += arr[i] + ",";
							}
						}
						if(new_val) {
							new_val = new_val.substring(0, new_val.length - 1);
						}
						data.departmentId = new_val;
					}
					if(dataType == '2') { //人员
						var arr = data.userId.split(',');
						var new_val = '';
						for(var i in arr) {
							if(arr[i] != dataId) {
								new_val += arr[i] + ",";
							}
						}
						if(new_val) {
							new_val = new_val.substring(0, new_val.length - 1);
						}
						data.userId = new_val;
					}
					hid_inp.val(JSON.stringify(data));
				}
				fileSize--;
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
				swf: "webuploader/Uploader.swf",

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
				//		fileSingleSizeLimit: 500 * 1000 * 1024, //500M

				// 只允许选择图片文件。
				//		accept: {
				//			title: 'ImagesAndVideo',
				//			/* extensions: 'gif,jpg,jpeg,bmp,png,vob,ifo,mpg,mpeg,dat,mp4,3gp,mov,rm,ram,rmvb,wmv,asf,avi,asx,drc,mkv',
				//			mimeTypes: 'image/*,video/*' */
				//			extensions: 'gif,jpg,jpeg,bmp,png',
				//			mimeTypes: 'image/*'
				//		},
			});

			uploader.on('filesQueued', function(files) {
				fileSize += files.length;
				$.each(files, function(i, _file) {

					if(is_Img(_file.name)) {
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
							str += '<img class="sel_icon" src="' + src + '" data-preview-src="" data-preview-group="1">';
							str += '</div>';
							$(".upload_a_div").before(str);

						}, thumbnailWidth, thumbnailHeight);
					}

				});

			});

			// 文件上传过程中创建进度条实时显示。
			uploader.on('uploadProgress', function(file, percentage) {
				$.showLoading("上传中..");
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
					$.toast(file.name + " 上传失败！", 'cannel');
					return;
				}
				fileUpSize++;

				var hide_upload_val = $("#filepath").val() ? $("#filepath").val() + "," : '';
				hide_upload_val += response.fileName + ",";
				if(hide_upload_val) {
					hide_upload_val = hide_upload_val.substring(0, hide_upload_val.length - 1);
				}
				$("#filepath").val(hide_upload_val);
				if(fileSize == fileUpSize) {
					ajaxForm($("#qj_form")[0]);
				}
			});

			uploader.on('uploadComplete', function(file, response) {
				$.hideLoading();
			});

			uploader.on('error', function(type) {
				mui.toast('上传出错');
			});
		}

		//根据文件名称判断是否是图片文件
		function is_Img(fileName) {
			if(fileName) {
				var vid_str = '.bmp|.jpg|.jpeg|.png|.tif|.gif|.pcx|.tga|.exif|.fpx|.svg|.psd|.cdr|.pcd|.dxf|.ufo|.eps|.ai|.raw|.wmf|.webp';
				var vid_arr = vid_str.split('|');
				for(var i in vid_arr) {
					if(fileName.toLocaleLowerCase().indexOf(vid_arr[i]) != -1) {
						return true;
					}
				}
				return false;
			}
			return false;
		}
	</script>
</html>