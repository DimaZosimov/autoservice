package service.auto.view;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import javax.validation.constraints.Pattern;

public class RegistrationRequest {
	
	private final static String USERNAME = "\\w+";
	private final static String NAME = "[A-Za-zА-Яа-я]+";
	private final static String MIDDLE_NAME = "[A-Za-zА-Яа-я]*";
	
	@Size(min = 5, max = 30, message = "{size.registrationRequest.username}")
	@NotBlank(message = "{notBlank.registrationRequest}")
	@Pattern(regexp = USERNAME, message = "{pattern.registrationRequest.username}")
	private String username;
	@Size(min = 5, max = 30, message = "{size.registrationRequest.password}")
	@NotBlank(message = "{notBlank.registrationRequest}")
	private String password;
	@Size(min = 5, max = 30, message = "{size.registrationRequest.password}")
	@NotBlank(message = "{notBlank.registrationRequest}")
	private String passwordConfirm;
	@NotBlank(message = "{notBlank.registrationRequest}")
	@Pattern(regexp = NAME, message = "{pattern.registrationRequest.name}")
	private String firstName;
	@Pattern(regexp = MIDDLE_NAME, message = "{pattern.registrationRequest.name}")
	private String middleName;
	@NotBlank(message = "{notBlank.registrationRequest}")
	@Pattern(regexp = NAME, message = "{pattern.registrationRequest.name}")
	private String lastName;
	@NotBlank(message = "{notBlank.registrationRequest}")
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
