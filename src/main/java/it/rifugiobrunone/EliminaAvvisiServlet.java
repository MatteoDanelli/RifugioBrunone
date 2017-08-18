package it.rifugiobrunone;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Text;

@SuppressWarnings("serial")
public class EliminaAvvisiServlet extends HttpServlet {
	
	 @Override
	 public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
         //Method that manage login using Google
         UserService userService = UserServiceFactory.getUserService();
         String thisURL = req.getRequestURI();
         resp.setContentType("text/html");
         
         //User logged
         if (req.getUserPrincipal() != null) {
             req.getRequestDispatcher("/admin.jsp").forward(req, resp);
         } else {
             resp.getWriter().println("<p>Please <a href=\"" + userService.createLoginURL(thisURL) + "\">sign in</a>.</p>");
         }
	 }
	 
	 @Override
	 public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		 //Delete notice from datastore
		 DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		 String[] noticesChecked = req.getParameterValues("selected");
		 for (int i=0; i<noticesChecked.length; i++) {
			 Key noticeKey = KeyFactory.stringToKey(noticesChecked[i]);
			 datastore.delete(noticeKey);
		 }
		 req.getRequestDispatcher("/admin.jsp").forward(req, resp);
	 }
}
