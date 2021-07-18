<%-- 
    Document   : forgotpassword
    Created on : 11 May, 2021, 1:12:45 AM
    Author     : HP
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student-Forgot Password</title>
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body{
                font-family: "Arial Black";
                position: relative;
                height: 100vh;
                width: 100%;
                background: url("4.jpg");
                background-size: cover;
                background-position: center;
                color: #FFa500; 
            }
            .form-container{
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background: linear-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.8));
                width: 400px;
                padding: 50px 30px;
                border-radius: 10px;
                box-shadow: 7px 7px 60px #000;
            }


        </style>
    </head>
    <body>
        <div class="form-container">
            <form action="" method="POST">
                <div class="control">
                    <label for="name"> Student ID </label>
                    <input type="text" name="stuid" id="studid" value=<%=request.getParameter("id")%> required> </br></br>
                    <label for="name"> Your Question: </label></br>
                    <textarea name="ques" id="qs" rows="5" cols="40"></textarea></br></br>
                    <label for="name"> Your Answer: </label></br>
                    <textarea name="ans" id="qans" rows="5" cols="40"></textarea>
                </div>
            </form>
        </div>
                <!--<div class="form-container">
                    
                </div>  -->     
        <%
    try 
    { 
        //if(request.getParameter("forgot") != null){
            String sid = request.getParameter("stuid");
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
            //Statement smt=conn.createStatement();
            //ResultSet rs = smt.executeQuery("select * from authentication where id='"+sid+"'");
            PreparedStatement pst = conn.prepareStatement("select * from authentication where id=?");
            pst.setString(1, "S101");
            ResultSet rs = pst.executeQuery();
            
            if(rs.next()){
                 //document.write(); 
                out.print("Your security question is: " +rs.getString(3));
            }
            else {
                out.println("Login Failed! Wrong Id or Password");
            }
        //}
            
           
    } 
    catch(Exception ex) 
    {
        ex.printStackTrace();
    }
%>
    </body>
</html>
