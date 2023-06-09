package com.nay.springdemo.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.nay.springdemo.entity.User;
import com.nay.springdemo.service.UserService;
import com.nay.springdemo.user.CrmUser;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
    private UserService userService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
				System.out.println("\n\n In customAuthenticationSuccessHandler\n\n");

				String userName = authentication.getName();
				
				System.out.println("userName=" + userName);

				User theUser = userService.findByUserName(userName);
				
				// now place in the session
				HttpSession session = request.getSession();
				session.setAttribute("user", theUser);
				
				// forward to home page
				
				response.sendRedirect(request.getContextPath() + "/");
				
	}

}
