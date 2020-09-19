package service.auto.rest;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import service.auto.domain.Auto;
import service.auto.service.AutoService;
import service.auto.service.UserService;
import service.auto.view.AutoRequest;
import service.auto.view.AutoUpdateRequest;
import service.auto.view.MainAutoRequest;
import service.auto.view.PersonModel;

@Controller
@SessionAttributes("personModel")
public class AutoController {
	
	private final static Logger LOGGER = LoggerFactory.getLogger(AutoController.class);
	
	@Autowired
	private AutoService autoService;
	@Autowired
	private UserService userService;
	
	@ModelAttribute("personModel")
	public PersonModel getPersonModel() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		return userService.getPersonModel(username);
	}
	
	@GetMapping("/main")
	public String index(Model model, PersonModel person) {
		model.addAttribute("auto", autoService.getMainAuto(person));
		return "main";
	}
	
	@PostMapping("/main_auto")
	public String selectMainAuto(@RequestParam("mainId") Long autoId, 
			PersonModel person, Model model) {
		autoService.editMainAuto(autoId, person);
		model.addAttribute("successMessage", "Выбрано основным");
		return "auto";
	}
	
	@PostMapping("/mileage")
	public String editMileage(@RequestParam("mileage") Long mileage, Model model,
			PersonModel person) {
		if(mileage < 0) {
			model.addAttribute("errorMessage", "Ошибка ввода пробега");
			return "auto";
		}
		if(autoService.editMileage(mileage, person)) {
			model.addAttribute("successMessage", "Успешно изменено");
			return "auto";
		}
		model.addAttribute("errorMessage", "Неизвестная ошибка изменения пробега");
		return "auto";
	}
	
	@GetMapping("/auto")
	public String getCars(Model model, PersonModel person) {
		List<Auto> list = person.getAuto();
		if(list.isEmpty()) {
			model.addAttribute("noAuto", "Не автомобилей");
		}
		model.addAttribute("listCars", list);
		return "auto";
	}
	
	@GetMapping("/auto/insert_auto")
	public String insertAuto(Model model) {
		model.addAttribute("autoRequest", new AutoRequest());
		return "insert_auto";
	}
	
	@PostMapping("/auto/insert_auto")
	public String insertAuto(@Valid @ModelAttribute("autoRequest") AutoRequest request,
			BindingResult bindingResult, Model model, PersonModel person) {
		if(bindingResult.hasErrors()) {
			return "insert_auto";
		}
		if(autoService.insertAuto(request, person)) {
			model.addAttribute("successMessage", "Успешно сохранено");
			return "result";
		}
		model.addAttribute("errorMessage", "Не сохранено");
		return "result";
	}
	
	@GetMapping("/delete_auto")
	public String deleteAuto(@RequestParam("deleteId") Long autoId, Model model, PersonModel person) {
		if(autoService.deleteAuto(autoId, person)) {
			model.addAttribute("successMessage", "Успешно удалено");
			return "result";
		}
		model.addAttribute("errorMessage", "Ошибка удаления");
		return "result";
	}
	
	@GetMapping("/update_auto")
	public String updateAuto(@RequestParam("updateId") Long autoId, Model model, PersonModel person) {
		AutoUpdateRequest request = new AutoUpdateRequest();
		model.addAttribute("autoRequest", request);
		model.addAttribute("response", autoService.getAutoById(autoId, person));
		return "update_auto";
	}
	
	@PostMapping("/update_auto")
	public String updateAuto(@Valid @ModelAttribute("autoRequest") AutoUpdateRequest request,
			BindingResult bindingResult, Model model, PersonModel person) {
		if(bindingResult.hasErrors()) {
			return "update_auto";
		}
		if(autoService.updateAuto(request, person)) {
			model.addAttribute("successMessage", "Обновлено успешно");
			return "result";
		}
		model.addAttribute("errorMessage", "Ошибка обновления");
		return "result";
		
	}
}
