<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
			<p class="liu_dv_p2">抄送人：
				<c:forEach items="${histoicFlowList}" var="act"  varStatus="status">
						<c:if test="${status.index==0 }">
							${act.name}
						</c:if>
						<c:if test="${status.index!=0 }">
							、${act.name}
						</c:if>
				</c:forEach>
			</p>
