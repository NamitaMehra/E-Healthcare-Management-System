<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>EMPLOYEE INFO</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="employee_info.css" rel="stylesheet">
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
        <div class="emp_info">
            <h1>Employee Information</h1>
        </div>
        <div class="main">
        <form method="post" onsubmit="return validate()">
            <h2 class="name">Id</h2>
            <input class="id" type="text" name="eid" id="id1" required><br><span id="e1"></span>
            
            <div id="name">
                <h2 class="name">Name</h2>
                <input class="fname" type="text" name="efname" placeholder="First Name" id="fname1" required>
                <input class="mname" type="text" name="emname" placeholder="Middle Name">
                <input class="lname" type="text" name="elname" placeholder="Last Name">
                <br><span id="e2"></span>
            </div> 
            
            <h2 class="name">Age</h2>
            <input class="age" type="number" name="eage" id="age1" required>
            
            <h2 class="name">Email</h2>
            <input class="email" type="text" name="eemail" id="email1" required><br><span id="e3"></span>
            
            <h2 class="name">Department</h2>
            <input class="dept" type="text" name="edept" id="dept1" required><br><span id="e4"></span>

            <h2 class="name">Block No.</h2>
            <input class="bno" type="number" name="ebno">
            
            <h2 class="name">House No.</h2>
            <input class="hno" type="number" name="ehno" id="hno1" required>
            
            <h2 class="name">Area</h2>
            <input class="area" type="text" name="earea" id="area1" required>
            
            <h2 class="name">District</h2>
            <input class="district" type="text" name="edistrict" id="district1" required>
            
            <h2 class="name">City</h2>
            <input class="city" type="text" name="ecity" id="city1" required>
            
            <h2 class="name">State</h2>
            <input class="state" type="text" name="estate" id="state1" required> 
            
            <h2 class="name">Zipcode</h2>
            <input class="zipcode" type="number" name="ezipcode" id="zipcode1" required><br><span id="e5"></span>
            
            <h2 class="name">Phone No.</h2>
            <input class="phno" type="text" name="ephno" id="phno1" required><br><span id="e6"></span>
            
            <div class="button">
                <button class="btn submit" name="eb1">Add</button>
                <button class="btn clear">Clear</button>
            </div>
            </form>
          </div>  
         </div>   
        <script>
            function validate()
            {
                var id = document.getElementById('id1').value;                
                var fname = document.getElementById('fname1').value;             
                var email = document.getElementById('email1').value;
                var dept = document.getElementById('dept1').value;
                var zipcode = document.getElementById('zipcode1').value;             
                var phno = document.getElementById('phno1').value;       
            
                var idreg = /^[E]/;
                var idregex = idreg.test(id);
                if(idregex === false)
                {
                    document.getElementById('e1').style.color = 'red';
                    document.getElementById('e1').innerHTML = "Please enter valid Employee ID";
                    return false;
                }
               
                var freg = /^[A-Za-z]/;
                var fregex = freg.test(fname);
                if(fregex === false)
                {
                    document.getElementById('e2').style.color = 'red';
                    document.getElementById('e2').innerHTML = "First Name can only contain alphabets";
                    return false;
                }
                
                var ereg = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
                var eregex = ereg.test(email);
                if(eregex === false)
                {
                    document.getElementById('e3').style.color = 'red';
                    document.getElementById('e3').innerHTML = "Please enter valid email id";
                    return false;
                }
                
                var dreg = /^[A-Za-z]/;
                var dregex = dreg.test(dept);
                if(dregex === false)
                {
                    document.getElementById('e4').style.color = 'red';
                    document.getElementById('e4').innerHTML = "Department Name can only contain alphabets";
                    return false;
                }
                
                
                var zreg = /^[0-9]{6}$/;
                var zregex = zreg.test(zipcode);
                if(zregex === false)
                {
                    document.getElementById('e5').style.color = 'red';
                    document.getElementById('e5').innerHTML = "Zipcode can only be of 6 numbers";
                    return false;
                }
                
                var preg = /^[1-9][0-9]{9}$/;
                var pregex = preg.test(phno);
                if(pregex === false)
                {
                    document.getElementById('e6').style.color = 'red';
                    document.getElementById('e6').innerHTML = "Phone No. can only be of 10 numbers";
                    return false;
                }
                
                else
                {
                    document.getElementById('e1').style.color = none;
                    document.getElementById('e1').innerHTML = "";
                    document.getElementById('e2').style.color = none;
                    document.getElementById('e2').innerHTML = "";
                    document.getElementById('e3').style.color = none;
                    document.getElementById('e3').innerHTML = "";
                    document.getElementById('e4').style.color = none;
                    document.getElementById('e4').innerHTML = "";
                    document.getElementById('e5').style.color = none;
                    document.getElementById('e5').innerHTML = "";
                    document.getElementById('e6').style.color = none;
                    document.getElementById('e6').innerHTML = "";
                }
            }
              
 </script>
    </body>
</html>

<%
    try 
    {
        if(request.getParameter("eb1") != null)
        {
            String E_ID = request.getParameter("eid");
            int E_AGE = Integer.parseInt(request.getParameter("eage"));
            String E_FIRSTNAME = request.getParameter("efname");
            String E_MIDDLENAME = request.getParameter("emname");
            String E_LASTNAME = request.getParameter("elname");
            String E_EMAIL = request.getParameter("eemail");
            String DEPARTMENT= request.getParameter("edept");
            int BLOCK_NO = Integer.parseInt(request.getParameter("ebno"));
            String HOUSE_NO = request.getParameter("ehno");
            String AREA = request.getParameter("earea");
            String DISTRICT = request.getParameter("edistrict");
            String CITY = request.getParameter("ecity");
            String STATE = request.getParameter("estate");
            String ZIPCODE = request.getParameter("ezipcode");
            String E_PHNO = request.getParameter("ephno");
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
            PreparedStatement pst = conn.prepareStatement("insert into employee_information values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            
            pst.setString(1, E_ID);
            pst.setInt(2, E_AGE);
            pst.setString(3, E_FIRSTNAME);
            pst.setString(4, E_MIDDLENAME);
            pst.setString(5, E_LASTNAME);
            pst.setString(6, E_EMAIL);
            pst.setString(7, DEPARTMENT);
            pst.setInt(8, BLOCK_NO);
            pst.setString(9, HOUSE_NO);
            pst.setString(10, AREA);
            pst.setString(11, DISTRICT);
            pst.setString(12, CITY);
            pst.setString(13, STATE);
            pst.setString(14, ZIPCODE);
            pst.setString(15, E_PHNO);
            
            int x = pst.executeUpdate();
            if (x > 0) 
            {
                out.print("<script>alert('record inserted successfully.')</script>");
            }
        }
    } 
    catch(Exception ex) 
    {
        ex.printStackTrace();
    }
%>