
<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:list>
<acme:list-column code="auditor.auditRecord.list.label.worker" path="auditor.authorityName" width="30%" />
	<acme:list-column code="auditor.auditRecord.list.label.job" path="job.title" width="30%" />
	<acme:list-column code="auditor.auditRecord.list.label.moment" path="moment" width="20%" />
	<acme:list-column code="auditor.auditRecord.list.label.status" path="status" width="20%" />

</acme:list>