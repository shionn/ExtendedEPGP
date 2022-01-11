<%@ page pageEncoding="UTF-8"%>
<%@ page import="epgp.db.dbo.ItemSlot" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>
<t:template>
<jsp:attribute name="content">
	<t:player-filter/>
	<table class="pure-table pure-table-horizontal">
		<thead>
			<tr class="vert">
				<th>Player</th>
				<c:forEach items="${slots}" var="ss">
					<th>${ss[0].fr}</th>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${armories}" var="a">
				<tr>
					<td class="${a.player.clazz}">
						<c:if test="${user.admin}">
							<a class="pure-button button-success button-xsmall" href="<spring:url value="/armory/add/${a.player.id}"/>">+</a>
						</c:if>
						${a.player.name} 
					</td>
					<c:forEach items="${slots}" var="ss">
						<td>
							<c:forEach items="${a.items(ss)}" var="i">
								<t:wowhead item="${i}"/>
							</c:forEach>
						</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</jsp:attribute>

<jsp:attribute name="script">
</jsp:attribute>
</t:template>