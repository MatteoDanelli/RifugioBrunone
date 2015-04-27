package com.cyberteo.rifugiobrunone;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Text;


@SuppressWarnings("serial")
public class GestoreAvvisiServlet extends HttpServlet {
	
	 @Override
	 public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

	 }
	 
	 @Override
	 public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		 
		 String noticeTitle = req.getParameter("title");
		 Text noticeText = new Text(req.getParameter("text"));
		 String importantNotice = req.getParameter("important");
		 
		 //Save notice on datastore
		Entity notice = new Entity("Notice");
	    notice.setProperty("title", noticeTitle);
	    Date date = new Date();
	    notice.setProperty("date", date);
	    notice.setProperty("text", noticeText);
	    if ("important".equals(importantNotice)) notice.setProperty("important", "isImportant");
	    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	    datastore.put(notice);	 
		 
	    //Redirect to correct page to show updates
		req.getRequestDispatcher("/avvisi.jsp").forward(req, resp);

	 }
	 
}
