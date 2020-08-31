package service.auto.view;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class RegistrationRequest {
	
	@Size(min = 5, max = 30)
	private String username;
	@Size(min = 5, max = 30)
	private String password;
	@Size(min = 5, max = 30)
	private String passwordConfirm;
	@NotBlank
	private String firstName;
	private String middleName;
	@NotBlank
	private String lastName;
	private  String dateOfBirth;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordConfirm() {
		return passwordConfirm;
	}
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
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
