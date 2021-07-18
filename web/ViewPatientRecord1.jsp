<%-- 
    Document   : ViewPatientRecord1
    Created on : 13 Jul, 2021, 1:53:01 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Patient Record </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style3.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div class="menu">
            <div class="lm">
                    <img src="images\logo.jpeg" alt="">
                </div>
                <div class="leftmenu">
                    <h2>Doctor Portal</h2>
                </div>
                <div class="rightmenu">
                    <ul class="rm">
                        <li class="rmi"><a href="HomePage.jsp"> Home </a></li>
                        <li class="rmi"><a href="doctor_portal.jsp"> Back </a></li>  
                        <li class="rmi"><a href="logout.jsp"> Logout </a></li>
                           
                    </ul>
                </div>
            </div>
        <div class="form-container">
            <h1> Patient Record </h1>
            <form action="ViewPatientRecord.jsp" method="POST" onclick="return validate()">
                <div class="control">
                    <label for="pid"> Enter Patient ID </label>
                    <input type="text" name="pid" id="id" required><span id="error"></span>
                </div>
                
                <div class="control">
                    <input type="submit" value="View" name="btnView">
                </div>
            </form>
        </div>
        <script>
            function validate(){
		var u=document.getElementById('did').value;
		var uregx=/[ES]/;
		var ures=uregx.test(u);
		if(ures === false)
		{
			document.getElementById('error').style.color='red';
                        document.getElementById('error').innerHTML='Please enter valid Patient Id';
			return false;
		}
                document.getElementById('error').style.color='none';
                document.getElementById('error').innerHTML="";
		return true;
		}
       </script>

    </body>
</html>
