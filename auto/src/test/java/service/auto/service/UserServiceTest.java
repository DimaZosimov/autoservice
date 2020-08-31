package service.auto.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import service.auto.domain.Person;
import service.auto.domain.Role;
import service.auto.domain.User;
import service.auto.view.PersonModel;
import service.auto.view.ProfileRequest;
import service.auto.view.RegistrationRequest;
import service.auto.view.RequestPassword;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = {"classpath:springContext.xml", "classpath:spring-security.xml"})
public class UserServiceTest {

	private final static Logger LOGGER = LoggerFactory.getLogger(UserServiceTest.class);
	
	@Autowired
	private UserService userService;
	@Autowired
	private AutoService autoService;
	
	@Test
	public void save() {
		LOGGER.info("START!!!!!!!!!!!!!!!");
		
	}
}
