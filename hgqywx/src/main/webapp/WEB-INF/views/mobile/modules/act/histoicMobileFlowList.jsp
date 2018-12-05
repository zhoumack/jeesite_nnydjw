<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	  	<ul>
	    <c:forEach items="${histoicFlowList}" var="act"  varStatus="status">
				<%-- <td>${act.histIns.activityName}</td>
				<td>${act.assigneeName}</td>
				<td><fmt:formatDate value="${act.histIns.startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${act.histIns.endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td style="word-wrap:break-word;word-break:break-all;">${act.comment}</td>
				<td>${act.durationTime}</td> --%>
			<li class="timeline-item"> 
				<c:if test="${status.first==true}">
					<div class="timeline-item-head-first"> 
				  		<i class="weui_icon weui_icon_success_no_circle timeline-item-checked"></i> 
				  	</div> 
				</c:if>
				<c:if test="${status.first!=true}">
					<div  class="timeline-item-head"> 
				   		<i class="weui_icon weui_icon_success_no_circle timeline-item-checked hide" ></i> 
				   	</div> 
				</c:if>
			   	<div class="timeline-item-tail" ></div> 
			   	<div class="timeline-item-content"> 
			   		<h4>${act.assigneeName}&nbsp;&nbsp;&nbsp;&nbsp;[${act.histIns.activityName}] &nbsp; ${act.flag} </h4> 
			   		<%-- <p><fmt:formatDate value="${act.histIns.endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
			   				&nbsp;&nbsp;${act.histIns.activityName}
			   		</p>  --%>
			   		<c:if test="${status.first !=true or  not empty act.histIns.startTime}">
			   			<p>开始时间:<fmt:formatDate value="${act.histIns.startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;</p> 
			   		</c:if>
			   		<c:if test="${status.last!=true or  not empty act.histIns.endTime}">
			   			<p>结束时间:<fmt:formatDate value="${act.histIns.endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;</p> 
			   		</c:if>
			   	</div> 
		   	</li>
		</c:forEach>
		</ul>
