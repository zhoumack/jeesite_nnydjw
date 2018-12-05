//document.write('<link rel="stylesheet" type="text/css" href="css/mui.min.css" />');
//document.write('<link rel="stylesheet" type="text/css" href="css/mui.picker.all.css" />');
//document.write('<link rel="stylesheet" type="text/css" href="css/mui.previewimage.css" />');
//document.write('<link rel="stylesheet" type="text/css" href="webuploader/webuploader.css" />');
//document.write('<link rel="stylesheet" type="text/css" href="css/public.css" />');
//document.write('<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>');
//document.write('<script type="text/javascript" src="js/mui.min.js"></script>');
//document.write('<script type="text/javascript" src="js/mui.picker.min.js"></script>');
//document.write('<script type="text/javascript" src="js/mui.previewimage.js"></script>');
//document.write('<script type="text/javascript" src="webuploader/webuploader.min.js"></script>');

//var SERVERS_IP = 'http://192.168.1.71:8888';
var ctx = $("#ctx").val();

//window.onload = function() {
//	bind_event();
//
//	ajaxSetup();
//
//	load_uploader();
//};
$(function(){
	bind_event();

	ajaxSetup();

	load_uploader();
});
//事件绑定
function bind_event() {
	//时间筛选控件
	$(document).on('tap', '.pub_sel_time', function() {
		$("input").blur();
		var _self = this;
		var options = $(this).attr('dataOptions') ? JSON.parse($(this).attr('dataOptions')) : null;
		var _option = {
			//type: 'date'
		};
		if(!options) {
			$.extend(_option, options);
		};
		var time_picker = new mui.DtPicker(_option);
		time_picker.show(function(rs) {
			_self.value = rs.text;
			time_picker.dispose();
		});
	});

	//自定义筛选控件
	$(document).on('tap', '.pub_sel_zdy', function() {
		$("input").blur();
		var _self = this;
		var options = $(this).attr('dataOptions') ? JSON.parse($(this).attr('dataOptions')) : [];
		var pop_picker = new mui.PopPicker();
		pop_picker.setData(options);
		pop_picker.show(function(items) {
			_self.value = items[0].text;
			var id = items[0].id ? items[0].id : items[0].ID;
			$(_self).parents('.pub_row').find('input[type="hidden"]').val(id);
			pop_picker.dispose();
		});
	});

	//自定义筛选控件二级
	$(document).on('tap', '.pub_sel_zdy_two', function() {
		$("input").blur();
		var pop_picker = new mui.PopPicker({
			layer: 2
		});
		var options = $(this).attr('dataOptions') ? JSON.parse($(this).attr('dataOptions')) : [];
		var _self = this;
		pop_picker.setData(options);

		pop_picker.show(function(items) {
			var val = items[0].text;
			var id = items[0].id ? items[0].id : items[0].ID;
			if(items[1].text) {
				val = items[0].text + "   " + items[1].text;
				id = items[1].id ? items[1].id : items[1].ID;
			}
			_self.value = val;
			$(_self).parents('.input_div').find('input[type="hidden"]').val(id);
			pop_picker.dispose();
		});
	});

	//输入框字数限制并显示
	$(document).on('input', '.pub_textarea', function() {
		var $this = $(this),
			_val = $this.val(),
			count = "";
		var par_obj = $this.parents('.pub_row');
		var textarea_total_num = $.trim(par_obj.find('.pub_textarea_num2').text());
		if(_val.length > textarea_total_num) {
			$this.val(_val.substring(0, textarea_total_num));
		}
		count = $this.val().length;
		par_obj.find('.pub_textarea_num1').text(count);
	});

	//提交按钮
	$(document).on('tap', '.submitbutton', function() {
		var $this = $(this),
		    ctx = $("#ctx").val();
		//设置表单action
		var formAction = ctx+"/"+$this.attr("data-url");
		$("form").attr("action",formAction);
		//处理同意/不同意的双按钮数据
		var id = $this.attr("name");
		if (id) {
			$("#"+id).val($this.attr("value"));
		}
		//验证和提交
		formvalidate();
	});
	//验证
	function formvalidate(){
		var $validationElems = $("#reder form").find("[data-validation]"); //所有需要验证的字段
		//重新组装规则 - //每个表单元素循环
		var ruleAll = {};
		var messagesAll = {};
		$validationElems.each(function(){
			var data_validation = $(this).attr("data-validation");
			if (data_validation) {
				//跳过不合格的验证规则
				try {
					var dvObject = JSON.parse(data_validation);
				} catch (e) {
					console.log(e);
					return;
				}
				//重组规则
				if (dvObject.rule && dvObject.rule.length > 0) {
					var name = $(this).attr("name");
					//每条规则循环
					var rules = {};
					var messages = {};
					for ( var i in dvObject.rule) {
						var ru = dvObject.rule[i];
						var rul;
						var val;
						var msg;
						for ( var k in ru) {
							var type = ru[k].type,
							value = ru[k].value;
							if (type == 'rule') {
								rul = value;
							}
							if (type == 'value') {
								//val = value;
								eval("val = "+value);//使用原始js类型而不是string类型
							}
							if (type == 'msg') {
								msg = value;
							}
						}
						rules[rul] = val;
						messages[rul] = msg;
					} 
					ruleAll[name] = rules;
					messagesAll[name] = messages;
				}
			}
		});
		console.log(JSON.stringify(ruleAll));
		//jqery validation
		$.validator.addMethod(
		        "regex",
		        function(value, element, regexp) {
		            var re = new RegExp(regexp);
		            return this.optional(element) || re.test(value);
		        },
		        "Please check your input."
		);
		var validationConfig = {
		    rules: ruleAll,
		    messages: messagesAll,
//		    rules: {
//		        name: {
//		            regex: "^[a-zA-Z'.\\s]{1,40}$",
//		            required: true
//		        }
//		    },
//		    messages: {
//		        name: {
//		            regex: "必须是一个数字",
//		            required: "名字不能为空"
//		        }
//		    },
		    errorPlacement: function(error, element) {  
		    	//mui.toast(error.text());
	        },
	        showErrors: function(errorMap, errorList) {
	            //每次只显示一条错误信息
	            for ( var i in errorList) {
	            	mui.toast(errorList[i].message);
	            	break;
				}
	          },
	        submitHandler:function(form){
	        	console.log("提交操作");
	        	//提交
	    		$.post($("#reder form").attr("action"),
	    				$("#reder form").serialize(),
	    				function(data){
			    			console.log("提交成功了");
			    			//todo: 成功后跳转
	    			});
	        }, 
		     /* 失去焦点时不验证 */   
		     onkeyup: false,
		     onclick: false,
		     onfocusout: false
		   };
		console.log(JSON.stringify(validationConfig));
		$("#reder form").submit(function(e) {
		    e.preventDefault();//防止跳转
		}).validate(validationConfig);
	}
}

