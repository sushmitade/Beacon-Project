package com.sushmita.beacon;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.ui.ModelMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.UriComponentsBuilder;

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
	public ResponseEntity<List<User>> listAllUsers() {
        List<User> users = userService.findAllUsers();
        if(users.isEmpty()){
            return new ResponseEntity<List<User>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<User>>(users, HttpStatus.OK);
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
	  public ResponseEntity<Void> createUser(@RequestBody User user,    UriComponentsBuilder ucBuilder) {
        System.out.println("Creating User " + user.getUserRoles());
  
        if (userService.findBySSO(user)) {
            System.out.println("A User with name " + user.getUserRoles() + " already exist");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
  
        userService.saveUser(user);
  
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/newuser/{sso_id}").buildAndExpand(user.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
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
	 public ResponseEntity<User> updateUser(@PathVariable("sso_id") String sso_id, @RequestBody User user) {
        System.out.println("Updating User " + sso_id);
          
        User currentUser = userService.findBySSO(sso_id);
          
        if (currentUser==null) {
            System.out.println("User with id " + sso_id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
  
        currentUser.setPatientFirstName(user.getPatientFirstName());
        currentUser.setPatientLastName(user.getPatientLastName());
        currentUser.setPassword(user.getPassword());
        currentUser.setPatientEmail(user.getPatientEmail());
        currentUser.setPatientAddress1(user.getPatientAddress1());
        currentUser.setPatientAddress2(user.getPatientAddress2());
        currentUser.setPatientCity(user.getPatientCity());
        currentUser.setPatientState(user.getPatientState());
        currentUser.setPatientZipCode(user.getPatientZipCode());
        currentUser.setPatientPhone(user.getPatientPhone());
        currentUser.setDescription(user.getDescription());
                 
        userService.updateUser(currentUser);
        return new ResponseEntity<User>(currentUser, HttpStatus.OK);
    }

	@RequestMapping(value = { "/delete-user-{sso_id}" }, method = RequestMethod.GET)
	 public ResponseEntity<User> deleteUser(@PathVariable("sso_id") String sso_id) {
        System.out.println("Fetching & Deleting User with sso_id " + sso_id);
  
        User user = userService.findBySSO(sso_id);
        if (user == null) {
            System.out.println("Unable to delete. User with sso_id " + sso_id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
  
        userService.deleteUserBySSO(sso_id);
        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
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
