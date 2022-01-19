<%@ page pageEncoding="UTF-8"%>
<%@ page import="epgp.db.dbo.LootAttribution" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>
<t:template>
	<jsp:attribute name="content">
		<t:player-filter/>
		<t:player-table-stats/>
	</jsp:attribute>
</t:template>