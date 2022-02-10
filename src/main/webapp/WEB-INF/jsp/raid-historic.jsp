<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>
<t:template>
	<jsp:attribute name="content">
		<c:forEach items="${raids}" var="raid" varStatus="i">
			<table class="pure-table pure-table-horizontal">
				<thead>
					<tr>
						<th colspan="3" style="text-align:center">
							[${raid.instance}] ${raid.name}
							<fmt:formatDate pattern="dd/MM/yyyy" value="${raid.date}"/>
							(${raid.entries.size()})
							
							<c:if test="${user.admin}">
								<a href='<spring:url value="/raid/edit/${raid.id}"/>' class="pull-right fa fa-pencil"></a>
							</c:if>
							<a href='<spring:url value="/raid/rcloot/${raid.id}"/>' class="pull-right fa fa-download" title="csv-rcloot"></a>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${raid.entries}" var="e" varStatus="i">
						<tr class="${e.player.clazz}">
							<td>
								${e.player.name}
								<c:if test="${e.bench}"><i class="fa fa-university" aria-hidden="true" title="Bench"></i></c:if>
								<c:if test="${e.absent}"><i class="fa fa-eye-slash" aria-hidden="true" title="Absent"></i></c:if>
							</td>
							<td><img class="class" src='<spring:url value="/img/${e.player.clazz}.jpg"/>'/></td>
							<td>
								<c:forEach items="${e.loots}" var="loot">
									<t:wowhead item="${loot.item}"/>
									<small>(${loot.attribution.shorten})</small>
								</c:forEach>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:forEach>
	</jsp:attribute>
	<jsp:attribute name="script">
	</jsp:attribute>
</t:template>