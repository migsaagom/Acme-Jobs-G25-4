package acme.features.employer.dutty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.dutties.Dutty;
import acme.entities.roles.Employer;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.services.AbstractShowService;

@Service
public class EmployerDuttyShowService implements AbstractShowService<Employer, Dutty> {

	@Autowired
	EmployerDuttyRepository repository;

	@Override
	public boolean authorise(Request<Dutty> request) {
		assert request != null;
		return true;
	}

	@Override
	public void unbind(Request<Dutty> request, Dutty entity, Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "title", "description","percentage","job.title");

	}

	@Override
	public Dutty findOne(Request<Dutty> request) {
		assert request != null;
		Dutty result;
		int id;
		
		id = request.getModel().getInteger("id");
		result = this.repository.findOneById(id);
		

		return result;
	}

}