var uploader;
var up_total_num = 10; //最大上传数量
var up_add_num = 0; //添加到上传队列中的数量
var up_com_num = 0; //上传完成的数量
function load_uploader() {
	mui.previewImage();
	$(document).on("tap", "#pub_uploader_a", function() {
		$('#pub_uploader_picker input[name="file"]').click();
	});

	$(document).on('tap', '.uploader_del', function() {
		var pub_uploader_div = $(this).parents('.pub_uploader_div');
		//webuploader文件删除
		var fileId = pub_uploader_div.attr('fileId');
		if(fileId) {
			uploader.removeFile(fileId);
			up_com_num--;
			$('#pub_uploader_a').css('display', 'inline-block');

			var _src = $.trim(pub_uploader_div.find('.pub_uploader_one').attr('src'));
			var hid_inp = pub_uploader_div.parents('.pub_uploader_con').find('input[type="hidden"]');
			inp_arr = hid_inp.val().split(',');
			var index = inp_arr.indexOf(_src);
			if(index > -1) {
				inp_arr.splice(index, 1);
			}
			hid_inp.val(inp_arr.join(','));
		}
		//dom元素删除
		pub_uploader_div.remove();
	});

	$(document).on('tap', '.upload_res_btn', function() {
		$('.upload_scsb').remove();
		uploader.retry();
	});

	// 初始化Web Uploader
	uploader = WebUploader.create({

		//				method: 'get',
		//
		//				sendAsBinary: true,

		// 选完文件后，是否自动上传。
		auto: true,

		// swf文件路径
		swf: 'webuploader/Uploader.swf',

		// 文件接收服务端
		//server: SERVERS_IP + 'data/uploadFiles',
		server: ctx+'/data/uploadFiles',

		//文件上传域的name
		fileVal: 'files',

		//文件上传请求的参数表，每次发送都会发送此对象中的参数
		formData: {},

		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: {
			id: '#pub_uploader_picker'
		},

		// 压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: true,

		//去重复文件
		duplicate: true,

		//一次最多上传10个
		fileNumLimit: up_total_num,

		//同时上传文件的数量
		threads: 5,

		//文件大小
		fileSingleSizeLimit: 500 * 1000 * 1024, //500M

		// 只允许选择图片文件。
		accept: {
			title: 'ImagesAndVideo',
			extensions: 'gif,jpg,jpeg,bmp,png,vob,ifo,mpg,mpeg,dat,mp4,3gp,mov,rm,ram,rmvb,wmv,asf,avi,asx,drc,mkv',
			mimeTypes: 'image/*,video/*'
		},

	});

	// 当一批文件添加进队列以后触发。
	uploader.on('filesQueued', function(files) {
		up_add_num += files.length;
		if(up_add_num >= up_total_num) {
			$('#pub_uploader_a').css('display', 'none');
		}
		//添加预览文件
		var ratio = window.devicePixelRatio || 1;
		// 缩略图大小
		var thumbnailWidth = $(window).width() * 0.3 * ratio;
		var thumbnailHeight = $(window).width() * 0.3 * ratio;
		$.each(files, function(i, _file) {
			uploader.makeThumb(_file, function(error, src) {
				var str_html = '<img class="pub_uploader_one" src="' + src + '" data-preview-src="" data-preview-group="1">';
				if(error) {
					if(is_Vid(_file.name)) {
						str_html = '<video class="pub_uploader_one" src="" controls="controls"></video>';
					} else {
						return;
					}
				}
				//加载html
				var file_html = '';
				file_html += '<div class="pub_uploader_div" fileId="' + _file.id + '">';
				file_html += '<span class="mui-badge mui-btn-red uploader_del"></span>';
				file_html += str_html;
				file_html += '<div class="pub_upload_progressbar_div">';
				file_html += '<span class="upload_progressbar"></span>';
				file_html += '<h5 class="progressbar_num">等待上传</h5>';
				file_html += '</div></div>';
				$("#pub_uploader_a").before(file_html);
				//加载进度条
				var progressbar_obj = $("div[fileId='" + _file.id + "']").find('.upload_progressbar');
				if(progressbar_obj.length != 0) {
					mui(progressbar_obj[0]).progressbar({
						progress: 0
					}).show();
				}
			}, thumbnailWidth, thumbnailHeight);
		});
	});

	// 文件上传过程中创建进度条实时显示。
	uploader.on('startUpload', function() {
		//		$("#sub_btn").addClass('mui-disabled');
		//		$(".uploader_a").addClass('mui-disabled');
	});

	// 文件上传过程中创建进度条实时显示。
	uploader.on('uploadProgress', function(file, percentage) {
		var file_id = file.id;
		var p_obj = $('div[fileId="' + file_id + '"]');
		if(p_obj.length != 0) {
			p_obj.find('.pub_upload_progressbar_div').css('display', 'block');
			var progress = parseInt(percentage * 100);
			mui(p_obj.find('.upload_progressbar')[0]).progressbar().setProgress(progress);
			p_obj.find('.progressbar_num').html(progress + "%");
		}
	});

	// 文件上传失败。
	uploader.on('uploadError', function(file, reason) {
		//uploader.removeFile(file);
		$('div[fileId="' + file.id + '"]').find('.upload_progressbar').html('<span class="upload_scsb">上传失败</span>');
		$('div[fileId="' + file.id + '"]').find('.progressbar_num').html('<a class="upload_res_btn">重新上传</a>');
	});

	// 文件上传成功。
	uploader.on('uploadSuccess', function(file, response) {
		console.log(JSON.stringify(response));
		if(response.success == 0) {
			mui.toast(response.message);
			file.setStatus('error');
			$('div[fileId="' + file.id + '"]').find('.upload_progressbar').html('<span class="upload_scsb">上传失败</span>');
			$('div[fileId="' + file.id + '"]').find('.progressbar_num').html('<a class="upload_res_btn">重新上传</a>');
			//uploader.removeFile(file.id, true);
			return;
		}
		var _src = $.trim(response.fileName);
		$('div[fileId="' + file.id + '"]').find('.pub_uploader_one').attr('src', _src);
		var hid_inp = $('div[fileId="' + file.id + '"]').parents('.pub_uploader_con').find('input[type="hidden"]');
		if(hid_inp.length != 0) {
			var inp_val_arr = hid_inp.val().split(',');
			inp_val_arr.push(_src);
			hid_inp.val(inp_val_arr.join(','));
		}
		$('div[fileId="' + file.id + '"]').find('.pub_upload_progressbar_div').css('display', 'none');
	});

	uploader.on('uploadComplete', function(file) {
		up_com_num++;
	});

	uploader.on('error', function(type) {
		if(type == 'Q_EXCEED_NUM_LIMIT') {
			mui.toast('超过文件上传的最大数量');
		} else if(type == 'Q_EXCEED_SIZE_LIMIT') {
			mui.toast('文件超过最大总大小');
		} else {
			mui.toast('未知错误');
		}
		var err_files = uploader.getFiles('error');
		$.each(err_files, function(i, _file) {
			var fileId = _file.id;
			$('div[fileId="' + file.id + '"]').find('.upload_progressbar').html('<span style="color:red;font-size:12px;">上传失败</span>');
			$('div[fileId="' + file.id + '"]').find('.upload_progressbar').html('<a class="upload_res_btn">重新上传</a>');
		});
	});
}

