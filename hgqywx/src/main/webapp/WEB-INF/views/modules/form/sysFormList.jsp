<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>表单管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/form/sysForm/">表单列表</a></li>
		<shiro:hasPermission name="form:sysForm:edit"><li><a href="${pageContext.request.contextPath}/formbuilder/index.jsp" target="_blank" >表单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sysForm" action="${ctx}/form/sysForm/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>表单名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="30" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>表单标识</th>
				<th>表单名称</th>
				<!-- <th>表单定义对象</th>
				<th>表单内容</th> -->
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="form:sysForm:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysForm">
			<tr>
				<td><a href="${ctx}/form/sysForm/form?id=${sysForm.id}">
					${sysForm.formDef}
				</a></td>
				<td>
					${sysForm.name}
				</td>
				<%-- <td>
					${sysForm.formJsonObject}
				</td>
				<td>
					${sysForm.formRendered}
				</td> --%>
				<td>
					<fmt:formatDate value="${sysForm.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${sysForm.remarks}
				</td>
				<shiro:hasPermission name="form:sysForm:edit"><td>
				    <%-- <a href="${ctx}/form/sysForm/renderedFormPage?id=${sysForm.id}" target="_blank" >预览</a> --%>
    				<a href="${pageContext.request.contextPath}/formbuilder/index.jsp?id=${sysForm.id}" target="_blank" >修改</a>
					<a href="${ctx}/form/sysForm/delete?id=${sysForm.id}" onclick="return confirmx('确认要删除该表单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>