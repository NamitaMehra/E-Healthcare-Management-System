<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style6.css" type="text/css" rel="stylesheet">
        <title> View Test </title>
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
       <div> 
            <div class="form-container">
            <h1> Test Appointment </h1>
            <form action="Admintest.jsp" method="POST" >
                
                <div class="control">
                    <label for="app"> Date </label>
                    <input type="date" name="appointment" required>
                </div>
                
                <div class="control">
                    <input type="submit" value="View" name="btnView">
                </div>
            </form>
        </div>
        
        </div>
    </body>
</html>


