<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	  	
			<p class="liu_dv_p1">审批流程</p>
			<c:forEach items="${histoicFlowList}" var="act"  varStatus="status">
				<c:if test="${ status.index!=0 and status.last!=true  }">
					<div class="liu_dv_dv">
							<img id="" src="${ctxStatic }/mui/img/gou.png" width="20px" height="20px" />
							<img src="${ctxStatic}/mui/img/header.jpg" width="20px" height="20px"/>
							<span>${act.assigneeName }·${act.histIns.activityName}${empty  act.flag?'':'·'}${act.flag }</span>
							<span style="font-size:10px;float:right;margin-right: 15px;margin-top: 3px">
								<fmt:formatDate value="${act.histIns.endTime}" type="both" pattern="yyyy-MM-dd HH:mm"/>
							</span>
							<br style="clear:both;">
							<div style="width:0.1px;border:1px solid #8fb8e9;height: 20px;position: relative;left:8px">
							</div>
					</div>
				</c:if>
				
				<c:if test="${status.last!=false}" >
					<div class="liu_dv_dv"  style="margin-bottom: 15px;">
							<img id="" src="${ctxStatic }/mui/img/yuan.png" width="20px" height="20px" />
							<img src="${ctxStatic}/mui/img/header.jpg" width="20px" height="20px"/>
							<span>${act.assigneeName }·${act.histIns.activityName}${empty  act.flag?'':'·'}${act.flag }</span>
							<span style="font-size:10px;float:right;margin-right: 15px;margin-top: 3px">
								<fmt:formatDate value="${act.histIns.endTime}" type="both" pattern="yyyy-MM-dd HH:mm"/>
							</span>
							<br style="clear:both;">
					</div>
				</c:if>

				<%-- <c:if test="${not empty act.histIns.endTime and status.index!=0 and status.index!=1 }">
					<div class="liu_dv_dv" style="margin-bottom: 15px;">
						<img id="" src="${ctxStatic }/mui/img/yuan.png" width="20px" height="20px" />
						<img src="${ctxStatic}/mui/img/header.jpg" width="20px" height="20px"/>
						<span>${act.assigneeName }·已同意</span>
						<span style="font-size:10px;float:right;margin-right: 15px;margin-top: 3px">
							<fmt:formatDate value="${act.histIns.endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
						</span>
						<br style="clear:both;">
					</div>
				</c:if>
				<c:if test="${empty act.histIns.endTime }">
					<div class="liu_dv_dv" style="margin-bottom: 15px;">
					<img id="" src="${ctxStatic }/mui/img/yuan.png" width="20px" height="20px" />
					<img src="${ctxStatic}/mui/img/header.jpg" width="20px" height="20px"/>
					<span>
						${act.assigneeName }·审批中
					</span>
					<br style="clear:both;">
				</div>
				</c:if> --%>
				
			</c:forEach>

