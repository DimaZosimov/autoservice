package service.auto.view;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class ProfileRequest {
	
	private final static String USERNAME = "\\w+";
	private final static String NAME = "[A-Za-zА-Яа-я]+";
	private final static String MIDDLE_NAME = "[A-Za-zА-Яа-я]*";
	
	@Size(min = 5, max = 30, message = "{size.profileRequest.username}")
	@NotBlank(message = "{notBlank.profileRequest}")
	@Pattern(regexp = USERNAME, message = "{pattern.profileRequest.username}")
	private String username;
	@NotBlank(message = "{notBlank.profileRequest}")
	@Pattern(regexp = NAME, message = "{pattern.profileRequest.name}")
	private String firstName;
	@Pattern(regexp = MIDDLE_NAME, message = "{pattern.profileRequest.name}")
	private String middleName;
	@NotBlank(message = "{notBlank.profileRequest}")
	@Pattern(regexp = NAME, message = "{pattern.profileRequest.name}")
	private String lastName;
	@NotBlank(message = "{notBlank.profileRequest}")
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
