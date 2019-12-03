
package acme.features.employer.dutty;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.dutties.Dutty;
import acme.entities.roles.Employer;
import acme.features.employer.job.EmployerJobRepository;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.services.AbstractListService;

@Service
public class EmployerDuttyListService implements AbstractListService<Employer, Dutty> {

	@Autowired
	EmployerDuttyRepository	repository;

	@Autowired
	EmployerJobRepository	repo;


	@Override
	public boolean authorise(final Request<Dutty> request) {
		assert request != null;

		return true;
	}

	@Override
	public void unbind(final Request<acme.entities.dutties.Dutty> request, final Dutty entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "title", "description");
	}

	@Override
	public Collection<Dutty> findMany(final Request<Dutty> request) {
		assert request != null;

		Collection<Dutty> result;

		int id = request.getModel().getInteger("id");
		result = this.repository.findManyDutty(id);

		return result;
	}
}
