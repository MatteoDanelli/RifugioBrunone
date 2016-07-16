<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//IT">
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery" %>
<%@ page import="com.google.appengine.api.datastore.Text" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>

    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta name="keywords" content="rifugio baroni brunone, rifugio baroni valbondione, rifugio baroni bergamo, valbondione, rifugio brunone, fiumenero, sentiero orobie" />
		<link href="/css/style.css" rel="stylesheet" type="text/css" />
        <link href="/css/gallery.css" rel="stylesheet" />
        <link href="/lightbox/css/lightbox.css" rel="stylesheet" />

        <title>Rifugio Brunone - News</title>
        
        <script type="text/javascript" src="/lightbox/js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="/lightbox/js/lightbox-2.6.min.js"></script>

    </head>

    <body>
        <div class="page">
            <div class="header">
                <a href="index.html" id="logo">
                    <img src="/images/banner1.png" alt="">
                </a>
                <ul>
                    <li><a href="index.html">Home</a>
                    </li>
                    <li><a href="comeraggiungerci.html">Dove siamo</a>
                    </li>
                    <li><a href="rifugio.html">Il rifugio</a>
                    </li>
                    <li><a href="immagini.html">Immagini</a>
                    </li>
                    <li><a href="contatti.html">Contatti</a>
                    </li>
                </ul>
            </div>

            <div class="body">
                <br>
                <div class="news">
                    <div class="titolo">Avvisi</div>
                   <!-- Avvisi Dinamici, presenti nel Datastore e creati dall'area Admin -->
                   
                   <%
				    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
				    Query query = new Query("Notice").addSort("date", Query.SortDirection.DESCENDING);
				    PreparedQuery pq = datastore.prepare(query);
				    //Check if there are no notices
				    if (pq.countEntities()==0) out.println("<p>Al momento non sono presenti avvisi.</p>");
				    
				    //One cycle to get important notices, showed on top
				    for (Entity notice : pq.asIterable()) {
				    	  String title = (String) notice.getProperty("title");
				    	  String priority = (String) notice.getProperty("important");
				    	  if (priority!=null) {
				    		  out.println("<h1>" + title + "</h1>");
				    		  if (notice.getProperty("text") instanceof Text) {
						    	  Text text = (Text) notice.getProperty("text");
						    	  out.println("<p>" + text.getValue() + "</p>"); 
					    	  } else {
					    	      String text = (String) notice.getProperty("text");
						    	  out.println("<p>" + text + "</p>"); 
					    	  }
				    	  }
				    }
				    
				    //Another cycle for not important notices
				    for (Entity notice : pq.asIterable()) {
				    	  String title = (String) notice.getProperty("title");
				    	  String priority = (String) notice.getProperty("important");
				    	  //If notice is important use a bigger character
				    	  if (priority==null) {
					    	  out.println("<h2>" + title + "</h2>"); 
					    	  Date date = (Date) notice.getProperty("date");
					    	  if (notice.getProperty("text") instanceof Text) {
						    	  Text text = (Text) notice.getProperty("text");
						    	  out.println("<p>" + text.getValue() + "</p>"); 
					    	  } else {
					    	      String text = (String) notice.getProperty("text");
						    	  out.println("<p>" + text + "</p>"); 
					    	  }
				    	  }

				    }
				    %>
                   

                <div class="footer">
                    <p>Copyright &copy; 2013-2016 Matteo Danelli, Massimiliano Tebaldi - All rights reserved</a></p>
                    <div class="connect">
                         <a href="http://www.facebook.com/sharer.php?u=http://www.rifugiobrunone.it" id="facebook">facebook</a> 
                        	<a href="http://twitter.com/home?status=Visita%20il%20sito%20del%20Rifugio%20Brunone!%20www.rifugiobrunone.it" id="twitter">twitter</a> 
                        	<a href="https://plus.google.com/share?url=www.rifugiobrunone.it" id="google">google+</a> 
                    </div>
                    <script type="text/javascript" src="http://codice.shinystat.com/cgi-bin/getcod.cgi?USER=rifugiobrunone"></script>
                </div>
            </div>

    </body>

</html>