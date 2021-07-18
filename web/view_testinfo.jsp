<%-- 
    Document   : view_testinfo
    Created on : 25 Apr, 2021, 1:55:19 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Test</title>
        <link rel="stylesheet" href="disp_css.css" >
    </head>
    <body>
        <div class="menu">
            <div class="lm">
                    <img src="images\logo.jpeg" alt="">
                </div>
                <div class="leftmenu">
                    <h2>Admin Portal</h2>
                </div>
                <div class="rightmenu">
                    <ul class="rm">
                        <li class="rmi"><a href="HomePage.jsp"> Home </a></li>
                        <li class="rmi"><a href="admin_portal.jsp"> Back </a></li>  
                        <li class="rmi"><a href=""> Logout </a></li>
                           
                    </ul>
                </div>
            </div>
    </body>
</html>
<%
     try {
        
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
            Statement stmt = conn.createStatement(); 
            ResultSet rs = stmt.executeQuery("select * from test");
            out.print("</br>");
            out.print("</br>");
            out.print("<html><body><center><font size='4'>");
            out.print("<table bgcolor='green' width='60%' border='1'>");
            out.print("<tr bgcolor='red'>");
                out.print("<th>"+ "TEST_ID" + "</th><th>" + "TEST_NAME" + "</th><th>" + "Amount" + "</th>");
            out.print("</tr>");
            while (rs.next()){
                out.print("<tr bgcolor='deepskyblue'>");
                out.print("<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getInt(3) + "</td>");
                out.print("</tr>");
            }
            out.print("</table");
            out.print("</font></center></body></html>");
        
     } catch (Exception ex) {
        ex.printStackTrace();
    }
    %>