package service.auto.rest;

import java.util.List;

import javax.validation.Valid;

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
import service.auto.view.PersonModel;

@Controller
@SessionAttributes("personModel")
public class AutoController {
	
	@Autowired
	private AutoService autoService;
	@Autowired
	private UserService userService;
	
	@ModelAttribute("personModel")
	public PersonModel getPersonModel() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		return userService.getPersonModel(username);
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
	
	@GetMapping("/insert_auto")
	public String insertAuto(Model model) {
		model.addAttribute("autoRequest", new AutoRequest());
		return "insert_auto";
	}
	
	@PostMapping("/insert_auto")
	public String insertAuto(@Valid @ModelAttribute("autoRequest") AutoRequest request,
			BindingResult bindingResult, Model model, PersonModel person) {
		if(bindingResult.hasErrors()) {
			return "insert_auto";
		}
		if(autoService.insertAuto(request, person)) {
			model.addAttribute("result", "Успешно сохранено");
			return "result";
		}
		model.addAttribute("result", "Не сохранено");
		return "result";
	}
	
	@GetMapping("/delete_auto")
	public String deleteAuto(@RequestParam("deleteId") Long autoId, Model model, PersonModel person) {
		if(autoService.deleteAuto(autoId, person)) {
			model.addAttribute("result", "Успешно удалено");
			return "result";
		}
		model.addAttribute("result", "Ошибка удаления");
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
			model.addAttribute("result", "Обновлено успешно");
			return "result";
		}
		model.addAttribute("result", "Ошибка обновления");
		return "result";
		
	}
}
