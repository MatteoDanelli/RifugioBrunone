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
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="./css/style2.css" />
    </head>

    <body>
        <div id="top"></div>
        <a id="to_content" href="#contenuto"></a>
        <div id="header">
            <div id="lingue">
                <div class="languages"><a href="./it/index.jsp" class="header-top-languages a lang">IT</a>
                    <a href="./en/index.jsp" class="header-top-languages a selcted">EN</a></div>
            </div>
            <div id="menu_e_buttons">
                <div id="menu">
                    <a title="Rifugio Brunone" href="./it/index.jsp" class="voce"><img src="./images/hut_icon.png" />
                        <font><span>Home</span> - Rifugio Brunone</font>
                    </a>
                    <a title="Map" href="./it/sentieri.html" class="voce"><img src="./images/map_icon.png" />
                        <font><span>Tours</span> - Discover</font>
                    </a>
                    <a title="Photos" href="./it/immagini.html" class="voce"><img src="./images/photo_icon.png" />
                        <font><span>Gallery</span> - Breathtaking views</font>
                    </a>
                    <a title="Contatti" href="./it/contatti.html" class="voce"><img src="./images/contacts_icon.png" />
                        <font><span>Events</span> - Events</font>
                    </a>
                </div>
            </div>
            <div id="logo"><img src="./images/banner1.png" /></div>
        </div>
        <!-- fine header-->
        <div id="slider_mappa">
            <div id="slider_principale">
                <div class="swiper-wrapper">
                    <div style="background-image:url(./images/rifugio.jpg);" class="swiper-slide"><img src="./images/rifugio.jpg" /></div>
                </div>
            </div>
        </div>
        <div id="contenuto">
            <div id="contenuto_top">
                <p>Tra il pizzo del Diavolo di Tenda -il "Cervino bergamasco"- e l'incantevole pizzo Redorta, dal 1879 il rifugio Brunone offre l'ospitalità delle sue solide mura. </p>
                <br/>La prima capanna della Brunona risale al 1879, ricavata da una vecchia baita di minatori che
                lavoravano nelle miniere di ferro, in prossimità del vicino Passo della Scaletta. Fu durante la gita sociale del CAI di Bergamo al Pizzo Redorta, il 29 luglio 1890, che i soci, costretti
                dal maltempo a ripararsi nella vecchia capanna, si resero conto del suo stato di abbandono e decisero di sostituirla. <br/>Una
                decisione formalizzata nell’assemblea sociale del febbraio 1894; poche settimane dopo iniziarono i lavori. Completati in 3 mesi, portarono all’inaugurazione del “Rifugio della Brunona”, come
                venne chiamato all’epoca, il 23 settembre 1894. Il progetto del 1894, dovuto all'Ingegnere Luigi Albani, fa sorgere il rifugio poco più in basso rispetto al capanno dei minatori. In seguito
                il rifugio venne ristrutturato e dedicato, nel 1968 alla guida alpina Antonio Baroni. <br/>Attualmente il rifugio Brunone è rimasto nella collocazione del 1894, a quota 2297m su una meravigliosa
                terrazza erbosa, sotto il passo della Scaletta, con una visuale che spazia dalla cima del Pizzo Redorta alla parete orientale del pizzo del Diavolo di Tenda.<br/><br/>

                <%
            DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
            Query query = new Query("Notice").addSort("date", Query.SortDirection.DESCENDING);
            PreparedQuery pq = datastore.prepare(query);
            //Check if there are no notices
            if (pq.countEntities()>0) {
                out.println("<h2 class=\"titolo\">Avvisi</h2>");
                List<Entity> importantNotices = new ArrayList<Entity>();
                List<Entity> standardNotices = new ArrayList<Entity>();
                String priority = "";
                for (Entity notice : pq.asIterable()) {
                    priority = (String) notice.getProperty("important");
                    if (priority.equals("true")) {
                        importantNotices.add(notice);
                    } else {
                        standardNotices.add(notice);
                    }
                }
                String title = "";
                Text text = new Text("");
                for (Entity notice : importantNotices) {
                    title = (String) notice.getProperty("titolo");
                    text = (Text) notice.getProperty("testo");
                    priority = (String) notice.getProperty("important");
                    out.println("<h3 class=\"sotto_titolo\">" + title + "</h3>"); 
                    out.println(text.getValue()+ "<br/><br/>"); 
                }
                for (Entity notice : standardNotices) {
                    title = (String) notice.getProperty("titolo");
                    text = (Text) notice.getProperty("testo");
                    priority = (String) notice.getProperty("important");
                    out.println("<h3 class=\"sotto_titolo\">" + title + "</h3>"); 
                    out.println(text.getValue()+ "<br/><br/>"); 
                }
            }
            %>
            </div>
        </div>
        <div id="boxes">
            <div id="boxes_top"><img src="./images/box.png" /></div>
        </div>
        <div id="social">Segui la pagina ufficiale: <br/><br/>
            <a href="https://www.facebook.com/rifugiobrunone/" target="_blank"><img src="./images/facebook.png" title="facebook" alt="facebook" /></a>
        </div>
        <div id="impressum"><span class="copyright">Copyright © Matteo Danelli, Massimiliano Tebaldi</span></div>
        <!--Start Cookie Script-->
        <script type="text/javascript" charset="UTF-8" src="http://chs03.cookie-script.com/s/a60ab72f9550a5b41cf3edec9ca67b40.js"></script>
        <!--End Cookie Script-->
    </body>

</html>