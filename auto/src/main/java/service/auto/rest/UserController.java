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
	public String addUser(@ModelAttribute("registrationRequest") @Valid RegistrationRequest request, BindingResult bindingResult,
			Model model) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("error", "Registration error");
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
	
	@GetMapping("/")
	public String index(Model model) {
		return "index";
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
		model.addAttribute("edit", false);
		return "profile";
	}
	
	@GetMapping("/profile_edit")
	public String editProfile(Model model) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		model.addAttribute("edit", true);
		model.addAttribute("profileRequest", new ProfileRequest());
		ProfileResponse response = userService.getProfile(username);
		model.addAttribute("response", response);
		return "profile";
	}
	
	@PostMapping("/profile")
	public String saveProfile(Model model, @ModelAttribute("profileRequest") @Valid ProfileRequest request, 
			BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("error", "Profile error");
			model.addAttribute("edit", true);
			return "profile";
		}
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		String result = userService.updateUser(request, username);
		if(result.equals("true")) {
			model.addAttribute("messageOfSaved", "Данные сохранены");
			model.addAttribute("response", request);
			model.addAttribute("edit", false);
		} else {
			model.addAttribute("response", userService.getProfile(username));
			model.addAttribute("error", "Ошибка изменения");
			model.addAttribute("edit", true);
			if(result.equals("usernameError")) {
				model.addAttribute("usernameError", "Пользователь с таким именем существует");
			}
		}
		return "profile";
	}
	
	@GetMapping("/password")
	public String editPassword(Model model) {
		model.addAttribute("requestPassword", new RequestPassword());
		return "password";
	}
	
	@PostMapping("/password")
	public String savePassword(@Valid @ModelAttribute("requestPassword") RequestPassword request, 
			BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			return "password";
		}
		if(!request.getNewPassword().equals(request.getNewPasswordConfirm())) {
			model.addAttribute("passwordError", "Пароли не совпадают");
			return "password";
		}
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		if(userService.updatePassword(request, username)) {
			model.addAttribute("result", "Пароль изменен");
			return "result";
		}
		model.addAttribute("result", "Пароль не сохранен");
		return "result";
	}
	
	@PostMapping("/delete")
	public String deleteUser(Model model) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		userService.deleteUser(username);
		model.addAttribute("result", "Пользователь удален");
		
		return "result";
	}

}
