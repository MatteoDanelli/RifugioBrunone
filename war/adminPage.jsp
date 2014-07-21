<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//IT">
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>

<html>

    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">

        <title>Admin Page</title>
    </head>

    <body>             
	     <%
	   response.getWriter().println("<b>Utente: </b>" + request.getUserPrincipal().getName());	     
	     %>
	     
	     <h2>Inserisci qui sotto il nuovo avviso:</h2>
	     
<form class="form" action="gestoreAvvisi" method="post">
			<label>Titolo: </label>
			<input type="text" name="title">
			<br>
			<label>Testo: </label>
			<input type="text" name="text">
			<br>								
			<input type="checkbox" name="important" value="important">Seleziona se l'avviso e' importante
			<br>
			<input type="submit" value="Crea avviso">
</form>
	     
    </body>
    
</html>