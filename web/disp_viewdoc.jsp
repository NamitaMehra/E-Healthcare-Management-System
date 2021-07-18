<%-- 
    Document   : view_action
    Created on : Mar 9, 2021, 5:35:19 PM
    Author     : priya
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="view_doctorcss.css" >
        <title> Doctor Details </title>
    </head>
    <body>
        <div class="menu">
            <div class="lm">
                    <img src="images\logo.jpeg" alt="">
                </div>
                <div class="leftmenu">
                    <h2>Patient Portal</h2>
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
                if (request.getParameter("view") != null) {

                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
                    Statement stmt = conn.createStatement();
                    String did = request.getParameter("docid");
                    ResultSet rs = stmt.executeQuery("select * from doctor_information where d_id like ('" + did + "%')");
                    out.print("<html><head><h1><center>DETAILS</center></h1></head><body bgcolor='beige'><center>");
                    out.print("<table bgcolor='green' width='60%' border=''>");
                    out.print("<tr bgcolor='red'><td>ID</td><td>FIRST NAME</td><td>MIDDLE NAME</td><td>LAST NAME</td><td>Department</td><td>Phone Number</td><td>Email</td><td>Hospital Room No.</td></tr>");
                    while (rs.next()) {

                        out.print("<tr bgcolor='deepskyblue'>");
                        out.print("<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) +
                                "</td><td>" + rs.getString(5) + "</td><td>" + rs.getString(6) + "</td><td>" + rs.getString(7) + "</td><td>" + rs.getString(8) + "</td>");
                        out.print("</tr>");

                    }
                     out.print("</tbody>");
                    out.print("</table");
                    out.print("</font></center></body></html>");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
    </body>
</html>
