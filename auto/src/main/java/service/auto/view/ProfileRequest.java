package service.auto.view;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class ProfileRequest {
	
	@Size(min = 5, max = 30)
	private String username;
	@NotBlank
	private String firstName;
	@NotBlank
	private String middleName;
	@NotBlank
	private String lastName;
	private String dateOfBirth;
	
	public ProfileRequest(String username, String firstName, String middleName, String lastName, String dateOfBirth) {
		this.username = username;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
	}
	
	public ProfileRequest() {
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

}
