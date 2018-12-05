<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
<link rel="stylesheet" href="${ctxStatic}/weui/css/public.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />
<link rel="stylesheet" href="${ctxStatic}/mui/css/mui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/imgeviewer.css" />
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.previewimage.js"></script>
<script src="${ctxStatic}/mui/js/mui.zoom.js"></script>
<title>审批详情</title>
<style>
.timeline {
	padding: 0 !important;
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

.sel_a_div, .sel_div, .upload_a_div {
	padding-top: 10px;
	text-align: center;
	position: relative;
}

.sel_icon {
	width: 50px;
	height: 50px;
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

button {
	border: 0;
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

.row_div {
	background-color: white;
	padding: 10px;
	padding-right: 20px;
	border-top: 1px solid #ddd;
}

.row_div:last-child {
	border-bottom: 1px solid #ddd;
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
</head>
<script type="text/javascript">
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
		return;
	}
	if(dataType == '2') { //用户
		var user_arr = data.userId ? data.userId.split(',') : [];
		user_arr.push(dataId);
		var userId = user_arr.join(',');
		data.userId = userId;
	}
	sel_a_div.find("input[type='hidden']").val(JSON.stringify(data));
	sel_a_div.find("#spr_a").addClass('mui-hidden');
	//头像
	var tx = '<div class="mui-col-xs-3 sel_div">';
	//if($(sel_a_obj).attr('sel_type') == 'csr'){//抄送人
		tx += '<span class="mui-badge mui-btn-red uploader_del" dataType="'+dataType+'" dataId="'+dataId+'">X</span>';
	//}
	tx += '<img class="sel_icon" src="' + dataImg + '">';
	if($(sel_a_obj).parents('.sel_a_div').find('#worker').length == 0){//如果不是审批人
		tx += '<span class="span_line" style="position: absolute;top: 20px;right: -8px;font-size: 20px;color: #999;">...</span>';
	}
	tx += '<h5>' + dataName + '</h5>';
	tx += '</div>';
	sel_a_div.before(tx);
	
	return true;
}
		
		var sel_a_obj = null;
		
		function sel_click(ele) {
			sel_a_obj = ele;
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
		}
		
		
		</script>
<body>
	<!-- 悬浮区 -->
	<%-- <img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png"> --%>
	<img id="rc_btn" src="${ctxStatic}/mui/image/rc_more.png"
		style="z-index: 9999; position: absolute; width: 40px; right: 17px; bottom: 67px">
	<div id="poper_m"></div>
	<div id="poper_dv">
		<div style="margin-bottom: 8px">
			<span style="color: #777777; font-size: 18px">返回</span> <img
				id="xuanfu" src="${ctxStatic}/mui/image/fanhui.png" width="45px" />
		</div>
	</div>
	<!--内容  -->
	<%@include file="/WEB-INF/views/include/mmenu.jsp"%>
	<div class="mui-scroll-wrapper">
	<div class="mui-scroll">
		<div class="center_dv">
			<div class="center_dv_dv" style="float: left">
				<img src="${ctxStatic}/mui/img/header.jpg" width="30px" height="30px"
					style="border-radius: 5px" /> <span>${userName}的维修申请</span>
			</div>
			<div class="sp_dv" style="float: left">
				<span id="shenpi">审批中</span>
			</div>
			<div style="clear: both;"></div>
	
			<div class="center_dv_dv2">
				<%-- <div class="center_span">
					<span>申请姓名</span> <span class="center_span_s2">${weixiu.user.name}</span>
				</div> --%>
				<%-- <div class="center_span">
					<span>委&nbsp;&nbsp;托&nbsp;&nbsp;人</span> <span class="center_span_s2">
						<c:choose >
							<c:when test="${weixiu.truster.name == null }">
							    无
							</c:when>
							<c:otherwise>
							  ${weixiu.truster.name }
							</c:otherwise>
						</c:choose>
					${weixiu.truster.name==""?"无":" "}
					</span>
				</div> --%>
				<div class="center_span">
					<span>事项来源</span> <span class="center_span_s2">${weixiu.esource}</span>
				</div>
				<div class="center_span">
					<span>房       间      号</span> <span class="center_span_s2">${weixiu.houseNumber}</span>
				</div>
				<div class="center_span">
					<span>故障设备</span> <span class="center_span_s2">${weixiu.item}</span>
				</div>
				<div class="center_span">
					<span>报修时间</span> <span class="center_span_s2"><fmt:formatDate
							value="${weixiu.date}" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></span>
				</div>
				<div class="center_span">
					<span>故障描述</span> <span class="center_span_s2">${weixiu.event}</span>
				</div>
				<div class="center_span">
					<span>故障图片</span> <span class="center_span_s2">${weixiu.filepath==""?"无":" " }</span>
					<div style="margin-top: 10px">
						<c:forEach items="${weixiu.filepath.split(',') }" var="img"
							varStatus="status">
							<c:if test="${!empty img}">
								<img src="${img }" style="width: 50px; height: 50px"
									data-preview-src="" data-preview-group="1">
							</c:if>
						</c:forEach>
						<%-- ${ctxStatic}/mui/img/header.jpg --%>
	
					</div>
				</div>
			</div>
		</div>
	<!--审批流程-->
	<form:form id="inputForm" modelAttribute="weixiu"
		action="${ctx}/shenpi/weixiu/saveAudit" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<form:hidden path="act.taskId" />
		<form:hidden path="act.taskName" />
		<form:hidden path="act.taskDefKey" />
		<form:hidden path="act.procInsId" />
		<form:hidden path="act.procDefId" />
		<form:hidden path="status" />
		<form:hidden id="flag" path="act.flag" />
		<div id="spyijian"></div>

		<div class="liu_dv">
			<act:histoicMobileFlowList_2 procInsId="${weixiu.act.procInsId}" />
			<div class="xian"></div>
			<c:if test='${!empty qingjia.copy   }'>
				<act:histoicMobileFlowList_3 procInsId="${qingjia.copy}" />
			</c:if>
			<c:if test="${empty qingjia.copy || qingjia.copy.length()==31 }">
				<p class="liu_dv_p2">抄送人：无</p>
			</c:if>

			<%-- <p class="liu_dv_p2">抄送人：${qingjia.copy==""?"无":qingjia.copy }</p> --%>
		</div>
		<div class="t_row">
			<div class="row_div">
				<div>执行人<span class="bt_span">*</span></div>
				<div class="t_ta_div mui-row mui-col-xs-12 sel_top_div">
					<div class="mui-col-xs-3 sel_a_div">
						<a id="spr_a" class="sel_a" href="#menu" sel_type="csr" onclick="sel_click(this)"></a>
						<input id="worker" name="worker" type="hidden" value='' />
					</div>
				</div>
			</div>
		</div>
		</div>
		<!--底部导航-->
		<div class="footer_op">
			<div style="padding-left: 15px;">
				<div class="mui-input-row">
					<input type="text" placeholder="审批意见">
				</div>
			</div>
			<div class="xian"></div>
			<div class="mui-row mui-col-xs-12"> 
				<button class="mui-col-xs-6" type="button"   onclick="sub_form('1')" >
					<img src="${ctxStatic}/mui/img/tongyi.png" width="20px" height="20px" style="position: relative; top: 5px" /> 同意
				</button>
				<button class="mui-col-xs-6" type="button" id="jujue" onclick="sub_form('2');">
					<img src="${ctxStatic}/mui/img/bohui.png" width="20px" height="20px" style="position: relative; top: 5px" /> 不同意
				</button>
			</div>
		</div>

	</form:form>

	<script src="${ctxStatic}/weui/js/vue.min.js"></script>
	<script>
		mui('.mui-scroll-wrapper').scroll({
			deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
		});
			$(function(){
				setTimeout(resData,1000);
			});
	
			function sub_form(sub_type) {
				$('#flag').val(sub_type);
				if(sub_type == '2'){
					$('#status').val('拒绝');
				}
				if (sub_type == '1') {
					if(!sub_vail()) return false;
				}
				$("#inputForm").submit();
			}
			function sub_vail() { 
				var worker = $("#worker").val();
				if (worker) {
					var fgld_obj = JSON.parse(worker); 
					if(!fgld_obj.departmentId && !fgld_obj.userId){
						mui.toast('请选择执行人');
						return false;
					}
				}else{
					mui.toast('请选择执行人');
					return false;
				}
				return true;
			}
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
				if($("#worker").parents('.sel_top_div').find('.sel_div').length == 0){
					$("#spr_a").removeClass('mui-hidden');
				}
			});
		}
		
		$(function(){ 
			$("#inputForm").css('padding-bottom',$('.footer_op').outerHeight(true));
		});
		mui.previewImage();
		/*  */
		$('.accordion-tit').click(function() {
			$parent = $(this).parent('li');
			if ($parent.hasClass('cur')) {
				$parent.removeClass('cur');
				$parent.siblings().removeClass('cur');
			} else {
				$parent.addClass('cur');
				$parent.siblings().removeClass('cur');
			}
		});

		$(document).on("click", "#tongyi", function() {
			var dshenpi = $("#dshenpi").html("已审批");
			if(!sub_vail()){
				return;
			}
			else {
				$.toast("审批完成");
			}
			
		});
		$(document).on("click", "#bohui", function() {
			$('#status').val('驳回');
			var dshenpi = $("#dshenpi").html("已驳回");
			$.toast("审批完成");
		});
		$(document).on("click", "#aaa", function() {
			$.closePopup("#half");
		});
		
		/*控件拖动并返回  */
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

</body>
</html>