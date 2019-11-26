package acme.features.employer.job;

import java.util.Calendar;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.jobs.Job;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Authenticated;
import acme.framework.services.AbstractListService;

@Service
public class AuthenticatedJobListService implements AbstractListService<Authenticated, Job> {

	// -----------------Internal state-------------------------------

	@Autowired
	AuthenticatedJobRepository repository;

	@Override
	public boolean authorise(Request<Job> request) {
		// TODO Auto-generated method stub
		assert request != null;

		return true;
	}

	@Override
	public void unbind(Request<Job> request, Job entity, Model model) {
		// TODO Auto-generated method stub
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "title", "referenceNumber");
	}

	@Override
	public Collection<Job> findMany(Request<Job> request) {
		// TODO Auto-generated method stub
		assert request != null;

		Collection<Job> result;
		Job res;
		Integer id;
		id = request.getModel().getInteger("id");
		res = this.repository.findOneById(id);

		id = request.getModel().getInteger("id");
		Calendar calen = Calendar.getInstance();
		result = this.repository.findManyAll(calen.getTime());

		if (res.getDeadline().after(calen.getTime())) {
			result.add(res);
		}

		return result;
	}

}
