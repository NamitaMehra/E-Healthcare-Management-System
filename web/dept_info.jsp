<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Department Information</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="dept_info.css" rel="stylesheet">
    </head>
    <body>
        <div class="bgimage">
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
            <div class="dept_info">
                <h1>Department Information</h1>
            </div>
            <div class="main">
                <form method="POST" onsubmit="return validate()">
                    
                    <h2 class="name">Department&nbsp;Id</h2>
                    <input class="dept" type="text" name="id" id="id1" required><br><span id="e1"></span>
                    <h2 class="name">Department&nbsp;Name</h2>
                    <input class="dept" type="text" name="name" id="name1" required><br><span id="e2"></span>
                    <div class="button">
                        <button class="btn submit" name="b1">Submit</button>
                        <button class="btn clear" type="reset">Clear</button>
                    </div>
                </form>
            </div>    
        </div> 
        <script>
            function validate()
            {
                var u = document.getElementById('id1').value;
                var ureg = /^[D][T]{1}/;
                var uregex = ureg.test(u);
                
                var v = document.getElementById('name1').value;
                var vreg = /^[A-Za-z]/;
                var vregex = vreg.test(v);
                
                if(uregex === false)
                {
                    document.getElementById('e1').style.color = 'red';
                    document.getElementById('e1').innerHTML = "Please enter valid Department ID";
                    return false;
                }
                
                if(vregex === false)
                {
                    document.getElementById('e2').style.color = 'red';
                    document.getElementById('e2').innerHTML = "Please enter valid Department name";
                    return false;
                }
                else
                {
                    document.getElementById('e2').style.color = none;
                    document.getElementById('e2').innerHTML = "";
                }
            }
      </script>
    </body>
</html>

<%
    try 
    {
        if (request.getParameter("b1")!= null) 
        {
            String dept_id = request.getParameter("id");
            String dname = request.getParameter("name");
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
            PreparedStatement pst = conn.prepareStatement("insert into department values(?,?)");
            pst.setString(1, dept_id);
            pst.setString(2, dname);
            int x = pst.executeUpdate();
            if (x > 0) 
            {
                out.print("<script>alert('Added successfully.')</script>");
            }
        }
    } 
    
    catch (Exception ex) 
    {
        ex.printStackTrace();
    }
%>