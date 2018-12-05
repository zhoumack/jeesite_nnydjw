<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>物品仓库记录管理</title>
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
		<li class="active"><a href="${ctx}/store/tBgypLog/">物品仓库记录列表</a></li>
		<shiro:hasPermission name="store:tBgypLog:edit"><li><a href="${ctx}/store/tBgypLog/form">物品仓库记录添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="TBgypLog" action="${ctx}/store/tBgypLog/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>物品名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="30" class="input-medium"/>
			</li>
			<li><label>出入库：</label>
				<form:select path="inoutFlag" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('inout_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>业务类型：</label>
				<form:select path="businessType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('wplx')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>物品名称</th>
				<th>出入库</th>
				<th>出入库数量</th>
				<th>业务类型</th>
				<th>创建人</th>
				<th>创建时间</th>
				<shiro:hasPermission name="store:tBgypLog:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tBgypLog">
			<tr>
				<td><a href="${ctx}/store/tBgypLog/form?id=${tBgypLog.id}">
					${tBgypLog.name}
				</a></td>
				<td>
					${fns:getDictLabel(tBgypLog.inoutFlag, 'inout_flag', '')}
				</td>
				<td>
					${tBgypLog.nums}
				</td>
				<td>
					${fns:getDictLabel(tBgypLog.businessType, 'wplx', '')}
				</td>
				<td>
					${fns:getUserById(tBgypLog.createBy).name}
				</td>
				<td>
					<fmt:formatDate value="${tBgypLog.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="store:tBgypLog:edit"><td>
    				<a href="${ctx}/store/tBgypLog/form?id=${tBgypLog.id}">修改</a>
					<a href="${ctx}/store/tBgypLog/delete?id=${tBgypLog.id}" onclick="return confirmx('确认要删除该办公用品仓库记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>