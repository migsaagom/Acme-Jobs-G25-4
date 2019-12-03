<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:form>
	<acme:form-textbox code="employer.dutty.form.label.title" path="title" />
	<acme:form-textbox code="employer.dutty.form.label.description" path="description" />
	<acme:form-textbox code="employer.dutty.form.label.percentage" path="percentage" />

</acme:form>