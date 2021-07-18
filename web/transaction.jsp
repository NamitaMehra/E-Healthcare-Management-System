<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Transaction</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="transaction.css" rel="stylesheet">
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
    try 
    {
        if (request.getParameter("student")!= null) 
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
            Statement stmt = conn.createStatement();
            String sid="S";
            ResultSet rs=stmt.executeQuery("select * from transaction_information where p_id like ('"+sid+"%')");
            out.print("</br>");
            out.print("</br>");

            out.print("<html><body><center><font color='black' face='Georgia' size=4>");
            out.print("<table bgcolor='red' width='60%' border='1'>");
            out.print("<thead>");
            
            out.print("<tr>");
                out.print("<th>"+ "Student_ID" + "</th><th>" + "Fees"
                        + "</th>");
                out.print("</tr>");
            out.print("</thead>");
            
            out.print("<tbody bgcolor='deepskyblue'>"); 
            while (rs.next()) 
            {

                out.print("<tr align='center' padding=5px>");
                out.print("<td>" + rs.getString(1) + "</td><td>" + rs.getInt(2) + "</td>");
                out.print("</tr>");

            }
            out.print("</tbody>");
            out.print("</table");
            out.print("</font></center></body></html>");
        }
        
        if (request.getParameter("employee")!= null) 
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
            Statement stmt = conn.createStatement();
            String eid="E";
            ResultSet rs=stmt.executeQuery("select * from transaction_information where p_id like ('"+eid+"%')");
            out.print("</br>");
            out.print("</br>");

            out.print("<html><body><center><font color='black' face='Georgia' size=4>");
            out.print("<table bgcolor='red' width='60%' border='1'>");
            out.print("<thead>");
            
            out.print("<tr>");
                out.print("<th>"+ "Employee_ID" + "</th><th>" + "Fees"
                        + "</th>");
                out.print("</tr>");
            out.print("</thead>");
            
            out.print("<tbody bgcolor='deepskyblue'>");
            while (rs.next()) 
            {

                out.print("<tr align='center' padding=5px>");
                out.print("<td>" + rs.getString(1) + "</td><td>" + rs.getInt(2) + "</td>");
                out.print("</tr>");

            }
            out.print("</tbody>");
            out.print("</table");
            out.print("</font></center></body></html>");
        }
    }
    catch (Exception ex) 
    {
        ex.printStackTrace();
    }
%>