<html>
    <head>
        <title> View Patient Profile </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <div class="box">
            <h2>View Profile</h2>
                
            <form action="view_profileE.jsp" onclick="return validate()">
                <div class="inputbox">
                    <input type="text" name="empid" id="empid" required><span id="error"></span>
                    <label>Employee ID</label>
                </div>
                <input type="submit" name="view" value="view">
            </form>
        </div>
        <script>
                function validate(){
		var u=document.getElementById('empid').value;
		var uregx=/[E]/;
		var ures=uregx.test(u);
		if(ures === false)
		{
			document.getElementById('error').style.color='red';
                        document.getElementById('error').innerHTML='Please enter valid Employee Id';
			return false;
		}
                document.getElementById('error').style.color='none';
                document.getElementById('error').innerHTML="";
		return true;
		}
                </script>

    </body>
</html>