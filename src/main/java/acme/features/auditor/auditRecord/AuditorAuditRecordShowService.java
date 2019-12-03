
package acme.features.auditor.auditRecord;

import org.springframework.beans.factory.annotation.Autowired;

import acme.entities.auditRecords.AuditRecord;
import acme.entities.roles.Auditor;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Principal;
import acme.framework.services.AbstractShowService;

public class AuditorAuditRecordShowService implements AbstractShowService<Auditor, AuditRecord> {

	@Autowired
	AuditorAuditRecordRepository repository;


	@Override
	public boolean authorise(final Request<AuditRecord> request) {
		assert request != null;
		boolean result;

		AuditRecord ap;
		int appId;
		Auditor employer;
		Principal principal;

		appId = request.getModel().getInteger("id");
		ap = this.repository.findOneById(appId);

		employer = ap.getJob().getAuditor();
		principal = request.getPrincipal();
		result = employer.getUserAccount().getId() == principal.getAccountId();

		return result;
	}

	@Override
	public void unbind(final Request<AuditRecord> request, final AuditRecord entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "reference", "moment", "status", "statement", "skills", "qualifications", "worker.authorityName", "job.title");
	}

	@Override
	public AuditRecord findOne(final Request<AuditRecord> request) {
		assert request != null;

		AuditRecord result;
		int id;

		id = request.getModel().getInteger("id");
		result = this.repository.findOneById(id);

		//		if (result.getWorker() != null) {
		//			result.setStatus(result.getStatus() + "- by " + result.getWorker().getAuthorityName());
		//		}

		return result;
	}

}
