<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>派车</title>
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
<!-- mmenu -->
<link type="text/css" rel="stylesheet" href="${ctxStatic}/mmenu/css/jquery.mmenu.all.css" />
<%-- <script src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script> --%>
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/mmenu/js/jquery.mmenu.all.js"></script>

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
body, html {
	width: 100%;
	height: 100%;
	line-height: normal;
	margin: 0;
	padding: 0;
	background-color: #eee;
	overflow-x: hidden;
}

input, textarea {
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

.sel_a_div, .sel_div, .upload_a_div {
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

.mui-btn-block {text-align：right;
	font-size: 18px;
	display: block;
	width: 100%;
	/*  margin-left: 165px; */
	margin-bottom: inherit !important;
	padding: 0 0 0 20px;
}
.mm-navbar__breadcrumbs {
	text-overflow: clip;
}
/* .mm-wrapper_opening .mm-menu_offcanvas.mm-menu_opened ~.mm-slideout {
	-webkit-transform: translate3d(-100vw, 0, 0);
	transform: translate3d(-100vw, 0, 0);
} */
.mm-menu_position-bottom {
	height: 100vh;
}

nav#menu {
	width: 100%;
}

#mmenu_page {
	display: none;
}

.popup_icon {
	width: 30px;
	height: 30px;
	position: relative;
	left: 18px;
	top: 7px;
}

.mm-listitem__text {
	padding-left: 30px !important;
}
#poper_m {
	width: 100%;
	height: 100%;
	background-color: #fff;
	z-index: 99999;
	position: absolute;
	top: 0;
	opacity: 0.8;
	display: none;
}

#poper_dv {
	z-index: 999999;
	position: absolute;
	bottom: 57px !important;
	right: 17px !important;
	display: none;
}

img {
	vertical-align: middle
}

