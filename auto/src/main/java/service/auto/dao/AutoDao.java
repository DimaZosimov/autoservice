package service.auto.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import service.auto.domain.Auto;
import service.auto.domain.Engine;
import service.auto.domain.Person;

@Repository
public interface AutoDao extends JpaRepository <Auto, Long>{
	
	@Query("SELECT a FROM Auto a WHERE a.person = :person")
	List<Auto> findAllCars(@Param("person") Person person);
	
	@Modifying
	@Query("UPDATE Auto SET brand = :brand, model = :model, yearOfManufacture = "
			+ ":yearOfManufacture, engine = :engine, mileage = :mileage "
			+ "WHERE autoId = :autoId")
	int updateAuto(@Param("brand") String brand,
				   @Param("model") String model,
				   @Param("engine")Engine engine,
				   @Param("yearOfManufacture") String yearOfManufacture,
				   @Param("mileage") Long mileage,
				   @Param("autoId") Long autoId);

	@Query("SELECT a FROM Auto a WHERE a.person.personId = :personId")
	List<Auto> findByPersonId(@Param("personId") Long personId);
	
	
}
