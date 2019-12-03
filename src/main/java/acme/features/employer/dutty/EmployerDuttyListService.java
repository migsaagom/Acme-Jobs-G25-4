package acme.features.employer.dutty;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.dutties.Dutty;
import acme.entities.roles.Employer;
import acme.features.employer.job.EmployerJobRepository;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Principal;
import acme.framework.services.AbstractListService;

@Service
public class EmployerDuttyListService implements AbstractListService<Employer, Dutty> {

	@Autowired
	EmployerDuttyRepository repository;
	
	@Autowired
	EmployerJobRepository repo;

	@Override
	public boolean authorise(Request<Dutty> request) {
		assert request != null;

		return true;
	}

	@Override
	public void unbind(Request<acme.entities.dutties.Dutty> request, Dutty entity, Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "title", "description");
	}

	@Override
	public Collection<Dutty> findMany(Request<Dutty> request) {
		assert request != null;

		Collection<Dutty> result;

		Principal principal;
		principal = request.getPrincipal();
	

		result = this.repository.findManyDutty(principal.getActiveRoleId());

		return result;
		
//		assert request != null;
//
//		Collection<Dutty> result;
//		
//		Principal principal;
//		principal = request.getPrincipal();
//
//		int jobid= this.repo.findOneById(principal.getActiveRoleId()).getId();
//
//		result = this.repository.findManyDutty(jobid);
//
//		return result;
	
	}
}
