<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="procInsId" type="java.lang.String" required="true" description="流程实例ID"%>
<%@ attribute name="startAct" type="java.lang.String" required="false" description="开始活动节点名称"%>
<%@ attribute name="endAct" type="java.lang.String" required="false" description="结束活动节点名称"%>
<!-- <fieldset>
	<legend>流转信息</legend> -->
	<div id="histoicMobileFlowList_3" class="timeline" style="background-color: white;">
	</div>
<!-- </fieldset> -->
<script type="text/javascript">
	var data={
		copy:'${procInsId}'
	}
	console.log(JSON.stringify(data));
	$.post("${ctx}/data/getAssignsForCs",data, function(jsonData){
		$("#histoicMobileFlowList_3").html(jsonData);
	});
</script>