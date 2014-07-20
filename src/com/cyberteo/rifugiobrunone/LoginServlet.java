package com.cyberteo.rifugiobrunone;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class LoginServlet extends HttpServlet {
	
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
    	
    	//Method that manage login using Google
        UserService userService = UserServiceFactory.getUserService();
        
        String thisURL = req.getRequestURI();       

        resp.setContentType("text/html");
        
        //User logged
        if (req.getUserPrincipal() != null) {
            req.getRequestDispatcher("/adminPage.jsp").forward(req, resp);
        	
//            resp.getWriter().println("<p>Hello, " +
//                                     req.getUserPrincipal().getName() +
//                                     "!  You can <a href=\"" +
//                                     userService.createLogoutURL(thisURL) +
//                                     "\">sign out</a>.</p>");
        } else {
            resp.getWriter().println("<p>Please <a href=\"" +
                                     userService.createLoginURL(thisURL) +
                                     "\">sign in</a>.</p>");
        }
    }
}