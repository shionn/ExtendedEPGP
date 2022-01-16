<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>
<t:template>
	<jsp:attribute name="content">
			<form:form method="POST" class="pure-form pure-form-aligned" modelAttribute="raid">
				<fieldset style="width:400px">
					<legend>Participant ${raid.name}</legend>
							<c:forEach items="${raid.entries}" var="p" varStatus="s">
								<div class="pure-g ${p.player.clazz}">
									<input type="hidden" name="entries[${s.index}].player.id" value="${p.player.id}">
									<label class="pure-u-5-8">
										<input type="checkbox" name="entries[${s.index}].member" <c:if test="${p.member}"> checked="checked"</c:if>>
										<img class="class" src='<spring:url value="/img/${p.player.clazz}.jpg"/>'/>
										${p.player.name}
									</label>
									<label class="pure-u-1-8">
										<input type="checkbox" name="entries[${s.index}].bench" <c:if test="${p.bench}"> checked="checked"</c:if>>
										b
									</label>
									<label class="pure-u-1-8">
										<input type="checkbox" name="entries[${s.index}].absent" <c:if test="${p.absent}"> checked="checked"</c:if>>
										a
									</label>
									<label class="pure-u-1-8">
										<input type="checkbox" name="entries[${s.index}].quit" <c:if test="${p.quit}"> checked="checked"</c:if>>
										q
									</label>
								</div>
							</c:forEach>
					<div class="pure-controls">
						<button type="submit" class="pure-button pure-button-primary">Sauvegarder</button>
					</div>
				</fieldset>
			</form:form>
	</jsp:attribute>
</t:template>