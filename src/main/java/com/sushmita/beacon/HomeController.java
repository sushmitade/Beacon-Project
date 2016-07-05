package com.sushmita.beacon;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.sushmita.model.User;
import com.sushmita.model.UserRole;
import com.sushmita.model.UserRoleService;
import com.sushmita.model.UserService;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class HomeController {

	@Autowired
	UserService userService;

	@Autowired
	UserRoleService userRoleService;

	@Autowired
	MessageSource messageSource;

	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String homePage() {
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login1Page() {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		} else {
			return "redirect:/userlistadmin";
		}
	}
	

	@RequestMapping(value = "/userlistadmin", method = RequestMethod.GET)
	public String listUsers(ModelMap model) {
		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		model.addAttribute("loggedinuser", getPrincipal());
		return "userlistadmin";
	}

	/*
	 * @RequestMapping(value = "/patienthome", method = RequestMethod.GET)
	 * public ModelAndView userPatientHome(HttpServletRequest request) { int
	 * userId = Integer.parseInt(request.getParameter("id")); User user =
	 * userDao.get(userId); ModelAndView model = new
	 * ModelAndView("patienthome"); model.addObject("user", user); return model;
	 * }
	 */

	@RequestMapping(value = "/newuser", method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("edit", false);
		model.addAttribute("loggedinuser", getPrincipal());
		return "userform";
	}

	@RequestMapping(value = { "/newuser" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			return "userform";
		}

		if (!userService.isUserSSOUnique(user.getId(), user.getSso_id())) {
			FieldError ssoError = new FieldError("user", "sso_id", messageSource.getMessage("non.unique.sso_id",
					new String[] { user.getSso_id() }, Locale.getDefault()));
			result.addError(ssoError);
			return "userform";
		}

		userService.saveUser(user);

		model.addAttribute("success",
				"Patient " + user.getPatientFirstName() + " " + user.getPatientLastName() + " registered successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		return "registrationsuccess";
	}

	@RequestMapping(value = { "/edit-user-{sso_id}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable String sso_id, ModelMap model) {
		User user = userService.findBySSO(sso_id);
		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		model.addAttribute("loggedinuser", getPrincipal());
		return "userform";
	}

	@RequestMapping(value = { "/edit-user-{sso_id}" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result, ModelMap model, @PathVariable String sso_id) {

		if (result.hasErrors()) {
			return "userform";
		}

		userService.updateUser(user);

		model.addAttribute("success",
				"Patient " + user.getPatientFirstName() + " " + user.getPatientLastName() + " updated successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		return "registrationsuccess";
	}

	@RequestMapping(value = { "/delete-user-{sso_id}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String sso_id) {
		userService.deleteUserBySSO(sso_id);
		return "redirect:/userlistadmin";
	}

	@ModelAttribute("roles")
	public List<UserRole> initializeRoles() {
		return userRoleService.findAll();
	}

	@RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			persistentTokenBasedRememberMeServices.logout(request, response, auth);
			SecurityContextHolder.getContext().setAuthentication(null);
		}
		return "redirect:/login?logout";
	}

	@RequestMapping(value = { "/Access_Denied" }, method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("loggedinuser", getPrincipal());
		return "accessdenied";
	}

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();

		}
		return userName;
	}

	private boolean isCurrentAuthenticationAnonymous() {
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return authenticationTrustResolver.isAnonymous(authentication);
	}

}
