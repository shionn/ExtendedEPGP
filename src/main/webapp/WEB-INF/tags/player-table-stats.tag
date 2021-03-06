<%@ tag pageEncoding="UTF-8"%>
<%@ tag import="epgp.db.dbo.LootAttribution" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table class="pure-table pure-table-horizontal">
	<thead>
		<tr>
			<th colspan="2">Personnage</th>
			<th colspan="2">EPGP</th>
			<th colspan="3">NbLoot</th>
			<th colspan="2">SsLoot</th>
			<th colspan="4">Présence</th>
			<th colspan="3">Présence / 14j</th>
			<th colspan="3">Présence / 28j</th>
		</tr>
		<tr>
			<th colspan="2"></th>
			<th>EP</th>
			<th>GP</th>
			<th>${LootAttribution.wishList.shorten}</th>
			<th>${LootAttribution.primary.shorten}</th>
			<th>${LootAttribution.secondary.shorten}</th>
			<th>${LootAttribution.wishList.shorten}</th>
			<th>${LootAttribution.primary.shorten}</th>
			<th>Total</th>
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
				<td class="border-right">${player.epgp.gp}</td>
				<td>${player.lootCount(LootAttribution.wishList)}</td>
				<td>${player.lootCount(LootAttribution.primary)}</td>
				<td class="border-right">${player.lootCount(LootAttribution.secondary)}</td>
				<td>${player.noLoot(LootAttribution.wishList).nbRaid}</td>
				<td class="border-right">${player.noLoot(LootAttribution.primary).nbRaid}</td>
				<td>${player.allAttendancesCount}</td>
				<td>${player.attendance('MC','always').attendance}</td>
				<td>${player.attendance('BWL','always').attendance}</td>
				<td class="border-right">${player.attendance('AQ40','always').attendance}</td>
				<td>${player.attendance('MC','day14').attendance}</td>
				<td>${player.attendance('BWL','day14').attendance}</td>
				<td class="border-right">${player.attendance('AQ40','day14').attendance}</td>
				<td>${player.attendance('MC','day28').attendance}</td>
				<td>${player.attendance('BWL','day28').attendance}</td>
				<td>${player.attendance('AQ40','day28').attendance}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
