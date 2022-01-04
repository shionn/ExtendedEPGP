<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>
<t:template>
	<jsp:attribute name="content">

	<spring:url value="/admin/create-player" var="url" />
	<form:form method="POST" class="pure-form-aligned" action="${url}">
		<fieldset>
			<legend>Creation joueur</legend>
			<div class="pure-control-group">
				<label for="pseudo">Pseudo</label>
				<input name="pseudo" type="text" placeholder="pseudo"
						required="required">
			</div>
			<div class="pure-control-group">
				<label for="class">Class</label>
				<select name="class">
					<c:forEach items="${playerclasses}" var="c">
						<option value="${c}">${c}</option>
					</c:forEach>
				</select>
			</div>
			<div class="pure-controls">
				<button type="submit" class="pure-button pure-button-primary">Valider</button>
			</div>
		</fieldset>
	</form:form>

	<spring:url value="/admin/edit-player" var="url" />
	<form:form method="POST" class="pure-form-stacked" action="${url}">
		<fieldset>
			<legend>Edition joueur</legend>
			<div class="pure-g" style="width:1000px">
				<div class="pure-u-1-3">
					<label for="id">Joueur à éditer</label>
					<select name="id">
						<c:forEach items="${players}" var="c">
							<option value="${c.id}">${c.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="pure-u-1-3" style="display: flex;flex-direction: column-reverse;">
					<button type="submit" class="pure-button pure-button-primary">Commencer l'édition</button>
				</div>
			</div>
		</fieldset>
	</form:form>

	<spring:url value="/admin/create-item" var="url" />
	<form:form method="POST" class="pure-form-aligned" action="${url}">
		<fieldset>
			<legend>Creation objet</legend>
			<div class="pure-control-group">
				<label for="id">Id</label>
				<input name="id" type="text" placeholder="id" required="required">
			</div>
			<div class="pure-controls">
				<button type="submit" class="pure-button pure-button-primary">Valider</button>
			</div>
		</fieldset>
	</form:form>

	<spring:url value="/admin/edit-item" var="url" />
	<form:form method="POST" class="pure-form-stacked" action="${url}">
		<fieldset>
			<legend>Edition objet</legend>
			<div class="pure-g" style="width:1000px">
				<div class="pure-u-2-3">
					<label for="id">Object à éditer</label>
					<select name="id">
						<c:forEach items="${items}" var="c">
							<option value="${c.id}">${c.name} (${c.raid} ${c.slot.fr} ${c.ilvl}-${c.ptRatio}-${c.pt})</option>
						</c:forEach>
					</select>
				</div>
				<div class="pure-u-1-3" style="display: flex;flex-direction: column-reverse;">
					<button type="submit" class="pure-button pure-button-primary">Commencer l'édition</button>
				</div>
			</div>
		</fieldset>
	</form:form>

</jsp:attribute>
<jsp:attribute name="script">
</jsp:attribute>
</t:template>