<div class="timeline" style="background-color: white;">
		<>
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
				<c:if test="${status.first==true}">
					<div  class="timeline-item-head"> 
				   		<i class="weui_icon weui_icon_success_no_circle timeline-item-checked hide" ></i> 
				   	</div> 
				</c:if>
			   	<div class="timeline-item-tail" ></div> 
			   	<div class="timeline-item-content"> 
			   		<h4>${act.assigneeName}</h4> 
			   		<p><fmt:formatDate value="${act.histIns.endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;${act.histIns.activityName}</p> 
			   	</div> 
		   	</li>
		</c:forEach>
		</ul>
  </div>