/**
 * 
 */
package com.my.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.my.spring.dao.UserDAO;
import com.my.spring.pojo.User;

/**
 * @author Maulin
 *
 */
@Controller
@RequestMapping("/user/*")
public class UserController {


	
	// Method called when user clicks login on index page, Opens login form
	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	protected String goToLogin(HttpServletRequest request) throws Exception {
		// go to index page inside views
		return "login";
	}
	
	// Method called when user clicks login on login page
		@RequestMapping(value = "/user/login", method = RequestMethod.POST)
		protected ModelAndView login(HttpServletRequest request, UserDAO userDao) throws Exception {
			// verify user name and pass , return to home page
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			User u = userDao.get(username, password);
			if (u == null) {

				
				return new ModelAndView("error","errorMessage","UserName/Password does not exist");
			}
			return new ModelAndView("home");
		}
		
		
		// Method called when user clicks register user on login page. Opens register form
		@RequestMapping(value = "/user/register", method = RequestMethod.GET)
		protected String openRegistrationForm(HttpServletRequest request) throws Exception {
			 
			return "register";
		}
		
		@RequestMapping(value = "/user/register", method = RequestMethod.POST)
		protected ModelAndView register(HttpServletRequest request, UserDAO userDao) throws Exception {
			// register user name and pass 
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if (userDao.checkUser(username)) {
				return new ModelAndView("error", "errorMessage",
						"user name already exist! Please give another user name.");	
			}else {
				
				User u = new User();
				u.setUsername(username);
				u.setPassword(password);
				userDao.register(u);
			}

			return new ModelAndView("home");
		}
		
		@RequestMapping(value = "/user/home", method = RequestMethod.GET)
		protected String goToHome(HttpServletRequest request) throws Exception {
			// go to index page inside views
			return "home";
		}
}
