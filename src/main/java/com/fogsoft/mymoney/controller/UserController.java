package com.fogsoft.mymoney.controller;

import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fogsoft.mymoney.exception.DuplicateEntityException;
import com.fogsoft.mymoney.model.User;
import com.fogsoft.mymoney.service.MessageBean;
import com.fogsoft.mymoney.service.MessageType;
import com.fogsoft.mymoney.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	private final String FORM_URL = "/user/form";
	private final String LIST_URL = "/user/list";

	@Autowired
	private UserService userService;

	@Autowired
	private MessageSource messageSource;

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String formNew(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("mode", ViewMode.NEW);
		return FORM_URL;
	}

	@RequestMapping(value = "addUser", method = RequestMethod.POST, name = "addUser")
	public String addUser(@ModelAttribute @Valid User user, BindingResult result, RedirectAttributes atts, Model model,
			Locale locale) {
		if (result.hasErrors()) {

			System.out.println(user.getBirthday());

			model.addAttribute("user", user);
			model.addAttribute("mode", ViewMode.NEW);
			return FORM_URL;
		}

		try {
			userService.add(user);
		} catch (DuplicateEntityException e) {
			String msg = messageSource.getMessage("msg.user.email.duplicated", null, locale);
			model.addAttribute("message", new MessageBean(MessageType.ERRO, msg));

			result.addError(new ObjectError("username", msg));
			model.addAttribute("user", user);
			model.addAttribute("mode", ViewMode.NEW);
			return FORM_URL;
		}

		model.addAttribute("message",
				new MessageBean(MessageType.SUCESS, messageSource.getMessage("msg.user.added.success", null, locale)));
		return "redirect:" + LIST_URL;
	}

	@RequestMapping(value = "/edit/'{id}'", method = RequestMethod.GET)
	public String formUpdate(@PathVariable int id, Model model) {
		User user = userService.get(id);

		model.addAttribute("user", user);
		model.addAttribute("mode", ViewMode.EDIT);
		model.addAttribute("username_readonly", "readonly");

		return FORM_URL;
	}

	@RequestMapping(value = "updateUser", method = RequestMethod.POST, name = "updateUser")
	public String updateUser(@ModelAttribute @Valid User user, BindingResult result, Model model, Locale locale) {
		if (result.hasErrors()) {
			model.addAttribute("user", user);
			model.addAttribute("mode", ViewMode.EDIT);
			return FORM_URL;
		}

		userService.update(user);
		model.addAttribute("message", new MessageBean(MessageType.SUCESS,
				messageSource.getMessage("msg.user.updated.success", null, locale)));
		return "redirect:" + LIST_URL;
	}

	@RequestMapping("/{id}")
	public String formDetalhe(@PathVariable int id, Model model) {
		User user = userService.get(id);

		model.addAttribute("user", user);
		model.addAttribute("mode", ViewMode.DETAIL);
		model.addAttribute("username_readonly", "readonly");
		model.addAttribute("otherfields_readonly", "readonly");

		return FORM_URL;
	}

	@RequestMapping(value = "/delete/'{id}'", method = RequestMethod.GET)
	public String delete(@PathVariable int id, Model model) {
		userService.delete(id);

		return "redirect:" + LIST_URL;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		List<User> users = userService.list();
		model.addAttribute("users", users);
		return LIST_URL;
	}
}