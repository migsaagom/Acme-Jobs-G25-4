package acme.features.employer.dutty;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.entities.dutties.Dutty;
import acme.framework.repositories.AbstractRepository;

@Repository
public interface EmployerDuttyRepository extends AbstractRepository {
	@Query("select d from Dutty d where d.id = ?1")
	Dutty findOneById(int id);
	
	//@Query("select d from Dutty d")
	 @Query("select d from Dutty d where d.job.id = ?1")
	Collection<Dutty> findManyDutty(int id);
}
