<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>工作反馈</title>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mui/css/mui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mui/css/mui.picker.all.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mui/css/mui.dtpicker.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mui/css/imgeviewer.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />
<link rel="stylesheet" href="${ctxStatic}/mui/css/public.css" />

<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.picker.all.js"></script>
<script src="${ctxStatic}/mui/js/mui.dtpicker.js"></script>
<script src="${ctxStatic}/mui/js/mui.previewimage.js"></script>
<script src="${ctxStatic}/mui/js/mui.zoom.js"></script>
<script src="${ctxStatic}/webuploader/webuploader.min.js"></script>
<script src="${ctxStatic}/mui/js/loading.js"></script>
</head>
<style type="text/css">
.weui_footer1 {
	background-color: white;
	margin-top: 10px;
}

.weui_footer2 {
	background-color: white;
	text-align: center;
	margin-top: 0px;
	height: 30px;
}

.weui_footer_p1 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p2 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p3 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p4 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.timeline {
	padding: 10px 20px !important;
}

.timeline-item-head {
	top: 0px;
}

.weui_footer1 {
	background-color: white;
	margin-top: 10px;
}

.weui_footer2 {
	background-color: white;
	text-align: center;
	margin-top: 0px;
	height: 30px;
}

.weui_footer_p1 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p2 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p3 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.weui_footer_p4 {
	width: 25%;
	float: left;
	line-height: 30px;
}

.head_menu {
	width: 100%;
	height: 50px;
	background-color: #318df0;
}

.head_menu p {
	font-size: 15px;
	color: white;
	text-align: center;
	line-height: 50px;
}

.head_menu img {
	width: 20px;
	height: 20px;
	position: absolute;
	top: 14px;
	left: 5px;
}

.mui-bar {
	background-color: #318df0;
}

.mui-title {
	color: #fff;
}

body, html {
	background: #f5f5f5;
}

.sp_dv {
	width: 50px;
	height: 15px;
	border: 1px solid #74C3F9;
	text-align: center;
	line-height: 14px;
	border-radius: 3px;
	position: relative;
	top: 23px;
	left: 12px;
	/* margin-top: 20px;
	margin-left: 10px; */
}

.sp_dv span {
	color: #387AC9;
	font-size: 12px;
}

.center_dv {
	background-color: #FFFFFF;
	border-bottom: 1px solid #DCDCDC;
}

.center_dv_dv {
	padding-left: 15px;
	padding-top: 15px;
}

.center_dv_dv span {
	padding-left: 50px;
	font-weight: bold;
	font-size: 18px;
	position: relative;
	top: 6px;
}

.center_dv_dv img {
	position: absolute;
	left: 20px;
}

.center_dv_dv2 {
	padding: 15px;
	color: #887F7F;
}

.center_span {
	padding: 5px;
}

.center_span_s2 {
	padding-left: 20px;
	color: #000000;
}

.liu_dv {
	background-color: #ffffff;
	border-bottom: 1px solid #DCDCDC;
	border-top: 1px solid #DCDCDC;
	margin-top: 10px;
}

.liu_dv_p1 {
	padding: 15px;
	color: #887f7f;
}

.liu_dv_dv {
	padding-left: 16px;
}

.liu_dv_dv img {
	position: relative;
	top: 3px;
	margin-right: 10px;
}

.xian {
	margin-left: 15px;
	width: 95%;
	height: 1px;
	background-color: #DCDCDC;
}

.liu_dv_p2 {
	padding: 15px;
	color: #887f7f;
	font-size: 13px;
}

.footer_op {
	width: 100%;
	background-color: #Ffffff;
	border-top: 1px solid #DCDCDC;
	position: fixed;
	bottom: 0;
	z-index: 999;
}

.caozuo {
	width: 50%;
	height: 40px;
	text-align: center;
	line-height: 40px;
	float: left;
}

#relist {
	background-color: #ECECEC;
	width: 60%;
	float: right;
	display: none;
}

.mui-input-row input {
	border: none;
	margin-bottom: inherit;
}
.mui-btn-block {text-align：right;
	font-size: 18px;
	display: block;
	width: 100%;
	margin-bottom: inherit !important;
	padding: 0 0 0 20px;
}

