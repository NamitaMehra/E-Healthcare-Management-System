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
        <title> View Profile </title>
        <link rel="stylesheet" href="csse.css" >
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
                        <li class="rmi"><a href="patient_portal.jsp"> Back </a></li>  
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
            out.print("<html><head><h1><center>DETAILS</center></h1></head><body bgcolor='beige'><center>");
            out.print("<table bgcolor='deepskyblue' width='60%' border=''>");
            while (rs.next()) {

                out.print("<tr>");
                out.print("<tr><td bgcolor='white'>ID</td><td>" + rs.getString(1) + "</td></tr><td bgcolor='white'>AGE</td><td>" + 
                        rs.getInt(2) + "</td></tr><td bgcolor='white'>FIRST NAME</td><td>" + rs.getString(3) + "</td></tr><td bgcolor='white'>MIDDLE NAME</td><td >" + rs.getString(4) + 
                        "</td></tr><td bgcolor='white'>LAST NAME</td><td>" + rs.getString(5) + "</td></tr><td bgcolor='white'>EMAIL</td><td>" + rs.getString(6) + "</td></tr><td bgcolor='white'>DEPARTMENT</td><td>" + rs.getString(7) + "</td></tr><td bgcolor='white'>BLOCK NO.</td><td>" + rs.getInt(8) + 
                        "</td></tr><td bgcolor='white'>HOUSE NO.</td><td>" + rs.getInt(9) + "</td></tr><td bgcolor='white'>AREA</td><td>" + rs.getString(10) + "</td></tr><td bgcolor='white'>DISTRICT</td><td>" + rs.getString(11) + "</td></tr><td bgcolor='white'>CITY</td><td>" + 
                        rs.getString(12) + "</td></tr><td bgcolor='white'>STATE</td><td>" + rs.getString(13) + "</td></tr><td bgcolor='white'>ZIPCODE</td><td>" + rs.getInt(14) + "</td></tr><td bgcolor='white'>PHONE NO.</td><td>" + rs.getString(15)
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