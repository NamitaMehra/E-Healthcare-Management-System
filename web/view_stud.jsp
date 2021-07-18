<!DOCTYPE html>
<html>
    <head>
        <title> View Student </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="view_studcss.css" >
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
        <div class="box">
            <h2>View Student Profile</h2>
                
            <form action="disp_viewstud.jsp" method="post" onclick="return validate()">
                <div class="inputbox">
                    <input type="text" name="studid" id="stud" required><span id="error"></span>
                    <label>Student's ID</label>
                </div>
                <input type="submit" name="view" value="View">
                <div class="icon">
                    <a href="edit_stud.jsp" class="fa fa-edit" style="font-size:40px;color:red"></a>
                </div>
            </form>
        </div>
        <script>
     function validate(){
		var u=document.getElementById('stud').value;
		var uregx=/[S]/;
		var ures=uregx.test(u);
		if(ures === false)
		{
			document.getElementById('error').style.color='red';
                        document.getElementById('error').innerHTML='Please enter valid Student Id';
			return false;
		}
                document.getElementById('error').style.color='none';
                document.getElementById('error').innerHTML="";
		return true;
		}
                </script>

    </body>
</html>
