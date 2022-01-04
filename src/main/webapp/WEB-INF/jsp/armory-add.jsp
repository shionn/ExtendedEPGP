<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>
<t:template>
<jsp:attribute name="content">
	<spring:url value="/armory/add/${player.id}" var="url"/>
	<form:form method="POST" class="pure-form pure-form-aligned" action="${url}">
		<fieldset>
			<legend>Ajout Armory</legend>
			<div class="pure-control-group">
				<label for="item-id">Select item</label>
				<select name="item-id">
					<c:forEach items="${items}" var="i">
						<option value="${i.id}">${i.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="pure-control-group">
				<label for="new-item-id">Or create item</label>
				<input name="new-item-id" type="text" placeholder="id">
			</div>
			<div class="pure-controls">
				<button type="submit" class="pure-button pure-button-primary">Ajouter</button>
			</div>
		</fieldset>
	</form:form>
</jsp:attribute>
</t:template>