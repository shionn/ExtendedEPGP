<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="item" type="epgp.db.dbo.Item"%>
<%@ attribute name="attribution" type="epgp.db.dbo.LootAttribution"%>
<c:choose>
	<c:when test="${attribution == 'secondary'}">
		<a href="https://fr.classic.wowhead.com/item=${item.id}" 
			data-wowhead="item=${item.id}&domain=fr.classic" 
			target="_blank" style="opacity: 30%"></a>
	</c:when>
	<c:when test="${attribution == 'primary'}">
		<a href="https://fr.classic.wowhead.com/item=${item.id}" 
			data-wowhead="item=${item.id}&domain=fr.classic" 
			target="_blank" 
			style="opacity: 70%"></a>
	</c:when>
	<c:otherwise>
		<a href="https://fr.classic.wowhead.com/item=${item.id}" 
			data-wowhead="item=${item.id}&domain=fr.classic" 
			target="_blank"></a>
	</c:otherwise>
</c:choose>
