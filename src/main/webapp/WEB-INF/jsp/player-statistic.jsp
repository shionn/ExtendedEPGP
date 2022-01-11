<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>
<t:template>
	<jsp:attribute name="content">
		<t:player-filter/>
		<table class="pure-table pure-table-horizontal">
			<thead>
				<tr>
					<th colspan="2">Personnage</th>
					<th colspan="3">EPGP</th>
					<th>NbLoot</th>
					<th colspan="2">NbRaid</th>
					<th colspan="3">Présence</th>
					<th colspan="3">Présence / 14j</th>
					<th colspan="3">Présence / 28j</th>
				</tr>
				<tr>
					<th colspan="2"></th>
					<th>EP</th>
					<th>ER</th>
					<th>GP</th>
					<th></th>
					<th>Total</th>
					<th>SsLoot</th>
					<th>MC</th>
					<th>BWL</th>
					<th>AQ40</th>
					<th>MC</th>
					<th>BWL</th>
					<th>AQ40</th>
					<th>MC</th>
					<th>BWL</th>
					<th>AQ40</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${players}" var="player">
					<tr class="${player.clazz}">
						<td><img class="class" src='<spring:url value="/img/${player.clazz}.jpg"/>'/></td>
						<td class="border-right">${player.name}</td>
						<td>${player.epgp.ep} <small>${player.epgp.epgpPct}%</small></td>
						<td># <small>#</small></td>
						<td class="border-right">${player.epgp.gp}</td>
						<td class="border-right">#</td>
						<td>#</td>
						<td class="border-right">#</td>
						<td>${player.getAttendance('MC','always').attendance}</td>
						<td>${player.getAttendance('BWL','always').attendance}</td>
						<td class="border-right">${player.getAttendance('AQ40','always').attendance}</td>
						<td>${player.getAttendance('MC','day14').attendance}</td>
						<td>${player.getAttendance('BWL','day14').attendance}</td>
						<td class="border-right">${player.getAttendance('AQ40','day14').attendance}</td>
						<td>${player.getAttendance('MC','day28').attendance}</td>
						<td>${player.getAttendance('BWL','day28').attendance}</td>
						<td>${player.getAttendance('AQ40','day28').attendance}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
<%-- 		<table class="pure-table pure-table-horizontal"> --%>
<%-- 			<thead> --%>
<%-- 				<tr> --%>
<%-- 					<th>Nom</th> --%>
<%-- 					<th>NbLoot</th> --%>
<%-- 					<th>Derniere fois</th> --%>
<%-- 				</tr> --%>
<%-- 			</thead> --%>
<%-- 			<tbody> --%>
<%-- 				<c:forEach items="${items}" var="i"> --%>
<%-- 					<tr> --%>
<%-- 						<td>${i.name}</td> --%>
<%-- 						<td>${i.count}</td> --%>
<%-- 						<td><fmt:formatDate value="${i.last}" pattern="dd/MM/yyyy"/></td> --%>
<%-- 					</tr> --%>
<%-- 				</c:forEach> --%>
<%-- 			</tbody> --%>
<%-- 		</table> --%>
	</jsp:attribute>
</t:template>