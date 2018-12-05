<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<%-- <script type="text/javascript" src="${ctxStatic}/form//weui/js/jquery.min.js"></script> --%>

<link rel="stylesheet" type="text/css" href="${ctxStatic}/form/css/mui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/form/css/mui.picker.all.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/form/css/mui.previewimage.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/form/webuploader/webuploader.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/form/css/public.css" />
<script type="text/javascript" src="${ctxStatic}/form/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/form/js/mui.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/form/js/mui.picker.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/form/js/mui.previewimage.js"></script>
<script type="text/javascript" src="${ctxStatic}/form/webuploader/webuploader.min.js"></script>

<!-- jquery validation  -->
<script src="${ctxStatic}/form/js/lib/jquery.js"></script>
<script src="${ctxStatic}/form/js/jquery.validate.min.js"></script>
<script src="${ctxStatic}/form/js/additional-methods.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/form/js/localization/messages_zh.js"></script><!-- 缺省提示文字-->

<title></title>
</head>
<body>
<%-- ${sysForm.formRendered} --%>
<div id="reder">
</div>
<input type="hidden" id="form_id" value="${id }" />
<input type="hidden" id="ctx" value="${ctx}" /><!-- 前缀 -->
</body>
<script type="text/javascript">
// $("body").load("renderedForm",{id:"e965bb87aba04f15841bd9f087fa9fbc"});
var form_id = $("#form_id").val();
//获取表单数据
$.get("${ctx}"+"/form/sysForm/renderedForm",{id:form_id}, function(data) {
    $('#reder').html(data); //画表单
    //设置标题
    var title = $("legend").text(); 
    $("title").text(title);
    //表单初始化之后 运行组件
    $.getScript("${ctxStatic}/form/js/public.js");
    //运行用户自定义脚本
    $.getScript("${ctx}/form/sysForm/formScript?id="+form_id);
});	
</script>
<%-- <script type="text/javascript" src="${ctxStatic}/form/js/public.js"></script> --%>
</html>