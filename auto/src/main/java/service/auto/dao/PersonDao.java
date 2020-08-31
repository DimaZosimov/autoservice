package service.auto.dao;

import java.time.LocalDate;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import service.auto.domain.Person;

@Repository
public interface PersonDao extends JpaRepository<Person, Long>{
	
	@Modifying
	@Query(name = "update person",
			value = "UPDATE Person SET firstName = :reqFirstName, middleName = :reqMiddleName, lastName = :reqLastName, "
					+ "dateOfBirth = :reqDateOfBirth WHERE personId = :personId")
	int updatePerson(@Param("reqFirstName") String reqFirstName,
					 @Param("reqMiddleName") String reqMiddleName,
					 @Param("reqLastName") String reqLastName,
					 @Param("reqDateOfBirth") LocalDate dateOfBirth,
					 @Param("personId") Long personId );
		
}
