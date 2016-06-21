package com.cyberteo.rifugiobrunone;

import java.io.IOException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class Rifugio_BrunoneServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.sendRedirect("index.html");
	}
}
