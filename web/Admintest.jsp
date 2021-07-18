<%-- 
    Document   : Admintest
    Created on : 25 Apr, 2021, 3:11:48 AM
    Author     : HP
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Appointments</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style6.css" type="text/css" rel="stylesheet">
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
        <%
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
        Statement stmt = conn.createStatement();
        String dt = request.getParameter("appointment");
        ResultSet rs = stmt.executeQuery("select * from labtest_information where test_date = '" + dt + "'");
        out.print("</br>");
            out.print("</br>");

            out.print("<html><body><center><font size=4 color='black'>");
            out.print("<table bgcolor='red' width='60%' border='1'>");
            out.print("<thead>");
            out.print("<tr>");
            out.print("<th colspan='3' bgcolor='green'>" + "Test Appointments" + "</th>");
            out.print("</tr>");
            out.print("<tr>");
                out.print("<th>"+ "Patient_ID" + "</th><th>" + "Test_ID" + "</th><th>" + "Test_Date"
                        + "</th>");
                out.print("</tr>");
            out.print("</thead>");
            out.print("<tbody bgcolor='deepskyblue'>");  
            
        while (rs.next()) {

            out.print("<tr>");
            out.print("<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getDate(3) + "</td>");
            out.print("</tr>");

        }
         out.print("</tbody>");
        out.print("</table");
        out.print("</font></center></body></html>");
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
    </body>
</html>
