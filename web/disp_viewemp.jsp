<%-- 
    Document   : disp_viewemp
    Created on : Mar 12, 2021, 1:17:09 PM
    Author     : priya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="disp_css.css" >
        <title> View Employee </title>
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
    </body>
</html>
<%
    try {
        if (request.getParameter("view") != null) {

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
            Statement stmt = conn.createStatement();
            String eid = request.getParameter("empid");
            ResultSet rs = stmt.executeQuery("select * from employee_information where e_id like ('" + eid + "%')");
            out.print("<html><body bgcolor='beige'><center></br></br></br><h1>DETAILS</h1></br></br>");
            out.print("<table bgcolor='green' width='80%' border=''>");
            out.print("<tr>");
            out.print("<tr bgcolor='red'><td>ID</td><td>AGE</td><td>FIRST NAME</td><td>MIDDLE NAME</td><td>LAST NAME</td><td>EMAIL</td><td>DEPARTMENT</td><td>BLOCK NO.</td><td>HOUSE NO.</td><td>AREA</td><td>DISTRICT</td><td>CITY</td><td>STATE</td><td>ZIPCODE</td><td>PHONE NO.</td></tr>");
            while (rs.next()) {

                out.print("<tr bgcolor='deepskyblue'>");
                out.print("<td>" + rs.getString(1) + "</td><td>" + rs.getInt(2) + "</td><td>" + rs.getString(3) + "</td><td >" + rs.getString(4) + 
                        "</td><td>" + rs.getString(5) + "</td><td>" + rs.getString(6) + "</td><td>" + rs.getString(7) + "</td><td>" + rs.getString(8) + 
                        "</td><td>" + rs.getInt(9) + "</td><td>" + rs.getString(10) + "</td><td>" + rs.getString(11) + "</td><td>" + 
                        rs.getString(12) + "</td><td>" + rs.getString(13) + "</td><td>" + rs.getInt(14) + "</td><td>" + rs.getString(15)
                        + "</td>");
                out.print("</tr>");

            }
            out.print("</table");
            out.print("</center></body></html>");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>