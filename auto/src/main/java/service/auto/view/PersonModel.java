package service.auto.view;

import java.util.List;

import service.auto.domain.Auto;

public class PersonModel {
	
	private String username;
	private Long personId;
	private List<Auto> auto;
		
	public PersonModel() {
		
	}
	
	public PersonModel(String username, Long personId, List<Auto> auto) {
		this.username = username;
		this.personId = personId;
		this.auto = auto;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Long getPersonId() {
		return personId;
	}
	public void setPersonId(Long personId) {
		this.personId = personId;
	}

	public List<Auto> getAuto() {
		return auto;
	}

	public void setAuto(List<Auto> auto) {
		this.auto = auto;
	}
	
}
