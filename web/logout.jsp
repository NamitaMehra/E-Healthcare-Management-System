<%-- 
    Document   : logout
    Created on : 20 Mar, 2021, 11:15:35 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Logout Page </title>
         <script src="backNoWork.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Expires", "0");
            response.setDateHeader("Expires", -1);
            session.invalidate();
            response.sendRedirect("HomePage.jsp");
        %>
       
    </body>
</html>
