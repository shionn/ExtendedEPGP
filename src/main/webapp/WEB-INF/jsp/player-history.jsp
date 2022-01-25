<%@ page pageEncoding="UTF-8"%>
<%@ page import="epgp.db.dbo.LootAttribution" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>
<t:template>
	<jsp:attribute name="content">
		<t:player-filter/>
		<table class="pure-table ">
			<thead>
				<tr class="vert">
					<th>Player</th>
					<c:forEach items="${raids}" var="r">
						<th>${r.instance} <fmt:formatDate pattern="dd/MM/yyyy" value="${r.date}"/></th>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${players}" var="p">
					<tr>
						<td class="${p.clazz}"><img class="class" src='<spring:url value="/img/${p.clazz}.jpg"/>'/> ${p.name}</td>
						<c:forEach items="${raids}" var="r">
							<c:set var="h" value="${p.history(r)}"/>
							<c:if test="${not empty h}">
								<td class="${p.clazz}">
									<c:forEach items="${h.loots}" var="l">
										<t:wowhead item="${l.item}" attribution="${l.attribution}"/>
									</c:forEach>
									<c:if test="${h.bench}"><i class="fa fa-university" aria-hidden="true" title="Bench"></i></c:if>
									<c:if test="${h.absent}"><i class="fa fa-eye-slash" aria-hidden="true" title="Absent"></i></c:if>
								</td>
							</c:if>
							<c:if test="${empty h}"><td style="background-color: #e0e0e0;"></td></c:if>
						</c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</jsp:attribute>
</t:template>