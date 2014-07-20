package com.cyberteo.rifugiobrunone;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
public class GestoreAvvisiServlet extends HttpServlet {
	
	 @Override
	 public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.getRequestDispatcher("/avvisiTest.jsp").forward(req, resp);

	 }
	 
	 @Override
	 public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		 //TODO
		 String titoloAvviso = req.getParameter("title");
		 String testoAvviso = req.getParameter("text");
		 String avvisoImportante = req.getParameter("important");
		 
		 if ("important".equals(avvisoImportante)) req.setAttribute("avvisoImportante", "true");
		 else req.setAttribute("avvisoImportante", "false");
		 
		 req.setAttribute("titoloAvviso", titoloAvviso); 
		 req.setAttribute("testoAvviso", testoAvviso); 
         req.getRequestDispatcher("/avvisiTest.jsp").forward(req, resp);
	 }
	 
}