button {
	border: 0;
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
				"type" : qjlx_type,
				"userId" : user_id
			};
			$.ajax({
				type : "get",
				url : "${ctx}/store/qjstore/syts",
				data : data,
				async : false,
				success : function(res) {
					var qjsy = res;
					if (qjsy == -1) {
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
		var select2 = $("#select2").val();
		if (!select2) {
			mui.toast('请选择完成结果');
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
		if (obj_bl) {
			return data;
		}
		return JSON.stringify(data);
	}

	function sub_form(_form) {
		if (!sub_vail()) {
			return;
		}
		ajaxForm(_form);

	}

	function ajaxForm(_form) {
		
		var data = form_to_jsonStr(_form, true);
		console.log(JSON.stringify(data));
		$.post($(_form).attr('action'), data, function(rsp) {
			
		},"text");
	}
	
	/*  */
	/* $(function () {
	    $.ajax({
	    	url:"${ctx}/sys/role/getRoleByCurrentUser",
	    	dataType: "text",
	    	success:function(data){
	    		console.log(data);
				if (data == "ganjing") {
					$("#fz_span").css("display","none");
				}
	    	},
	    	error:function(data1,data2,data3){
	    		console.log("错误！");
	    	}
	    	
	    }); 
	}) */
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
	<%-- <%@include file="/WEB-INF/views/include/mmenu.jsp"%> --%>

	<div class="div_body">
	<form:form id="qi_form" action="${ctx}/shenpi/renwu/saveAudit" modelAttribute="renwu" method="post">
		<form:hidden path="id"/>
		<form:hidden path="act.taskId"/>
		<form:hidden path="act.taskName"/>
		<form:hidden path="act.taskDefKey"/>
		<form:hidden path="act.procInsId"/>
		<form:hidden path="act.procDefId"/>
		<form:hidden path="user.id"/>
		<form:hidden id="flag" path="act.flag"/>

		<div class=" mui-content mui-scroll-wrapper">
			<div class="mui-scroll">
				<div class="center_dv">
					<div class="center_dv_dv" style="float: left">
						<img src="${ctxStatic}/mui/img/header.jpg" width="30px"
							height="30px" style="border-radius: 5px" /> <span>${renwu.user.name}的任务安排</span>
					</div>
					<div class="sp_dv" style="float: left">
						<span id="shenpi">安排中</span>
					</div>
					<div style="clear: both;"></div>

					<div class="center_dv_dv2">
					<div class="center_span">
						<span>发&nbsp;&nbsp;布&nbsp;人</span> <span class="center_span_s2">${renwu.user.name}</span>
					</div>
					<c:choose >
						<c:when test="${renwu.userName == null or renwu.userName=='' }">
						</c:when>
						<c:otherwise>
						  <div class="center_span" id="fz_span">
								<span>负&nbsp;&nbsp;责&nbsp;人</span><span class="center_span_s2">${renwu.userName}</span>
						</div>
						</c:otherwise>
					</c:choose>
					<div class="center_span">
						<span>任务主题</span> <span class="center_span_s2">${renwu.theme}</span>
					</div>
					<div class="center_span">
						<span>任务地点</span> <span class="center_span_s2">${renwu.place}</span>
					</div>
					<div class="center_span">
						<span>开始时间</span> <span class="center_span_s2">
						<fmt:formatDate value="${renwu.starttime}" type="both"
						pattern="yyyy-MM-dd HH:mm:ss" />
						</span>
					</div>
					<div class="center_span">
						<span>结束时间</span> <span class="center_span_s2">
						<fmt:formatDate value="${renwu.endtime}" type="both"
						pattern="yyyy-MM-dd HH:mm:ss" />
						</span>
					</div>
					<div class="center_span">
						<span>任务内容</span> <span class="center_span_s2">${renwu.plan}</span>
					</div>
					<c:choose >
						<c:when test="${renwu.userName == null or renwu.userName=='' }">
						</c:when>
						<c:otherwise>
						 <div class="center_span" id="sj_beizhu">
							<span>上级备注</span> <span class="center_span_s2">${renwu.remarks}</span>
						</div>
						</c:otherwise>
					</c:choose>
					<div class="center_span">
						<span>说明附件</span> <span class="center_span_s2">${renwu.filepath==""?"无":" " }</span>
						<div style="margin-top: 10px">
							<c:forEach items="${renwu.filepath.split(',') }" var="img"
								varStatus="status">
								<c:if test="${!empty img}">
									<img src="${img }" style="width: 50px; height: 50px"
										data-preview-src="" data-preview-group="1">
								</c:if>
							</c:forEach>

						</div>
					</div>
				</div>
				</div>
				
				<div class="t_row">
					<div class="row_div">
						<a class="t_a" href="#"> <span class="t_span">完成情况<span
								class="bt_span">*</span></span>
							<div class="t_div" style="float: right;">
								<select id="select2"  class="mui-btn mui-btn-block">
									<option selected="selected value="已完成">已完成</option>
									<option value="未完成">未完成</option>
									<option value="其他">其他</option>
								</select>
							</div>
						</a> <br style="clear: both;">
					</div>
				</div>
				<div class="t_row">
					<div class="row_div">
						<div>备注</div>
						<div class="t_ta_div">
							<textarea id="remarks" name="remarks" placeholder="请输入" class="t_textarea"
								type="text"></textarea>
						</div>
					</div>
				</div>

				<div class="btn_div">
					<button type="submit" onclick="select()"  id="tongyi" class="sub_btn">提交</button>
				</div>
		 </form:form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$("#remarks").on("tap" , function(){
	$('.mui-scroll-wrapper').animate({scrollTop:300},1000);
});
/*  */
	function select() {
		 var sel=$('#select2').val();
		 $("#flag").val(sel)
	}

	mui('.mui-scroll-wrapper').scroll({
		deceleration : 0.0005
	//flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
	});
	window.onresize = function() {
		document.activeElement.scrollIntoView(false);
	}
	var bfscrolltop = document.body.scrollTop;
	$("input").focus(function() {
		interval = setInterval(function() {
			document.body.scrollTop = document.body.scrollHeight;
		}, 100)
	}).blur(function() {
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
		$(document).on('tap', '.uploader_del', function() {
			var _self = this;
			var parent = $(_self).parent();
			var sel_top_div = $(_self).parents('.sel_top_div');
			if (sel_top_div.find('#picker').length != 0) {//上传附件删除
				var hide_upload_val = $("#smfj_input");
				var obj = parent.find('img');
				if (obj.length == 0) {
					obj = parent.find('video');
				}
				var obj_val = obj.attr('src');
				var val_arr = $.trim(hide_upload_val.val()).split(',');
				var new_val = '';
				for ( var i in val_arr) {
					if (val_arr[i] != obj_val) {
						new_val += val_arr[i] + ",";
					}
				}
				if (new_val) {
					new_val = new_val.substring(0, new_val.length - 1);
				}
				hide_upload_val.val(new_val);

				//webuploader文件删除
				if (_self.getAttribute('fileId')) {
					uploader.removeFile(_self.getAttribute('fileId'));
				}
			} else {//审批人，抄送人删除
				var hid_inp = sel_top_div.find('input[type="hidden"]');
				var hide_upload_val = hid_inp.val();
				var data = JSON.parse(hide_upload_val);
				var dataType = $(_self).attr('dataType');
				var dataId = $(_self).attr('dataId');
				if (dataType == '1') {//部门
					var arr = data.departmentId.split(',');
					var new_val = '';
					for ( var i in arr) {
						if (arr[i] != dataId) {
							new_val += arr[i] + ",";
						}
					}
					if (new_val) {
						new_val = new_val.substring(0, new_val.length - 1);
					}
					data.departmentId = new_val;
				}
				if (dataType == '2') {//人员
					var arr = data.userId.split(',');
					var new_val = '';
					for ( var i in arr) {
						if (arr[i] != dataId) {
							new_val += arr[i] + ",";
						}
					}
					if (new_val) {
						new_val = new_val.substring(0, new_val.length - 1);
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
	mui.ready(function() {
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
			touchstart : function(e) {
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
			touchmove : function(e) {
				e.preventDefault();
				moveX = e.originalEvent.targetTouches[0].pageX; //移动过程中X轴的坐标
				moveY = e.originalEvent.targetTouches[0].pageY; //移动过程中Y轴的坐标
				//console.log("moveX="+moveX+"************moveY="+moveY);
				if (moveX < leftX) {
					moveX = leftX;
				}
				if (moveX > rightX) {
					moveX = rightX;
				}
				if (moveY < topY) {
					moveY = topY;
				}
				if (moveY > bottomY) {
					moveY = bottomY;
				}
				$(this).css({
					"left" : moveX + sX - startX,
					"top" : moveY + sY - startY,
				});
			}
		});
	}
	/* 加号点击 */
	$("#rc_btn").on("tap", function() {
		$("#rc_btn").hide();
		$("#poper_m").show();
		$("#poper_dv").show();
	});
	$("#poper_m").on("tap", function() {
		$("#poper_m").hide();
		$("#poper_dv").hide();
		$("#rc_btn").show();
	});
</script>
</html>