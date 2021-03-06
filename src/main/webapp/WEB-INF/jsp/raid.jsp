<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>
<t:template>
<jsp:attribute name="content">
	<c:if test="${not empty items}">
		<spring:url value="/raid/wish" var="url"/>
		<form:form method="GET" class="pure-form-aligned" action="${url}">
			<fieldset>
				<legend>Voir la liste de souhait Sur un objet</legend>
				<div class="pure-control-group">
					<label for="item">Objet</label>
					<select name="item">
						<c:forEach items="${items}" var="c">
							<option value="${c.id}">${c.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="pure-controls">
					<button type="submit" class="pure-button pure-button-primary">Voir</button>
				</div>
			</fieldset>
		</form:form>
	</c:if>
	<c:if test="${not empty wishes}">
		<t:player-table-stats/>
	</c:if>	
	<c:forEach items="${raids}" var="raid">
		<c:if test="${user.admin}">
			<spring:url value="/raid/update" var="url"/>
			<form:form method="POST" class="pure-form pure-form-aligned" modelAttribute="raid" action="${url}">
				<fieldset>
					<legend>${raid.name}</legend>
					<input type="hidden" name="id" value="${raid.id}">
					<div class="pure-control-group">
						<label for="name">Nom</label>
						<input type="text" name="name" value="${raid.name}">
					</div>
					<div class="pure-control-group">
						<label for="instance">Instance</label>
						<select name="instance">
							<c:forEach items="${instances}" var="c">
								<option value="${c}" <c:if test="${raid.instance==c}">selected="selected"</c:if>>${c}</option>
							</c:forEach>
						</select>
					</div>
					<div class="pure-control-group">
						<label for="date">Date</label>
						<input type="date" name="date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${raid.date}"/>">
					</div>
					<div class="pure-controls">
						<label for="running">
							<input type="checkbox" name="running" <c:if test="${raid.running}"> checked="checked"</c:if>>
							En cours (une fois d??coch?? le raid n'est plus ??ditable et tout est comptatbilis??).
						</label>
					</div>
					<div class="pure-controls">
						<button type="submit" class="pure-button pure-button-primary">Sauvegarder</button>
					</div>
				</fieldset>
			</form:form>
		</c:if>
		
		<table class="pure-table pure-table-horizontal">
			<thead>
				<tr>
					<th colspan="4">
						Membre participant 
						<c:if test="${user.admin}"> ( <a href='<spring:url value="/raid/edit/member/${raid.id}"/>'>Editer / Ajouter</a> ) </c:if>
					</th>
				</tr>
				<tr>
					<th><a href='<spring:url value="/raid/sort/name"/>' style="text-decoration: none; color: black;">Personnage ${raid.entries.size()}</a></th>
					<th><a href='<spring:url value="/raid/sort/clazz"/>' style="text-decoration: none; color: black;">Classe</a></th>
					<th>Status</th>
					<th>Loot</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${raid.entries}" var="e" varStatus="i">
					<tr>
						<td class="${e.player.clazz}">
							<input type="hidden" name="entries[${i.index}].player.id" value="${e.player.id}">
							${e.player.name}
						</td>
						<td><img class="class" src='<spring:url value="/img/${e.player.clazz}.jpg"/>'/></td>
						<td>
							<c:if test="${e.bench}"><i class="fa fa-university" aria-hidden="true"></i></c:if>
							<c:if test="${e.absent}"><i class="fa fa-eye-slash" aria-hidden="true"></i></c:if>
							<c:if test="${e.quit}"><i class="fa fa-sign-out" aria-hidden="true"></i></c:if>
						</td>
						<td>
							<c:if test="${not user.admin}">
								<c:forEach items="${e.loots}" var="loot">
									<t:wowhead item="${loot.item}"/> (${loot.attribution.shorten})
								</c:forEach>
							</c:if>
							<c:if test="${user.admin}">
								<c:forEach items="${e.loots}" var="loot">
									<a class="pure-button button-error button-xsmall" href='<spring:url value="/raid/loot/${raid.id}/${e.player.id}/${loot.item.id}"/>'>- ${loot.item.name} (${loot.attribution.shorten})</a>,
								</c:forEach>
								<a class="pure-button button-success button-xsmall" href='<spring:url value="/raid/loot/${raid.id}/${e.player.id}"/>'>+</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:forEach>
	
	<c:if test="${user.admin}">
		<spring:url value="/raid/add" var="url"/>
		<form:form method="POST" class="pure-form-aligned" modelAttribute="raid" action="${url}">
			<fieldset>
				<legend>Creer un Raid</legend>
				<div class="pure-control-group">
					<label for="name">Nom</label>
					<input type="text" name="name" required="required">
				</div>
				<div class="pure-control-group">
					<label for="instance">Instance</label>
					<select name="instance">
						<c:forEach items="${instances}" var="c">
							<option value="${c}">${c}</option>
						</c:forEach>
					</select>
				</div>
				<div class="pure-control-group">
					<label for="date">Date</label>
					<input type="date" name="date" required="required" >
				</div>
				<div class="pure-controls">
					<button type="submit" class="pure-button pure-button-primary">Ajouter un raid</button>
				</div>
			</fieldset>
		</form:form>
	</c:if>
	</jsp:attribute>
	<jsp:attribute name="script">
		<script src="<spring:url value="/js/copy.js"/>"></script>
	</jsp:attribute>
</t:template>