package service.auto.rest;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import service.auto.service.UserService;
import service.auto.view.ProfileRequest;
import service.auto.view.ProfileResponse;
import service.auto.view.RegistrationRequest;
import service.auto.view.RequestPassword;

@Controller
public class UserController {
		
	@Autowired
	private UserService userService;
	
	@GetMapping("/registration")
	public String registration(Model model) {
		RegistrationRequest request = new RegistrationRequest();
		model.addAttribute("registrationRequest", request);
		return "registration";
	}
	
	@PostMapping("/registration")
	public String addUser(@Valid @ModelAttribute("registrationRequest") RegistrationRequest request, BindingResult bindingResult,
			Model model) {
		if(bindingResult.hasErrors()) {
			return "registration";
		}
		if(!request.getPassword().equals(request.getPasswordConfirm())) {
			model.addAttribute("passwordError", "Пароли не совпадают");
			return "registration";
		}
		if(!userService.saveUser(request)) {
			model.addAttribute("usernameError", "Пользователь с таким именем существует");
			return "registration";
		}
		return "redirect:/";
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		return "login";
	}
		
	@GetMapping("/profile")
	public String getProfile(Model model) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		ProfileResponse response = userService.getProfile(username);
		model.addAttribute("response", response);
		return "profile";
	}
	
	@GetMapping("/profile/edit")
	public String editProfile(Model model) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		ProfileResponse response = userService.getProfile(username);
		model.addAttribute("response", response);
		model.addAttribute("profileRequest", new ProfileRequest());
		return "editProfile";
	}
	
	@PostMapping("/profile/edit")
	public String editProfile(Model model, @Valid @ModelAttribute("profileRequest") ProfileRequest request, 
			BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "editProfile";
		}
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		String result = userService.updateUser(request, username);
		if(result.equals("true")) {
			model.addAttribute("successMessage", "Данные сохранены");
			model.addAttribute("response", request);
		} else {
			model.addAttribute("response", userService.getProfile(username));
			model.addAttribute("errorMessage", "Ошибка изменения");
			if(result.equals("usernameError")) {
				model.addAttribute("warningMessage", "Пользователь с таким именем существует");
				return "editProfile";
			}
		}
		return "profile";
	}
	
	@GetMapping("/profile/password")
	public String editPassword(Model model) {
		model.addAttribute("requestPassword", new RequestPassword());
		return "editPassword";
	}
	
	@PostMapping("/profile/password")
	public String savePassword(@Valid @ModelAttribute("requestPassword") RequestPassword request, 
			BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			return "editPassword";
		}
		if(!request.getNewPassword().equals(request.getNewPasswordConfirm())) {
			model.addAttribute("errorPassword", "Пароли не совпадают");
			return "editPassword";
		}
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		if(userService.updatePassword(request, username)) {
			model.addAttribute("successMessage", "Пароль изменен");
			ProfileResponse response = userService.getProfile(username);
			model.addAttribute("response", response);
			return "profile";
		}
		model.addAttribute("errorMessage", "Пароль введен неверно");
		return "editPassword";
	}
	
	@PostMapping("/delete")
	public String deleteUser(Model model) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		userService.deleteUser(username);
		model.addAttribute("successMessage", "Пользователь удален");
		
		return "result";
	}

}
