<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<form>
	<fieldset>
		<legend>Filtre Joueur</legend>
		<a href="<spring:url value="/toggle-inraid"/>" style="color: ${formFilter.inRaidLinkColor}">En Raid</a> <br>
		<c:forEach items="${formFilter.allClasses}" var="cl">
			<a href="<spring:url value="/toggle-class/${cl}"/>" style="color: ${formFilter.getLinkColor(cl)}">
				<img class="class" src='<spring:url value="/img/${cl}.jpg"/>'/>
				${cl}
			</a>
		</c:forEach> <br>
		<c:if test="${formFilter.displayPlayerFilter}">
			<c:forEach items="${formFilter.allPlayers}" var="p">
				<c:if test="${formFilter.classes.contains(p.clazz)}">
					<a href="<spring:url value="/toggle-player/${p.id}"/>" style="color: ${formFilter.getLinkColor(p.id)}">
						${p.name}
					</a>
				</c:if>
			</c:forEach>
		</c:if>
	</fieldset>
</form>
