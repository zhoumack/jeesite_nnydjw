<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>统计分析</title>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.picker.all.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/mui.dtpicker.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui/css/imgeviewer.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css" />
<link rel="stylesheet" href="${ctxStatic}/weui/css/weui2.css" />
<!-- mmenu -->
<link type="text/css" rel="stylesheet" href="${ctxStatic}/mmenu/css/jquery.mmenu.all.css" />
<%-- <script src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script> --%>
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/mmenu/js/jquery.mmenu.all.js"></script>

<script type="text/javascript" src="${ctxStatic}/weui/js/jquery-weui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<script src="${ctxStatic}/mui/js/mui.picker.all.js"></script>
<script src="${ctxStatic}/mui/js/mui.dtpicker.js"></script>
<script src="${ctxStatic}/mui/js/mui.previewimage.js"></script>
<script src="${ctxStatic}/mui/js/mui.zoom.js"></script>
<script src="${ctxStatic}/webuploader/webuploader.min.js"></script>
<script src="${ctxStatic}/mui/js/loading.js"></script>
<script src="${ctxStatic}/mui/js/echarts.common.min.js"></script>
</head>
<body>
	<style>
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
#poper_m{
	width: 100%;height: 100%;background-color: #fff;z-index: 99999;position: absolute;top: 0;opacity: 0.8;display: none;
}
#poper_dv{
	z-index: 999999;position: absolute;bottom:57px;right: 17px;display: none;
}
img{
vertical-align:middle
}
.mui-off-canvas-wrap.mui-active .mui-off-canvas-backdrop{
	box-shadow:inherit !important;
}
.mui-btn {
	font-size: 16px;
	padding: 8px;
	margin: 3px;
}
h5.mui-content-padded {
	margin-left: 3px;
	margin-top: 20px !important;
}
h5.mui-content-padded:first-child {
	margin-top: 12px !important;
}
.ui-alert {
	text-align: center;
	padding: 20px 10px;
	font-size: 16px;
}
.mui-btn{
	padding: 0px !important;
    margin: 0px !important;
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
	
</script>
	<!-- 悬浮区 -->
<%-- 	<img id="xuanfu" src="${ctxStatic}/mui/image/xuanfub.png" style="z-index: 99999; position: absolute; width: 14%; right: 0px; bottom: 85px"> --%>
	<img id="rc_btn" src="${ctxStatic}/mui/image/rc_more.png" style="z-index: 99999; position: absolute; width: 40px; right: 17px; bottom: 67px">
	 <div id="poper_m"></div>
		<div id="poper_dv">
		<div style="margin-bottom: 8px">
			<span style="color: #777777;font-size: 18px">返回</span>
			<img id="xuanfu" src="${ctxStatic}/mui/image/fanhui.png" width="45px" />
		</div>
	</div>
	<!--内容  -->
	<!--侧滑菜单容器-->
	<div class="mui-scroll-wrapper">
	<div class="mui-scroll">
		<div>
		<!--这里放置真实显示的DOM内容-->
		<div class="content">
			<div class="t_row">
				<div class="row_div">
					<a class="t_a" href="#"> <span
						class="t_span">开始时间</span>
						<div class="t_div t_div1" id='demo2'>
							<input id="starttime" type="text" name="" placeholder="请选择" class="t_input" readonly="readonly" />
						</div>
					</a>
				</div>
				<div class="row_div">
					<a class="t_a" href="#"> <span
						class="t_span">结束时间</span>
						<div class="t_div t_div1" id="t_div">
							<input id="endtime" type="text" name="endtime" placeholder="请选择"
								class="t_input" readonly="readonly" />
						</div>
					</a>
				</div>
				
				<div  id="sel" class="row_div" style="display:none">
					<span class="t_span" style="float:left;">选择人员
							</span>
						<div  >
							<select id="userId" class="mui-btn mui-btn-block">
							</select>
						</div>
				</div>
				
				<div  id="office" class="row_div" style="display:none">
					<span class="t_span" style="float:left;">选择部门
							</span>
						<div  >
							<select id="officeId" class="mui-btn mui-btn-block">
							</select>
						</div>
				</div>
				
				<div id="states"  class="row_div" style="display:none">
					<span class="t_span" style="float:left;">选择类型
							</span>
						<div>
							<select id="state" class="mui-btn mui-btn-block">
								<option value="0" selected = "selected">未完成</option>
								<option value="1">已完成</option>
								<option value="2">申请量</option>
							</select>
					   </div>
				</div>
				
				
				</div>
				
			</div>
			<div class="row_div">
				<p style="margin: 10px 15px;">
					<button id="offCanvasHide" type="button" class="mui-btn mui-btn-danger mui-btn-block" style="padding: 5px 20px;">查询</button>
				</p>
			</div>
			 
		</div>
		<div class="mui-content-padded">
				<!-- 个人的数据 -->
				<div id="area" style="margin-left: 10%;width: 80%;height: 250px;display:none">
				</div>
				<!-- 部门下所有人员的数据  -->
				<div id="area2" style="margin-left: 10%;width: 80%;height: 250px;display:none">
				</div>
				<!--  查询所有部门的数据  -->
				<div id="area5" style="margin-left: 10%;width: 80%;height: 250px;display:none">
				</div>
				
				<div id="kong" style="display:none;letter-spacing:-2px;position: absolute;top: 100%;width:100%;text-align:center"> 
					<img src="${ctxStatic}/mui/img/zwsj.png" style="width:60%;height:30%" >
				</div> 
		</div>
		</div>
	</div>
	</div>
	<script>
	mui('.mui-scroll-wrapper').scroll({
		deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
	});
	//全局权限
	var role=0;
	
	$(function() {
		//获取权限
		getRole();
	});
	
	
	function getRole(){
		var data={
				
		}
		$.getJSON("${ctx}/act/count/getRoleByUserId",{newdate: new Date()},function(jsonData){
			console.log("权限:"+jsonData);
			role = jsonData;
			if(jsonData=="1"){
				//显示人员
				$("#sel").css("display","block");
				//获取部门人列表
				getUser();
				//初始化数据
				getDataOffices();
			}else if(jsonData=="2"){
				//显示部门
				$("#office").css("display","block");
				//显示状态
				$("#states").css("display","block");
				//获取部门列表
			  	getOffice();
				//初始化数据
				getData5();
			}else if(jsonData=="0"){
				$("#states").css("display","block");
				//初始化数据
				getDataPerson();
			}
			
			
		});
		
	}
	//获取部门下的人员
	function getUser(){
		$.getJSON("${ctx}/sys/office/officetreejson",{},function(jsonData){
			//console.log(JSON.stringify(jsonData));
			//初始化一个参数
			$("#userId").append("<option value='0' selected = 'selected'>请选择人员</option>");
			$("#userId").append("<option value='0' >所有人员</option>");
			setUser(jsonData);
			
		});
	}
	
    //递归部门下面的人
    function setUser(jsonData,officesName){
    	for(var i=0;i<jsonData[0].children.length;i++){
			if(jsonData[0].children[i].type==1){
				console.log(1);
				iterUser(jsonData[0].children[i],jsonData[0].children[i].name);
			}else{
				console.log(2);
				if(officesName){
					$("#userId").append("<option value='"+jsonData[0].children[i].id+"'>"+jsonData[0].children[i].name+"("+officesName+")</option>");
				}else{
					$("#userId").append("<option value='"+jsonData[0].children[i].id+"'>"+jsonData[0].children[i].name+"</option>");
				}
			}
			
		}
    }
	function iterUser(jsonData,officesName){
		for(var i=0;i<jsonData.children.length;i++){
			if(jsonData.children[i].type==1){
				console.log(1);
				iterUser(jsonData.children[i],jsonData[0].children[i].name);
			}else{
				console.log(2);
				if(officesName){
					$("#userId").append("<option value='"+jsonData.children[i].id+"'>"+jsonData.children[i].name+"("+officesName+")</option>");
				}else{
					$("#userId").append("<option value='"+jsonData.children[i].id+"'>"+jsonData.children[i].name+"</option>");
				}
			}
			
		}
	}
	//获取所有部门列表
	function getOffice(){
		$.getJSON("${ctx}/sys/office/officesjson",{},function(jsonData){
			//初始化一个参数
			console.log("部门"+JSON.stringify(jsonData));
			$("#officeId").append("<option value='0' selected = 'selected'>请选择部门</option>");
			$("#officeId").append("<option value='0' >所有部门</option>");
			for(var i=0;i<jsonData.length;i++){
				$("#officeId").append("<option value='"+jsonData[i].officeId+"'>"+jsonData[i].officeName+"</option>");
			}
		});
	}
	//时间格式化
	function setData(date1,type){
		var date =  new Date(date1);
		var y = 1900+date.getYear();
	    var m = "0"+(date.getMonth()+1);
	    var d = "0"+date.getDate();
	    var date="";
	    if(type=="0"){
	    	date =  /* y+"-"+ */m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
	    }else{
	    	date =  y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
	    }
		return date;
	}
	
	//获取个人数据
	function getDataPerson(id,startTime,endTime,state) {
		var data = {
			'id':id,
			'startTime':startTime,
			'endTime':endTime,
			'state':state
		};
		console.log("参数="+JSON.stringify(data));
		$.getJSON("${ctx}/data/getPersonData",data,function(jsonData){
			console.log("返回结果="+JSON.stringify(jsonData));
			var name=[];
			var val=[];
			if(jsonData.length<=0){
				$("#kong").css("display","block");
				$("#area").css("display","none");
				
			}else{
				$("#kong").css("display","none");
				$("#area").css("display","block");
				
				//$("#area").css("display","block");
				for(var index in jsonData){
				    var date = setData(jsonData[index].date,0);
				    name.push(date);
				    var startDate = setData(jsonData[index].date,1);
				    var val_id = {
				    		'value':jsonData[index].count,
				    		'startDate':startDate
				    }
				    val.push(val_id);
				    
				    //val.push(jsonData[index].count);
				    
				}
				var title='';
				if(state==0 || state==null || state==""){
					title = '未完成数量统计分析';
				}else if(state=="1"){
					title = '工作量统计分析';
				}else{
					title = '发起申请次数统计分析';
				}
				// 初始化echarts实例   区域案件分布柱状图
				//$("#area").css("display","block");
				var myChart = echarts.init(document.getElementById('area'));
				// 指定图表的配置项和数据
				var option = {
					title: {
						text: title,
						x: 'center',
						align: 'right'
					},
					tooltip: {},
					grid: {
						left: 20
					},
					legend: {
						data: ['次数'],
						top: 30,
						x: 'left'
					},
					xAxis: {
						data: name
					},
					dataZoom: [//给x轴设置滚动条
					       {
					           start:0,//默认为0
					           end: 100-1500/31,//默认为100
					           type: 'slider',
					           show: true,
					           xAxisIndex: [0],
					           handleSize: 0,//滑动条的 左右2个滑动条的大小
					           height: 10,//组件高度
					           left: '10%', //左边的距离
					           right: '10%',//右边的距离
					           bottom: 26,//右边的距离
					           borderColor: "#000",
					           fillerColor: '#ff9a69',
					           borderRadius:5,
					           backgroundColor: '#98cdcc',//两边未选中的滑动条区域的颜色
					           showDataShadow: false,//是否显示数据阴影 默认auto
					           showDetail: false,//即拖拽时候是否显示详细数值信息 默认true
					           realtime:true, //是否实时更新
					           filterMode: 'filter'
					           },
					           //下面这个属性是里面拖到
					       {
					           type: 'inside',
					           show: true,
					           xAxisIndex: [0],
					           start: 0,
					           end: 100-1500/31
					       },
					    ],
					yAxis: {},
					series: [{
						name: '次数',
						type: 'bar',
						itemStyle: {
			                   normal: {
			                        color: function(params) {
			                            var colorList = [
			                            	'#feffcc','#ccffff','#ffcdcb','#99cccc',
			                            	'#ffcd99','#ff9a99','#986899','#ffcd99',
			                            	'#cc9a98','#cbcd99','c3dbe2','#8cc637','#e792b4'
			                            ];
			                            return colorList[params.dataIndex]
			                        }
			                    }
			                },
			            barWidth:20,
						data: val
					}]
				};
				myChart.on('click',function(param){
					getUrl(param);
				});
				
				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(option);
			} 
			
		});

	}
	
	
	
	//获取部门下所有人员数据
	function getDataOffices(officeId,startTime,endTime,state) {
		var data = {
			'officeId':officeId,
			'startTime':startTime,
			'endTime':endTime,
			'state':state
		};
		console.log("参数="+JSON.stringify(data));
		$.getJSON("${ctx}/data/departmentWorkloadStatistics",data,function(jsonData){
			console.log("部门所有人的数据getDataOffices="+JSON.stringify(jsonData));
			var name=[];
			var val=[];
			if(jsonData.length<=0){
				$("#kong").css("display","block");
				$("#area2").css("display","none")
				
			}else{
				$("#kong").css("display","none");
				$("#area2").css("display","block");
				
				for (var index in jsonData){
				    name.push(jsonData[index].statusName);
				    var val_id = {
				    		'value':jsonData[index].count,
				    		//'ID':jsonData[index].assignee
				    }
				    val.push(val_id);
				}
				var title='';
				if(state==0 || state==null || state==""){
					title = '未完成数量统计分析';
				}else if(state==1){
					title = '工作量统计分析';
				}else{
					title = '发起申请次数统计分析';
				}
				// 初始化echarts实例   区域案件分布柱状图
				//$("#area2").css("display","block");
				var myChart = echarts.init(document.getElementById('area2'));
				// 指定图表的配置项和数据
				var option = {
					title: {
						text: "工作统计分析",
						x: 'center',
						align: 'right'
					},
					tooltip: {},
					grid: {
						left: 20
					},
					legend: {
						data: ['次数'],
						top: 30,
						x: 'left'
					},
					xAxis: {
						data: name
					},
					dataZoom: [//给x轴设置滚动条
					       {
					           start:0,//默认为0
					           end: 100-1500/31,//默认为100
					           type: 'slider',
					           show: true,
					           xAxisIndex: [0],
					           handleSize: 0,//滑动条的 左右2个滑动条的大小
					           height: 10,//组件高度
					           left: '10%', //左边的距离
					           right: '10%',//右边的距离
					           bottom: 26,//右边的距离
					           borderColor: "#000",
					           fillerColor: '#ff9a69',
					           borderRadius:5,
					           backgroundColor: '#98cdcc',//两边未选中的滑动条区域的颜色
					           showDataShadow: false,//是否显示数据阴影 默认auto
					           showDetail: false,//即拖拽时候是否显示详细数值信息 默认true
					           realtime:true, //是否实时更新
					           filterMode: 'filter',
					           },
					           //下面这个属性是里面拖到
					       {
					           type: 'inside',
					           show: true,
					           xAxisIndex: [0],
					           start: 0,//默认为1
					           end: 100-1500/31,//默认为100
					       },
					    ],
					dataZoom: [//给x轴设置滚动条
					       {
					           start:0,//默认为0
					           end: 100-1500/31,//默认为100
					           type: 'slider',
					           show: true,
					           xAxisIndex: [0],
					           handleSize: 0,//滑动条的 左右2个滑动条的大小
					           height: 10,//组件高度
					           left: '10%', //左边的距离
					           right: '10%',//右边的距离
					           bottom: 26,//右边的距离
					           borderColor: "#000",
					           fillerColor: '#ff9a69',
					           borderRadius:5,
					           backgroundColor: '#98cdcc',//两边未选中的滑动条区域的颜色
					           showDataShadow: false,//是否显示数据阴影 默认auto
					           showDetail: false,//即拖拽时候是否显示详细数值信息 默认true
					           realtime:true, //是否实时更新
					           filterMode: 'filter',
					           },
					           //下面这个属性是里面拖到
					       {
					           type: 'inside',
					           show: true,
					           xAxisIndex: [0],
					           start: 0,//默认为1
					           end: 100-1500/31,//默认为100
					       },
					    ],
					yAxis: {},
					series: [{
						name: '次数',
						type: 'bar',
						itemStyle: {
		                    normal: {
		                        color: function(params) {
		                            var colorList = [
		                            	'#cc9a98','#cbcd99','c3dbe2','#8cc637',
		                            	'#ffcd99','#ff9a99','#986899','#ffcd99',
		                            	'#feffcc','#ccffff','#ffcdcb','#99cccc',
		                            	'#e792b4'
		                            ];
		                            return colorList[params.dataIndex]
		                        }
		                    }
		                },
		           	 	barWidth:20,
						data: val
					}]
				};
				
				/* myChart.on('click',function(param){
					getUrl(param);
				}); */
				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(option);
			}
			
		 }); 
	}
	
	//所有部门统计
	function getData5(startTime,endTime,state) {
		var data = {
			'startTime':startTime,
			'endTime':endTime,
			'state':state
		};
		console.log("getData5参数="+JSON.stringify(data));
		$.getJSON("${ctx}/data/departmentSumWorkloadStatistics",data,function(jsonData){
			console.log("返回结果5="+JSON.stringify(jsonData));
			var name=[];
			var val=[];
			if(jsonData.length<=0){
				$("#kong").css("display","block");
				$("#area5").css("display","none")
				
			}else{
				$("#kong").css("display","none");
				$("#area5").css("display","block");
				
				for (var index in jsonData){
				    name.push(jsonData[index].officeName);
				    val.push(jsonData[index].count);
				}
				// 初始化echarts实例   区域案件分布柱状图
				//$("#area5").css("display","block");
				var myChart = echarts.init(document.getElementById('area5'));
				var title='';
				if(state=='0' || state==null || state==""){
					title = '未完成数量统计分析';
				}else if(state=="1"){
					title = '工作量统计分析';
				}else{
					title = '发起申请次数统计分析';
				}
				// 指定图表的配置项和数据
				var option = {
					title: {
						text: title,
						x: 'center',
						align: 'right'
					},
					tooltip: {},
					grid: {
						left: 20
					},
					legend: {
						data: ['次数'],
						top: 30,
						x: 'left'
					},
					xAxis: {
						data: name
					},
					dataZoom: [//给x轴设置滚动条
					       {
					           start:0,//默认为0
					           end: 100-1500/31,
					           type: 'slider',
					           show: true,
					           xAxisIndex: [0],
					           handleSize: 0,//滑动条的 左右2个滑动条的大小
					           height: 10,//组件高度
					           left: '10%', //左边的距离
					           right: '10%',//右边的距离
					           bottom: 26,//右边的距离
					           borderColor: "#000",
					           fillerColor: '#ff9a69',
					           borderRadius:5,
					           backgroundColor: '#98cdcc',//两边未选中的滑动条区域的颜色
					           showDataShadow: false,//是否显示数据阴影 默认auto
					           showDetail: false,//即拖拽时候是否显示详细数值信息 默认true
					           realtime:true, //是否实时更新
					           filterMode: 'filter'
					           },
					           //下面这个属性是里面拖到
					       {
					           type: 'inside',
					           show: true,
					           xAxisIndex: [0],
					           start: 0,//默认为1
					           end: 100-1500/31
					       },
					    ],
					dataZoom: [//给x轴设置滚动条
					       {
					           start:0,//默认为0
					           end: 100-1500/31,//默认为100
					           type: 'slider',
					           show: true,
					           xAxisIndex: [0],
					           handleSize: 0,//滑动条的 左右2个滑动条的大小
					           height: 10,//组件高度
					           left: '10%', //左边的距离
					           right: '10%',//右边的距离
					           bottom: 26,//右边的距离
					           borderColor: "#000",
					           fillerColor: '#ff9a69',
					           borderRadius:5,
					           backgroundColor: '#98cdcc',//两边未选中的滑动条区域的颜色
					           showDataShadow: false,//是否显示数据阴影 默认auto
					           showDetail: false,//即拖拽时候是否显示详细数值信息 默认true
					           realtime:true, //是否实时更新
					           filterMode: 'filter'
					           },
					           //下面这个属性是里面拖到
					       {
					           type: 'inside',
					           show: true,
					           xAxisIndex: [0],
					           start: 0,//默认为1
					           end: 100-1500/31,
					       },
					    ],
					yAxis: {},
					series: [{
						name: '次数',
						type: 'bar',
						itemStyle: {
		                    normal: {
		                        color: function(params) {
		                            var colorList = [
		                            	'#cc9a98','#cbcd99','c3dbe2','#8cc637',
		                            	'#ffcd99','#ff9a99','#986899',
		                            	'#feffcc','#ccffff','#ffcdcb','#99cccc',
		                            	'#e792b4'
		                            ];
		                            return colorList[params.dataIndex]
		                        }
		                    }
		                },
		                barWidth:20,
						data: val
					}]
					
				};
				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(option);
			}
			
		 }); 
	}
	
	
	
	
		$("#rc_btn").on("tap",function(){
			$("#poper_m").show();
			$("#poper_dv").show();
		});
		$("#poper_m").on("tap",function(){
			$("#poper_m").hide();
			$("#poper_dv").hide();
		});
		function pulldownRefresh() {
			setTimeout(function() {
				window.location.reload();
				mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
			}, 1000);
		}

		mui.ready(function() {
			mui('body') .on( 'tap', 'a', function() {
								if (this.href
										&& this.href.indexOf("#") == -1
										&& !this.classList
												.contains('mui-action-back')) {
									var this_href = this.href;
									setTimeout(function() {
										window.location.href = this_href;
									}, 100);
								}
							});
			ele_drag("#rc_btn");
		});

		/*  */
		mui.init({
			swipeBack : false
		});
		(function($) {
			$('.mui-scroll-wrapper').scroll({
				indicators : true
			//是否显示滚动条
			});
		})(mui);
		var h = document.documentElement.clientHeight;
		var h1 = h - 98;
		$(".mui-control-content").css("min-height", h1);

		/* 控件拖动以及返回 */
		$('#xuanfu').on('tap', function() {
			mui.openWindow({
				url : "${ctx}/main/index"
			})
		})
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
		$(".t_div1").on("tap",function(){
			 openTimePicker(this)
		});
		$("#select1").on("tap",function(){
			 alert(1);
		});
		
		
		$('#offCanvasHide').on('tap',function(){
			var start =  $('#starttime').val();
			var end =  $('#endtime').val();
			var state = $('#state').val();
			
			if(role=="0"){
				getDataPerson('',start,end,state);
			}else if(role=="1"){
				var userId = $("#userId").val();
				if(userId=="0"){
					//查询部门所有人数据
					$("#area").css("display","none");
					getDataOffices('',start,end,state);
				}else{
					//查询具体个人数据
					$("#area2").css("display","none");
					getDataPerson(userId,start,end,state);
				}
			}else if(role=="2"){
				var officeId= $("#officeId").val();
				if(officeId==0){
					$("#area2").css("display","none");
					getData5(start,end,state);
				}else{
					$("#area5").css("display","none");
					getDataOffices(officeId,start,end,state);
				}
				
			}
			
			
		});
		
		
		function getUrl(param){
			//var start =  $('#starttime').val();
			//var end =  $('#endtime').val();
			var status = $('#state').val();
		
			if(status!="1"){
				return ;
			}
			//获取当前选择人ID
			var userId = $("#userId").val();
			if(userId==0 || userId==null){
				//0表示查所有 ，点击的ID存储在柱状图上
				userId=param.data.ID;
				console.log("点击人:"+userId);
			}else{
				//其他
				console.log("点击人:"+userId);
			}
			var start = param.data.startDate;
			console.log("时间"+start);
			
			userId = userId==null?"":userId;
			var url = "${ctx}/data/getListActByUser?assignee="+userId+"&status="+status+"&beginDate="+start+"&endDate="+start;
			window.location.href=url;
		}
		
		//修改人员时  触发事件
		 $("#userId").change(function(){ 
		 	var userId = $("#userId").val();
		 	if(userId=="0"){
		 		$("#states").css("display","none");
		 	}else{
		 		$("#states").css("display","block");
		 	}
		 });
		
		
	</script>

</body>

</html>