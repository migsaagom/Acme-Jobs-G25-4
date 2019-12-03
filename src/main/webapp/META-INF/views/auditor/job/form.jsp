<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:form readonly="true">
	<acme:form-textbox code="employer.job.form.label.referenceNumber" path="referenceNumber" />
	<acme:form-checkbox code="employer.job.form.label.finalMode" path="finalMode" />
	<acme:form-textbox code="employer.job.form.label.title" path="title" />
	<acme:form-textbox code="employer.job.form.label.deadline" path="deadline" />
	<acme:form-money code="employer.job.form.label.salary" path="salary" />
	<acme:form-textarea code="employer.job.form.label.description" path="description" />
	<acme:form-url code="employer.job.form.label.moreInfo" path="moreInfo" />
</acme:form>