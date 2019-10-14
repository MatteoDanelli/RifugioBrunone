<html>
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
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
    <head>
        <meta name="language" content="it" />
        <meta http-equiv="language" content="it" />
        <meta http-equiv="Content-Language" content="it" />
        <meta name="author" content="Matteo Danelli" />
        <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <link rel="shortcut icon" href="./favicon.ico" type="image/x-icon" />
        <link rel="icon" href="./favicon.ico" type="image/x-icon" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0" />
        <title>Rifugio Brunone</title>
        <meta name="Keywords" content="Brunone, Mountain, Refuges, Orobie" />
        <link rel="stylesheet" href="/css/style2.css" />
    </head>
    <body>
        <div id="top"></div>
        <a id="to_content" href="#contenuto"></a>
        <div id="header">
            <div id="logo"><img src="/images/banner1.png" /></div>
            <div id="menu_e_buttons">
            <div id="menu">
                <a title="Rifugio Brunone" href="/" class="voce"><img src="/images/hut_icon.png" />
                    <font><span>Home</span> - Rifugio Brunone</font>
                </a>
            </div>
        </div>
        </div>
        <div id="slider_mappa">
            <div id="slider_principale">
                <div class="swiper-wrapper">
                    <div style="background-image:url(/images/rifugio.jpg);" class="swiper-slide"><img src="/images/rifugio.jpg"/></div>
                </div>
            </div>
        </div>
        <div id="contenuto">
            <div id="contenuto_top">
                <h1 class="titolo">Crea nuovo</h1>
            </div>
            <form class="form" method="post" accept-charset="utf-8" >
                <div class="form-group" style="display: inline-block;width: 25%;">
                    <label for="titolo">Titolo</label>
                    <br/>
                    <textarea type="text" name="titolo" id="titolo" style="width:100%; height: 50px;"></textarea>
                    <br/>
                    <br/>
                </div>
                <div class="form-group" style="display: inline-block;margin-left: 15px;width: 73%;">
                    <label for="testo">Testo</label>
                    <br/>
                    <textarea type="text" name="testo" id="testo" style="width:100%; height: 50px;"></textarea>
                    <br/>
                    <br/>
                </div>
                <div class="form-group" style="display: inline-block;width: 25%;">
                    <label for="title">Title</label>
                    <br/>
                    <textarea type="text" name="title" id="title" style="width:100%; height: 50px;"></textarea>
                    <br/>
                    <br/>
                </div>
                <div class="form-group" style="display: inline-block;margin-left: 15px;width: 73%;">
                    <label for="text">Text</label>
                    <br/>
                    <textarea type="text" name="text" id="text" style="width:100%; height: 50px;"></textarea>
                    <br/>
                    <br/>
                </div>
                <div class="form-group" style="width: 25%;">
                    <label for="important">Importante</label>
                    <input class="form-control" type="checkbox" name="important" id="important" style="margin-left: 25px;" />
                    <br/>
                    <br/>
                </div>
                <button type="submit" style="width: 25%; height: 42px;">Crea</button>
                <br/>
                <br/> 
            </form>
            <div id="contenuto_top">
                <h1 class="titolo">Lista avvisi</h1>
            </div>
            <form class="form-group" action="eliminaAvvisi" method="post">
                    <%
                    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
                    Query query = new Query("Notice").addSort("date", Query.SortDirection.DESCENDING);
                    PreparedQuery pq = datastore.prepare(query);
                    for (Entity notice : pq.asIterable()) {
                        String title = (String) notice.getProperty("titolo");
                    %>
                        <div class="form-group">
                            <input class="form-control" type="checkbox" style="margin-right: 25px;" name="selected" value="<%= KeyFactory.keyToString(notice.getKey()) %>" />
                            <label><%=title%></label>
                            <br/>
                        </div>
                    <% } %>
                <br/>
                <button type="submit" style="width: 25%; height: 42px;">Elimina avvisi</button>     
            </form>
                        
        </div>
        <div id="boxes">
            <div id="boxes_top"><img src="/images/box.png" /></div>
        </div>
            <div id="social">Segui la pagina ufficiale: <br/><br/>
                <a href="https://www.facebook.com/rifugiobrunone/" target="_blank"><img src="/images/facebook.png" title="facebook" alt="facebook" /></a>
            </div>
            <div id="impressum"><span class="copyright">Copyright © Matteo Danelli, Massimiliano Tebaldi</span></div>
    </body>
</html>