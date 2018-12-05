<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>新闻详情</title>
	<style>
			*{
				margin: 0;
				padding: 0;
			}
			.new_header{
				text-align: center;
			}
			.new_header span{
				font-size: 12px;color:  #999;
			}
			.new_img{
				margin: 0 auto;text-align: center;padding-top: 10px; width: 95%;
			}
			.new_text{
				text-align: left;padding: 13px;color: #666;font-size: 13px;
			}
		</style>
</head>
<body>
	<!-- <div class="head_menu">
		<a href="#">
			<img  src="img/fanhui.png"/>
		</a>
		<p>新闻详情</p>
	</div> -->
	<div class="new_header" style="padding-top: 10px">
		<h4 style="font-size: 19px;color: #333">最高检第十期西部巡讲支教活动启动</h1>
		<span>
			2018年10月11日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文章来源：重庆市人民检察院
		</span>
	</div>
	<div class="new_img" >
		<img src="${ctxStatic}/mui/img/tu1.png" width="95%" height="95%"/>
	</div>
	<div class="new_text">
		9月15日，第十期西部巡讲支教活动启动，最高
		人民检察院党组书记、检察长张军希望支教检察官以
		习近平新时代中国特色社会主义思想为指导，深入学习贯彻
		全国教育大会精神，坚持问题导向、理念、引领、改革创新、知识方法
		并重、教学相长，助推提升西部地区检察机关工作能力水平，确保巡讲支教取得实效。
	</div>
</body>
</html>