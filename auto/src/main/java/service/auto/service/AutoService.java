package service.auto.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import service.auto.dao.AutoDao;
import service.auto.dao.PersonDao;
import service.auto.domain.Auto;
import service.auto.domain.Person;
import service.auto.view.AutoRequest;
import service.auto.view.AutoUpdateRequest;
import service.auto.view.MainAutoRequest;
import service.auto.view.PersonModel;

@Service
@Scope(ConfigurableBeanFactory.SCOPE_SINGLETON)
public class AutoService {
	
	static final Logger LOGGER = LoggerFactory.getLogger(AutoService.class);
	
	@Autowired
	private AutoDao autoDao;

	@Autowired
	private PersonDao personDao;
	
	@Transactional
	public boolean updateAuto(AutoUpdateRequest req, PersonModel person) {
		if(autoDao.updateAuto(req.getBrand(), req.getModel(), req.getEngine(), 
				req.getYearOfManufacture(), req.getMileage(), req.getAutoId()) > 0) {
			person.setAuto(autoDao.findByPersonId(person.getPersonId()));
			return true;
		}
		return false;
	}
	
	@Transactional
	public boolean deleteAuto(Long id, PersonModel person) {
		Auto auto = autoDao.getOne(id);
		if(auto.getPerson().getPersonId().equals(person.getPersonId())) {
			autoDao.deleteById(id);
			person.setAuto(autoDao.findByPersonId(person.getPersonId()));
			return !autoDao.existsById(id);
		}
		return false;
	}
	@Transactional
	public boolean insertAuto(AutoRequest request, PersonModel personModel) {
		Auto auto = buildAuto(request);
		if(auto == null) {
			return false;
		}
		Person person = personDao.getOne(personModel.getPersonId());
		auto.setPerson(person);
		Auto savedAuto = autoDao.save(auto);
		if(savedAuto.getAutoId() > 0) {
			personModel.getAuto().add(savedAuto);
			return true;
		}
		return false;
	}

	private Auto buildAuto(AutoRequest request) {
		Auto auto = new Auto();
		auto.setBrand(request.getBrand());
		auto.setModel(request.getModel());
		auto.setEngine(request.getEngine());
		auto.setYearOfManufacture(request.getYearOfManufacture());
		auto.setMileage(request.getMileage());
		return auto;
	}

	public Auto getAutoById(Long autoId, PersonModel person) {
		for(Auto auto : person.getAuto()) {
			if(auto.getAutoId().equals(autoId)) {
				return auto;
			}
		}
		return null;
	}

	public void editMainAuto(Long id, PersonModel person) {
		for(Auto a : person.getAuto()) {
			if(a.getAutoId().equals(id)) {
				a.setMain(true);
			} else {
				a.setMain(false);
			}
		}		
	}

	@Transactional
	public boolean editMileage(Long mileage, PersonModel person) {
		Auto auto = getMainAuto(person);
		if(autoDao.updateMileage(mileage, auto.getAutoId()) > 0) {
			auto.setMileage(mileage);
			return true;
		} 
		return false;
	}
	
	public Auto getMainAuto(PersonModel person) {
		Auto auto = null;
		for(Auto a : person.getAuto()) {
			if(a.isMain()) {
				return a;
			}
		}
		return auto;
	}
	
}
