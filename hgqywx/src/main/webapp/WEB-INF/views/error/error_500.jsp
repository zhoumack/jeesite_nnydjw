<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<script src="${ctxStatic}/mui/js/mui.min.js"></script>
<link href="${ctxStatic}/mui/css/mui.min.css" rel="stylesheet"/>
<title>提示</title>
<style>
			*{
				margin: 0;
				padding: 0;
			}
			body{
				background-color: #fff !important;
			}
			#ts_center{
				text-align: center;padding-top: 50px;
			}
			#ts_center_p1{
				color: #000;
				margin-bottom: 5px;
			    font-weight: 400;
			    font-size: 20px;
			}
			.ts_center_dv{
				margin-bottom: 25px; padding: 16px 20px;
			}
		</style>
	</head>

	<body bgcolor="">
		<div id="ts_center">
			<img src="${ctxStatic}/mui/image/shibai1.png" width="120px" height="120px"/>
			<div class="ts_center_dv" style="">
				<p id="ts_center_p1">${msg}</p>
			</div>
			
		</div>
		<div style="text-align: center;">
			<button id="ts_btn" type="button" class="mui-btn mui-btn-primary mui-btn-block" style="width: 95%;padding: 7px 0;margin: 0 auto;border-radius: 35px;">
				返回
			</button>
		</div>
		<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js"></script>
		<script type="text/javascript">
			mui.init()
			$('#ts_btn').on('tap', function() {
				history.go(-1);
			});
		</script>
	</body>
</html>