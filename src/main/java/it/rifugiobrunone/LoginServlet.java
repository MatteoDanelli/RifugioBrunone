package it.rifugiobrunone;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import java.net.URLDecoder;
import java.util.Date;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Text;

public class LoginServlet extends HttpServlet {
	
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
         
        String title = req.getParameter("title");
        Text text = new Text(req.getParameter("text"));
        String titolo = req.getParameter("titolo");
        Text testo = new Text(req.getParameter("testo"));
        String important = req.getParameter("important");
         
        //Save notice on datastore
        Entity notice = new Entity("Notice");
        notice.setProperty("title", title);
        notice.setProperty("titolo", titolo);
        notice.setProperty("text", text);
        notice.setProperty("testo", testo);
        notice.setProperty("date", new Date());
        if (important!=null) {
            notice.setProperty("important", "true");
        } else {
            notice.setProperty("important", "false");
        }
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        datastore.put(notice);   
         
        //Redirect to correct page to show updates
        req.getRequestDispatcher("/admin.jsp").forward(req, resp);
     }
}
