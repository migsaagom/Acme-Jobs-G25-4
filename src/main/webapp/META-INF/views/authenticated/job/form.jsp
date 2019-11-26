<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:form>
	<acme:form-textbox code="authenticated.job.form.label.referenceNumber" path="referenceNumber" />
	<acme:form-checkbox code="authenticated.job.form.label.status" path="status" />
	<acme:form-textarea code="authenticated.job.form.label.title" path="title" />
	<acme:form-textbox code="authenticated.job.form.label.deadline" path="deadline" />
	<acme:form-money code="authenticated.job.form.label.salary" path="salary" />
	<acme:form-textbox code="authenticated.job.form.label.descriptor" path="descriptor" />
	<acme:form-textbox code="authenticated.job.form.label.link" path="link" />


	<jstl:if test="${command != 'create'}">
		<acme:form-moment code="authenticated.job.form.label.moment" path="moment" readonly="true" />
	</jstl:if>

	<acme:form-moment code="authenticated.job.form.label.deadline" path="deadline" />

	<jstl:if test="${command == 'create'}">
		<acme:form-checkbox code="anonymous.user-account.label.accept" path="accept" />
	</jstl:if>

	<acme:form-submit test="${command=='create'}" code="authenticated.job.form.button.create" action="/authenticated/job/create" />

	<acme:form-return code="authenticated.job.form.button.return" />

</acme:form>