<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//IT">
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery" %>
<%@ page import="com.google.appengine.api.datastore.Text" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>

<html>

    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <link href="/css/style.css" rel="stylesheet" type="text/css" />
        
        <title>Admin Page</title>
    </head>

    <body>   
    <div class="page">
            <div class="header">
                <a href="/index.html" id="logo">
                    <img src="/images/banner1.png" alt="">
                </a>
	     		
	     		<div class="body">
	     <h2>Inserisci qui sotto il nuovo avviso:</h2>	     
		<form class="form" action="gestoreAvvisi" method="post"accept-charset="utf-8" >
					<h3>Titolo: </h3> 
					<textarea rows="1" cols="50" name="title"></textarea> 
					<h3>Testo: </h3>
					<textarea rows="10" cols="50" name="text"></textarea> <br>								
					<input type="checkbox" name="important" value="important">
						Seleziona se l'avviso è importante [Verrà messo in cima alla lista]
					<p><input type="submit" value="Crea avviso">
					</p>			
		</form>

	     <h2>Lista avvisi presenti:</h2>
	     <form class="form" action="eliminaAvvisi" method="post">	     
	     <%
				    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
				    Query query = new Query("Notice").addSort("date", Query.SortDirection.DESCENDING);
				    PreparedQuery pq = datastore.prepare(query);
				    out.println("<p>");
				    for (Entity notice : pq.asIterable()) {
				    	String title = (String) notice.getProperty("title");
				  	%>
				    	<input type="checkbox" name="selected" value=" <%= KeyFactory.keyToString(notice.getKey()) %> " >
				    	<%out.println(title + "<br>");
				    } %> 
				    <input type="submit" value="Elimina avvisi">
				    <%
				    out.println("</p>");
				    %>		
				    	    
	    </form>		    
				    
</div>

            <div class="footer">
                <p>Copyright &copy; 2013-2015 Matteo Danelli, Massimiliano Tebaldi - All rights reserved</a>
                </p>
                <div class="connect">
                     <a href="http://www.facebook.com/sharer.php?u=http://www.rifugiobrunone.it" id="facebook">facebook</a> 
                    	<a href="http://twitter.com/home?status=Visita%20il%20sito%20del%20Rifugio%20Brunone!%20www.rifugiobrunone.it" id="twitter">twitter</a> 
                    	<a href="https://plus.google.com/share?url=www.rifugiobrunone.it" id="google">google+</a> 
                </div>
            </div>
    </body>
    
</html>