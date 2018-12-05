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
				text-align: left !important;
				padding: 13px !important;
				color: #666 !important;
				font-size: 13px !important;
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
	<c:forEach items="article" >
		<div class="new_header" style="padding-top: 10px">
			<h4 style="font-size: 19px;color: #333">${article.title }</h1>
			<span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文章来源：${article.articleData.copyfrom }
			</span>
		</div>
		<%-- <div class="new_img" >
			<img src="${ctxStatic}/mui/img/tu1.png" width="95%" height="95%"/>
		</div> --%>
		<div class="new_text">
			${article.articleData.content }
		</div>
	</c:forEach>
</body>
<script type="text/javascript" src="${ctxStatic}/weui/js/jquery.min.js" ></script>
<script>

$(document).ready(function(){
	$(".new_text").find("img").css("width","100%");
	$(".new_text").find("img").css("height","auto");
});
</script>

</html>