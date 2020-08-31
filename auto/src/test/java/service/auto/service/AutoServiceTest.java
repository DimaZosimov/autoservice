package service.auto.service;

import java.util.List;
import java.util.Optional;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import service.auto.dao.AutoDao;
import service.auto.dao.PersonDao;
import service.auto.dao.UserDao;
import service.auto.domain.Auto;
import service.auto.domain.Person;
import service.auto.domain.User;
import service.auto.view.AutoRequest;
import service.auto.view.AutoResponse;


@RunWith(SpringRunner.class)
@ContextConfiguration(locations = {"classpath:springContext.xml", "classpath:spring-security.xml"})
public class AutoServiceTest {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(AutoServiceTest.class);
	
	@Autowired
	private AutoService autoService;
	@Autowired
	private UserDao userDao;
	@Autowired
	private AutoDao autoDao;
	@Autowired
	private PersonDao personDao;
	
	@Test
	public void test() {
		
	}
	
	@Test
	public void insertAndDeleteAutoTest() {
		
	}

}
