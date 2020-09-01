package service.auto.view;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class RequestPassword {
	
	@Size(min = 5, max = 30, message = "{size.requestPassword}")
	@NotBlank(message = "{notBlank.requestPassword}")
	private String password;
	@Size(min = 5, max = 30, message = "{size.requestPassword}")
	@NotBlank(message = "{notBlank.requestPassword}")
	private String newPassword;
	@Size(min = 5, max = 30, message = "{size.requestPassword}")
	@NotBlank(message = "{notBlank.requestPassword}")
	private String newPasswordConfirm;
		
	public RequestPassword() {

	}
	
	public RequestPassword(String password, String newPassword, String newPasswordConfirm) {
		this.password = password;
		this.newPassword = newPassword;
		this.newPasswordConfirm = newPasswordConfirm;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getNewPasswordConfirm() {
		return newPasswordConfirm;
	}
	public void setNewPasswordConfirm(String newPasswordConfirm) {
		this.newPasswordConfirm = newPasswordConfirm;
	}

}
