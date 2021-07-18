<!DOCTYPE html>
<html>
    <head>
        <title>Choose Transaction</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="trans_option.css" rel="stylesheet">
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
        <form class="box" method="post" action="transaction.jsp">
            <div class="trans">
                <h1>Transaction</h1>
            </div>
            <input type="Submit" value="Student" name="student">
            <input type="Submit" value="Employee" name="employee">
        </form>
    </body>
</html>

