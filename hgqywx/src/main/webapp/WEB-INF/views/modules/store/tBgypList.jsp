<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>办公物品仓库管理</title>
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
		<li class="active"><a href="${ctx}/store/tBgyp/">办公物品仓库列表</a></li>
		<shiro:hasPermission name="store:tBgyp:edit">
			<li>
			  <a href="${ctx}/store/tBgyp/form">办公物品仓库添加</a>
			</li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="TBgyp" action="${ctx}/store/tBgyp/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		
		<ul class="ul-form">
			<li><label>办公用品名：</label>
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
				<th>办公用品名称</th>
				<th>库存数量</th>
				<th>办公用品分类</th>
				<th>更新时间</th>
				<shiro:hasPermission name="store:tBgyp:edit"><th>操作</th></shiro:hasPermission>
				<!-- <th>操作</th> -->
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tBgyp">
			<tr>
				<td><a href="${ctx}/store/tBgyp/form?id=${tBgyp.id}">
					${tBgyp.name}
				</a></td>
				<td>${tBgyp.nums}</td>
				<td>${fns:getDictLabel(tBgyp.type, 'bgyplqType', '无')}</td>
				<td>
					<fmt:formatDate value="${tBgyp.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="store:tBgyp:edit">
					<td>
	    				<a href="${ctx}/store/tBgyp/form?id=${tBgyp.id}">修改</a>
						<a href="${ctx}/store/tBgyp/delete?id=${tBgyp.id}" onclick="return confirmx('确认要删除该办公物品仓库吗？', this.href)">删除</a>
					</td>
				</shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>