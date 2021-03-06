<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>
<t:template>
<jsp:attribute name="content">
	<c:if test="${user.admin}">
		<spring:url value="/player/wish" var="url"/>
		<form:form method="GET" class="pure-form-aligned" action="${url}">
			<fieldset>
				<legend>Voir la liste de souhait d'un joueur</legend>
				<div class="pure-control-group">
					<label for="player">Joueur</label>
					<select name="player">
						<c:forEach items="${players}" var="c">
							<option value="${c.id}">${c.name} (${c.clazz})</option>
						</c:forEach>
					</select>
				</div>
				<div class="pure-controls">
					<button type="submit" class="pure-button pure-button-primary">Voir</button>
				</div>
			</fieldset>
		</form:form>

		<c:if test="${player != null}">
			<spring:url value="/player/wish" var="url"/>
			<form:form method="POST" class="pure-form-aligned" action="${url}" modelAttribute="player">
				<input type="hidden" name="id" value="${player.id}" />
				<fieldset>
					<legend>Liste de souhait de ${player.name} (${player.clazz})</legend>
					<c:forEach items="${player.wishes}" var="w" varStatus="s">
						<div class="pure-control-group">
							<select name="wishes[${s.index}].item.id">
								<c:forEach items="${items}" var="item">
									<option value="${item.id}" <c:if test="${w.item.id==item.id}">selected="selected"</c:if>>${item.name}</option>
								</c:forEach>
							</select>
						</div>
					</c:forEach>
					<div class="pure-controls">
						<button type="submit" class="pure-button pure-button-primary">Modifier</button>
					</div>
				</fieldset>
			</form:form>
		</c:if>
	</c:if>

	<t:player-filter/>
	<table class="pure-table pure-table-horizontal">
		<thead>
			<tr>
				<th colspan="2">Joueur</th><th>Objet</th><th>Date d'ajout</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${wishes}" var="wish">
				<tr class="${wish.player.clazz}">
					<td>${wish.player.name}</td>
					<td><img class="class" src='<spring:url value="/img/${wish.player.clazz}.jpg"/>'/></td>
					<td><t:wowhead item="${wish.item}"/> ${wish.item.name}</td>
					<td><fmt:formatDate value="${wish.created}" pattern="dd/MM/yyyy"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</jsp:attribute>
</t:template>