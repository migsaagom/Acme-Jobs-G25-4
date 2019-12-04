<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:form readonly="true">
	<acme:form-textbox code="auditor.job.form.label.referenceNumber" path="referenceNumber" />
	<acme:form-checkbox code="auditor.job.form.label.finalMode" path="finalMode" />
	<acme:form-textbox code="auditor.job.form.label.title" path="title" />
	<acme:form-textbox code="auditor.job.form.label.deadline" path="deadline" />
	<acme:form-money code="auditor.job.form.label.salary" path="salary" />
	<acme:form-textarea code="auditor.job.form.label.description" path="description" />
	<acme:form-url code="auditor.job.form.label.moreInfo" path="moreInfo" />
	
	<acme:form-hidden path="id" />
	
	<acme:menu-suboption code="auditor.job.form.label.auditRecord" action="/auditor/audit-record/list?id=${id}"/>
</acme:form>