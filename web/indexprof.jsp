<%-- 
    Document   : indexprof
    Created on : 2018-04-26, 13:25:30
    Author     : Janah
--%>

<%@page import="exam.Prof"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String ContextPath = request.getContextPath();
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP:1.1
            response.setHeader("Pragma", "no-cache"); // HTTP:1.0
            response.setHeader("Expires", "0"); // Proxies
            Prof ConnectedProf = null;
            if (session.getAttribute("ProfConnected") == null) {
                response.sendRedirect(ContextPath + "index.jsp");
            } else {
                ConnectedProf = (Prof) session.getAttribute("ProfConnected");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Index Prof bienvenue <%= ConnectedProf.getNom()%></h1>
    </body>
</html>