//jquery ajax全局设置
function ajaxSetup() {
	//自定义加载框
	var spinner_css = '<style>.spinner_div {width: 80px;height: 80px;line-height: 80px;background-color: black;opacity: 0.5;border-radius: 7px;position: fixed;top: 0;left: 0;right: 0;bottom: 0;margin: auto;text-align: center;z-index: 1000;} .spinner_text {font-size: 12px;position: relative;top: -55px;color: white;}</style>';
	var spinner_div = '<div id="spinner_div" class="spinner_div mui-hidden"><span class="mui-spinner"></span><div class="spinner_text">加载中...</div></div>';
	$("body").append(spinner_css + spinner_div);
	$.ajaxSetup({
		type: 'post',
		dataType: 'json',
		cache: false,
		//		timeout: 30000,
		beforeSend: function() {
			//数据出来前显示等待加载框
			$("#spinner_div").removeClass('mui-hidden');
		},
		error: function(xhr, type) {
			var str = '';
			if(type == 'timeout') {
				str = '网络超时' + xhr.status;
			} else if(type == 'error') {
				str = 'error错误' + xhr.status;
			} else {
				str = '未知错误' + xhr.status;
			}
			console.log("【" + xhr.status + "】: " + JSON.stringify(this));
			mui.toast(str);
			//数据渲染完毕，关闭加载框
			setTimeout(function() {
				$("#spinner_div").addClass('mui-hidden');
			}, 150);
		},
		complete: function(xhr, status) {
			//数据渲染完毕，关闭加载框
			setTimeout(function() {
				$("#spinner_div").addClass('mui-hidden');
			}, 150);
		}
	});
}

//根据文件名称判断是否是音频文件
function is_Vid(fileName) {
	if(fileName) {
		var vid_str = '.vob|.ifo|.mpg|.mpeg|.dat|.mp4|.3gp|.mov|.rm|.ram|.rmvb|.wmv|.asf|.avi|.asx|.drc|.mkv';
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

//根据文件名称判断是否是图片文件
function is_Img(fileName) {
	if(fileName) {
		var vid_str = '.bmp|.jpg|.jpeg|.png|.tif|.gif|.pcx|.tga|.exif|.fpx|.svg|.psd|.cdr|.pcd|.dxf|.ufo|.eps|.ai|.raw|.WMF|.webp';
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

