<%--
- menu.jsp
-
- Copyright (c) 2019 Rafael Corchuelo.
-
- In keeping with the traditional purpose of furthering education and research, it is
- the policy of the copyright owner to permit non-commercial use and redistribution of
- this software. It has been tested carefully, but it is not guaranteed for any particular
- purposes.  The copyright owner does not offer any warranties or representations, nor do
- they accept any liabilities with respect to them.
--%>

<%@page language="java" import="acme.framework.helpers.PrincipalHelper,acme.entities.roles.Provider,acme.entities.roles.Consumer"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:menu-bar code="master.menu.home">
	<acme:menu-left>
		<acme:menu-option code="master.menu.anonymous" access="isAnonymous()">
			<acme:menu-suboption code="master.menu.anonymous.investor" action="/anonymous/investor/list" />
			<acme:menu-suboption code="master.menu.anonymous.announcements" action="/anonymous/announcement/list" />
			<acme:menu-suboption code="master.menu.anonymous.company-record" action="/anonymous/company-record/list" />
		</acme:menu-option>

		<acme:menu-option code="master.menu.anonymous.links" access="isAnonymous()">
			<acme:menu-suboption code="master.menu.anonymous.favourite-link-alba" action="https://www.informatica.us.es/" />
			<acme:menu-suboption code="master.menu.anonymous.favourite-link-alex" action="https://ev.us.es/" />
			<acme:menu-suboption code="master.menu.anonymous.favourite-link-santi" action="https://sevius.us.es/" />
			<acme:menu-suboption code="master.menu.anonymous.favourite-link-miguel" action="https://buzonweb.us.es/" />
		</acme:menu-option>

		<acme:menu-option code="master.menu.anonymous.bulletins" access="isAnonymous()">
			<acme:menu-suboption code="master.menu.anonymous.shouts" action="/anonymous/shout/list" />
			<acme:menu-suboption code="master.menu.anonymous.curriculums" action="/anonymous/curriculum/list" />
		</acme:menu-option>


		<acme:menu-option code="master.menu.administrator" access="hasRole('Administrator')">
			<acme:menu-suboption code="master.menu.administrator.user-accounts" action="/administrator/user-account/list" />
			<acme:menu-separator />
			<acme:menu-suboption code="master.menu.administrator.shutdown" action="/master/shutdown" />
			<acme:menu-separator />
			<acme:menu-suboption code="master.menu.administrator.customisations" action="/administrator/customisation/update" />
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.worker.application" access="hasRole('Worker')">
			<acme:menu-suboption code="master.menu.worker.application.list" action="/worker/application/list" />
			<acme:menu-separator />
		</acme:menu-option>

		<acme:menu-option code="master.menu.requests" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.authenticated.request" action="/authenticated/request/list" />
			<acme:menu-suboption access="hasRole('Provider')" code="master.menu.provider.request.create" action="/authenticated/request/create" />
		</acme:menu-option>

		<acme:menu-option code="master.menu.offers" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.authenticated.offer" action="/authenticated/offer/list" />
			<acme:menu-suboption access="hasRole('Consumer')" code="master.menu.consumer.offer.create" action="/authenticated/offer/create" />
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.anonymous.announcements" access="isAuthenticated()">
			<acme:menu-suboption access="!hasRole('Administrator')" code="master.menu.anonymous.announcements" action="/authenticated/announcement/list" />
			<acme:menu-suboption access="hasRole('Administrator')" code="master.menu.user-account.announcement" action="/administrator/announcement/list" />
			<acme:menu-suboption access="hasRole('Administrator')" code="master.menu.administrator.announcement.create" action="/administrator/announcement/create" />
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.authenticated.challenge" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.authenticated.challenge" action="/authenticated/challenge/list" />
			<acme:menu-suboption access="hasRole('Administrator')" code="master.menu.administrator.challenge.create" action="/administrator/challenge/create" />
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.authenticated.investor" access="isAuthenticated()">
			<acme:menu-suboption access="!hasRole('Administrator')" code="master.menu.anonymous.investor" action="/authenticated/investor/list" />
			<acme:menu-suboption access="hasRole('Administrator')" code="master.menu.anonymous.investor" action="/administrator/investor/list" />
			<acme:menu-suboption access="hasRole('Administrator')" code="master.menu.administrator.investor.create" action="/administrator/investor/create" />
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.anonymous.company-record" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.anonymous.company-record" action="/authenticated/company-record/list" />
			<acme:menu-suboption access="hasRole('Administrator')" code="master.menu.administrator.company-record.create" action="/administrator/company-record/create" />
		</acme:menu-option>
		
	</acme:menu-left>

	<acme:menu-right>
		<acme:menu-option code="master.menu.sign-up" action="/anonymous/user-account/create" access="isAnonymous()" />
		<acme:menu-option code="master.menu.sign-in" action="/master/sign-in" access="isAnonymous()" />

		<acme:menu-option code="master.menu.user-account" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.user-account.general-data" action="/authenticated/user-account/update" />
			<acme:menu-suboption code="master.menu.user-account.become-provider" action="/authenticated/provider/create"
				access="!hasRole('Provider')" />
			<acme:menu-suboption code="master.menu.user-account.provider" action="/authenticated/provider/update"
				access="hasRole('Provider')" />
			<acme:menu-suboption code="master.menu.user-account.become-consumer" action="/authenticated/consumer/create"
				access="!hasRole('Consumer')" />
			<acme:menu-suboption code="master.menu.user-account.consumer" action="/authenticated/consumer/update"
				access="hasRole('Consumer')" />
		</acme:menu-option>


		<acme:menu-option code="master.menu.sign-out" action="/master/sign-out" access="isAuthenticated()" />
	</acme:menu-right>
</acme:menu-bar>