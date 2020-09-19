package service.auto.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Collections;

import org.hibernate.Hibernate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import service.auto.dao.PersonDao;
import service.auto.dao.UserDao;
import service.auto.domain.Person;
import service.auto.domain.Role;
import service.auto.domain.User;
import service.auto.view.PersonModel;
import service.auto.view.ProfileRequest;
import service.auto.view.ProfileResponse;
import service.auto.view.RegistrationRequest;
import service.auto.view.RequestPassword;

@Service
public class UserService implements UserDetailsService{
	
	private final static Logger LOGGER = LoggerFactory.getLogger(UserService.class);

	@Autowired
	private UserDao userDao;
	@Autowired 
	private PersonDao personDao;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Transactional
	@Override
	public User loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userDao.findByUsername(username);
		if(user == null) {
			throw new UsernameNotFoundException("User not found");
		}
		return user;
	}
	
	public ProfileResponse getProfile(String username) {
		User user = loadUserByUsername(username);
		return getProfileResponse(user);
	}
	
	private ProfileResponse getProfileResponse(User user) {
		ProfileResponse response = new ProfileResponse();
		response.setUsername(user.getUsername());
		response.setFirstName(user.getPerson().getFirstName());
		response.setMiddleName(user.getPerson().getMiddleName());
		response.setLastName(user.getPerson().getLastName());
		String dateOfBirth = user.getPerson().getDateOfBirth().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		response.setDateOfBirth(dateOfBirth);
		return response;
	}
	
	@Transactional
	public boolean saveUser(RegistrationRequest request) {
		User userFromDB = userDao.findByUsername(request.getUsername());
		if(userFromDB != null) {
			return false;
		}
		User user = getUserFromRegistrationRequest(request);
		userDao.save(user);
		personDao.save(user.getPerson());
		return true;
	}
	
	private User getUserFromRegistrationRequest(RegistrationRequest request) {
		User user = new User();
		Person person = new Person();
		try {			
			person.setUser(user);
			person.setFirstName(request.getFirstName());
			person.setMiddleName(request.getMiddleName());
			person.setLastName(request.getLastName());
			LocalDate dateOfBirth = LocalDate.parse(request.getDateOfBirth(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			person.setDateOfBirth(dateOfBirth);
			user.setPerson(person);
			user.setUsername(request.getUsername());
			user.setPassword(bCryptPasswordEncoder.encode(request.getPassword()));
			user.setRoles(Collections.singleton(new Role(1L, "ROLE_USER")));
		} catch (DateTimeParseException e) {
			LOGGER.error("DateTimeFormatterException " + e.getMessage());
		} catch (Exception e) {
			LOGGER.error("Exception error /n" + e.getMessage());
		}
		return user;
	}
	
	@Transactional
	public String updateUser(ProfileRequest request, String username) {
		User user = userDao.findByUsername(request.getUsername());
		if(!username.equals(request.getUsername()) && user != null) {
			return "usernameError";
		} else if(user == null) {
			user = userDao.findByUsername(username);
		}
		return update(request, user);
	}
	
	private String update(ProfileRequest request, User user) {
		int resultUser = 0;
		if(!request.getUsername().equals(user.getUsername())) {
			resultUser = userDao.updateUsername(user.getUserId(), request.getUsername());
		} else {
			resultUser = 1;
		}
		Person person = user.getPerson();
		LocalDate dateOfBirth = null;
		try { 
			dateOfBirth = LocalDate.parse(request.getDateOfBirth(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		} catch (DateTimeParseException e) {
			LOGGER.error("DateTimeFormatterException " + e.getMessage());
		} catch (Exception e) {
			LOGGER.error("Exception error /n" + e.getMessage());
		}
		int resultPerson = personDao.updatePerson(request.getFirstName(), request.getMiddleName(), request.getLastName(), dateOfBirth, person.getPersonId());
		if(resultUser + resultPerson >= 2) {
			return "true";
		}else {
			return "false";
		}
		
	}
	
	@Transactional
	public boolean deleteUser(Long userId) {
		if(userDao.findById(userId).isPresent()) {
			userDao.deleteById(userId);
			return true;
		}
		return false;
	}
	
	@Transactional
	public boolean deleteUser(String username) {
		User user = userDao.findByUsername(username);
		userDao.delete(user);
		return true;
	}
	
	@Transactional
	public boolean updatePassword(RequestPassword request, String username) {
		User user = userDao.findByUsername(username);
		if(!bCryptPasswordEncoder.matches(request.getPassword(), user.getPassword())) {
			return false;
		}
		if(userDao.updatePassword(bCryptPasswordEncoder.encode(request.getNewPassword()), user.getUserId()) == 1) {
			return true;
		}
		return false;
	}
	
	@Transactional(readOnly = true)
	public PersonModel getPersonModel(String username) {
		User user = userDao.findByUsername(username);
		Person person = user.getPerson();
		Hibernate.initialize(person.getAuto());
		return new PersonModel(username, person.getPersonId(), person.getAuto());
	}
				
}