.mm-page {
	position: inherit !important;
}
</style>
<script type="text/javascript">




			/* var options = [{
				value: '1',
				text: '事假'
			}]; */
			//派车类型变量
			var no_qjlx = true;
			$(document).ready(function() {

				var _url = "${ctx}/main/getDictList";
				$.getJSON(_url, {
					type: 'paicheType'
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
					var user_id = "${paiche.user.id}";
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
					/* $("#qjlx_val").val(items[0].value); */
					$("#qjlx_val").val(items[0].text);
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

					var oDate1 = new Date(starttime_val);
					var oDate2 = new Date(endtime_val);

					var date3 = oDate2.getTime() - oDate1.getTime(); //时间差的毫秒数      

					//计算出相差天数
					var days = Math.floor(date3 / (24 * 3600 * 1000));

					//计算出小时数
					var leave1 = date3 % (24 * 3600 * 1000); //计算天数后剩余的毫秒数
					var hours = Math.floor(leave1 / (3600 * 1000));
					//计算相差分钟数
					var leave2 = leave1 % (3600 * 1000); //计算小时数后剩余的毫秒数
					var minutes = Math.floor(leave2 / (60 * 1000));
					var min_hour = parseFloat(minutes / 60).toFixed(1);
					hours = hours * 1 + min_hour * 1;
					var total_hours = parseInt(days) * 24 + hours;
					$("#jb_day").val(days);
					$("#jb_hour").val(hours);
					$("#totaltime").val(total_hours);
				}
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
				if($(sel_a_obj).parents('.sel_a_div').find('#spr').length == 0){//如果不是审批人
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
			
			//表单验证
			function sub_vail() {
				var select1 = $("#select1").val();
				if(!select1){
					mui.toast('请选择时间范围');
					return false;
				}
				 var select2 = $("#select2").val();
					if(!select2){
						mui.toast('请选择出车范围');
						return false;
					}
				var starttime = $("#starttime").val();
				if(!starttime){
					mui.toast('请选择出发时间');
					return false;
				}
				var startplace = $("#startplace").val();
				if(!startplace){
					mui.toast('请填写出车地点');
					return false;
				}
				var direction = $("#direction").val();
				if(!direction){
					mui.toast('请填写目的地点');
					return false;
				}
				var islocaluser = $("#pnums").val();
				if(!islocaluser){
					mui.toast('请填写人数');
					return false;
				}
				var pnums = $("#islocaluser").val();
				if(!pnums){
					mui.toast('请选择是否搭乘本院人员');
					return false;
				}
				
				var dcrybz = $("#dcrybz1").val();
				if(pnums=="1"){
					if(!dcrybz){
						mui.toast('请填写搭乘人员姓名及原因');
						return false;
					}
				}
				
				 var spr = $("#spr").val();
				/* if(){
					mui.toast('请选择部门领导人');
					return false;
				}  */
				if (spr) {
					var fgld_obj = JSON.parse(spr); 
					if(!fgld_obj.departmentId && !fgld_obj.userId ){
						mui.toast('请选择审批人');
						return false;
					}
				}else{
					if(!$("#sprDiv").is(":hidden")){
						mui.toast('请选择审批人');
						return false;
					}
					
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
				getselect();
				var data = form_to_jsonStr(_form,true);
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
	<%@include file="/WEB-INF/views/include/mmenu.jsp" %>
	<!--内容  -->
		<div class="div_body">
		<form:form id="_form" action="${ctx}/shenpi/paiche/save"
			modelAttribute="paiche" method="post"
			onsubmit="sub_form(this);return false;">
			<form:hidden path="id" />
			<form:hidden path="act.taskId" />
			<form:hidden path="act.taskName" />
			<form:hidden path="act.taskDefKey" />
			<form:hidden path="act.procInsId" />
			<form:hidden path="act.procDefId" />
			<form:hidden path="user.id" />
			<form:hidden id="flag" path="act.flag" />

			<div class="t_row">
				<!-- <div class="row_div">
							<a class="t_a" onclick="openPicker(this)" href="#">
								<span class="t_span">用车类别<span class="bt_span">*</span></span>
								<div class="t_div">
							<input id="qjlx_text" placeholder="请选择" class="t_input"
								type="text" readonly="readonly" /> <input id="qjlx_val" type="hidden" name="type" />
								</div>
							</a>
						</div> -->
				<div class="row_div">
					<a class="t_a" href="#"> <span class="t_span">时间范围<span
							class="bt_span">*</span></span>
						<div class="t_div" style="float: right;">
							<select id="select1" onchange="getrenyuan()" class="mui-btn mui-btn-block">
								<option selected="selected" value="工作时间">&nbsp;&nbsp;&nbsp;工作时间</option>
								<option value="非工作时间">非工作时间</option>
							</select>
						</div>
					</a> <br style="clear: both;">
				</div>
				<div class="row_div">
					<a class="t_a" href="#"> <span class="t_span">出车范围<span
							class="bt_span">*</span></span>
						<div class="t_div" style="float: right;">
							<select id="select2" onchange="getrenyuan()" class="mui-btn mui-btn-block">
								<option selected="selected value="城内">主城区内</option>
								<option value="城外">主城区外</option>
							</select>
						</div>
					</a> <br style="clear: both;">
				</div>
				<div class="row_div" style="display: none;">
					<input id="iscommon" placeholder="判断地点" value="${iscommon}"
						class="t_input" type="text" name="iscommon" />
				</div>
			</div>

			<div class="t_row">
				<div class="row_div">
					<a class="t_a" onclick="openTimePicker(this)" href="#"> <span
						class="t_span">出发时间<span class="bt_span">*</span></span>
						<div class="t_div">
							<input id="starttime" type="text" name="starttime"
								placeholder="请选择" class="t_input" readonly="readonly" />
						</div>
					</a>
				</div>
				<div class="row_div">
					<a class="t_a" href="#"> <span class="t_span">出车地点<span
							class="bt_span">*</span></span>
						<div class="t_div">
							<input id="startplace" placeholder="出发地点" class="t_input"
								type="text" name="startplace" />
						</div>
					</a>
				</div>
				<div class="row_div">
					<a class="t_a" href="#"> <span class="t_span">目的地点<span
							class="bt_span">*</span></span>
						<div class="t_div">
							<input id="direction" placeholder="目的地点" class="t_input"
								type="text" name="direction" />
						</div>
					</a>
				</div>
			</div>
			<div class="t_row">
				<div class="row_div">
					<a class="t_a" href="#"> <span class="t_span">人数<span
							class="bt_span">*</span></span>
						<div class="t_div">
							<input id="pnums" placeholder="人数" class="t_input" type="number"
								name="pnums" />
						</div>
					</a>
				</div>
			</div>

			<div class="t_row">
				<div class="row_div">
					<div>用车事由</div>
					<div class="t_ta_div">
						<textarea name="event" placeholder="请输入用车原因" class="t_textarea"
							type="text"></textarea>
					</div>
				</div>
			</div>
			<input id="enname" type="hidden" value="${paiche.user.role.enname }" />
			<div class="t_row">
				<div class="row_div">
					<div>搭乘地点及人员情况</div>
					<div class="t_ta_div">
						<textarea name="placeUsers" placeholder="请输入搭乘情况"
							class="t_textarea" type="text"></textarea>
					</div>
				</div>
			</div>
			<div class="t_row">
				<div class="row_div">
					<a class="t_a" href="#"> <span class="t_span">是否搭载非本院人员<span class="bt_span">*</span></span>
						<div class="t_div" style="float: right;">
							<select id="islocaluser" class="mui-btn mui-btn-block"
								name="islocaluser">
								<option value="0">否</option>
								<option value="1">是</option>
							</select>
						</div>
					</a> <br style="clear: both;">
				</div>
			</div>
			<div class="t_row" id="dcrybz" style="display:none">
				<div class="row_div">
					<div>搭乘人员姓名及原因<span class="bt_span">*</span></div>
					<div class="t_ta_div">
						<textarea id="dcrybz1" name="dcrybz" placeholder="请输入搭乘人员姓名及原因"
							class="t_textarea" type="text"></textarea>
					</div>
				</div>
			</div>
			<!-- <div class="t_row">
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
								<div class="mui-col-xs-3 sel_div">
									<span class="mui-badge mui-btn-red uploader_del">X</span>
									<img class="sel_icon" src="weui/img/bumen1.png" data-preview-src="" data-preview-group="1">
								</div>
								<div class="mui-col-xs-3 upload_a_div">
									<input id="smfj_input" name="filepath" type="hidden" />
									<a id="smfj_a" class="sel_a"></a>
									<div id="picker" style="display: none;"></div>
								</div>
							</div>
						</div>
					</div> -->

			<div class="t_row" id="sprDiv">
				<div class="row_div">
					<div id="sprtext">
						部门领导<span class="bt_span">*</span>
					</div>
					<div class="t_ta_div mui-row mui-col-xs-12 sel_top_div">
						<div class="mui-col-xs-3 sel_a_div">
							<a id="spr_a" class="sel_a" href="#menu" sel_type="spr"
								onclick="sel_click(this)"></a> <input id="spr" name="approve"
								type="hidden" value='' />
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
		/* 判断正常和不正常 */
		$("#select1").on("change",function(){
			 getselect() ;
		});
		function ele(){
			var select1 = $("#select1").val();
			alert(select1);
		}
		function getselect() {
			var select1 = $("#select1").val();
			console.log(select1);
			var select2 = $("#select2").val();
			console.log(select2);
			console.log(select1 == "工作时间");
			console.log(select2 =="城内");
			console.log(select1 == "工作时间" && select2 =="主城区内");
			if (select1 == "工作时间" && select2 =="主城区内") {
				$("#iscommon").val(1);
				
			}
			else {
				$("#iscommon").val(0);
			}
		}
		
		
		
		//人员点击
		function sel_pop(ele) {
			var dataId = $(ele).attr('dataId');
			var dataType = $(ele).attr('dataType');
			var dataImg = $(ele).attr('dataImg');
			var dataName = $(ele).attr('dataName');
			
			if(typeof(add_spr)=="function"){
				if(!add_spr(dataId,dataType,dataImg,dataName)){
					return;
				}
			}
			
			$(".mm-btn_close").click();
			/* api.closeAllPanels($("menu")) */
		}
		/* function getselect2() {
			var select2 = $("#select2 option:selected").val();
			console.log(select2);
		} */
		
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
						return;
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
				if($("#spr").parents('.sel_top_div').find('.sel_div').length == 0){
					$("#spr_a").removeClass('mui-hidden');
				}
			});

			}
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
				startX = e.originalEvent.targetTouches
			
			[0].pageX; //获取点击点的X坐标    
				startY = e.originalEvent.targetTouches
			
			[0].pageY; //获取点击点的Y坐标
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
				moveX = e.originalEvent.targetTouches
			
			[0].pageX; //移动过程中X轴的坐标
				moveY = e.originalEvent.targetTouches
			
			[0].pageY; //移动过程中Y轴的坐标
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
			
			$(document).ready(function() {
				setTimeout(function(){getrenyuan()},1000);
				
				//判断是否搭乘本院人员
				 $("#islocaluser").change(function(){
				     	if($(this).val()=="1"){
				     		$("#dcrybz").css("display","block");
				     	}else{
				     		$("#dcrybz").css("display","none");
				     	}
				     	
				    });
				
			});
			
			function getrenyuan(){
				getselect();
				
				var iscommon=$("#iscommon").val();
				var enname=$("#enname").val();
				console.log(iscommon+'____'+enname);
				html_gen = "";
				$("#spr").val("");
				if(enname=="ganjing"){
					$("#sprtext").html("部门领导<span class='bt_span'>*</span>")
					$("#sprDiv").show();
					resetData("${ctx}/shenpi/paiche/getRoleUserForApply?isCommon="+iscommon+"&ename="+enname);
				}else if(enname=="bmld" && iscommon=="0"){
					$("#sprtext").html("分管领导<span class='bt_span'>*</span>")
					$("#sprDiv").show();
					resetData("${ctx}/shenpi/paiche/getRoleUserForApply?isCommon="+iscommon+"&ename="+enname);
				}else if(enname=="jwbzb_ld"&&iscommon=="0"){
					$("#sprtext").html("分管领导<span class='bt_span'>*</span>")
					$("#sprDiv").show();
					resetData("${ctx}/shenpi/paiche/getRoleUserForApply?isCommon="+iscommon+"&ename="+enname);
				}else{
					$("#sprDiv").hide();
				}
				//console.log(data1);
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