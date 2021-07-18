<%-- 
    Document   : AddStudent
    Created on : 14 Mar, 2021, 11:52:13 PM
    Author     : HP
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student INFO</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="addstudentstyle.css" rel="stylesheet">
    </head>
    <body>
        
        <div class="bgimage">
        <div class="button1">
                <button class="btn1 home">Home</button>
                <button class="btn1 back">Back</button>
        </div>
        <div class="student_info">
            <h1>Student Information</h1>
        </div>
        <div class="main">
        <form method="POST">
            <h2 class="name">Id</h2>
            <input class="id" type="text" name="id">
            
            <div id="name">
                <h2 class="name">Name</h2>
                <input class="fname" type="text" name="fname" placeholder="First Name">
                <input class="mname" type="text" name="mname" placeholder="Middle Name">
                <input class="lname" type="text" name="lname" placeholder="Last Name">
            </div> 
            
            <h2 class="name">Age</h2>
            <input class="age" type="number" name="sage">
            
            <h2 class="name">Email</h2>
            <input class="email" type="text" name="semail">
            
            <div id="name">
                <h2 class="name">Father's&nbsp;Name</h2>
                <input class="fname" type="text" name="ffname" placeholder="First Name">
                <input class="mname" type="text" name="fmname" placeholder="Middle Name">
                <input class="lname" type="text" name="flname" placeholder="Last Name">
            </div> 
            
            <h2 class="name">Hostel Name</h2>
            <input class="hname" type="text" name="hname">
            
            <h2 class="name">Hostel&nbsp;Room&nbsp;No.</h2>
            <input class="hrno" type="number" name="hrno">
            
            <h2 class="name">Course</h2>
            <input class="course" type="text" name="scourse">
            
            <h2 class="name">Current Year</h2>
            <input class="year" type="number" name="syear">
            
            <h2 class="name">House No.</h2>
            <input class="hno" type="text" name="shno">
            
            <h2 class="name">Area</h2>
            <input class="area" type="text" name="sarea">
            
            <h2 class="name">District</h2>
            <input class="district" type="text" name="sdistrict">
            
            <h2 class="name">City</h2>
            <input class="city" type="text" name="scity">
            
            <h2 class="name">State</h2>
            <input class="state" type="text" name="sstate">
            
            <h2 class="name"> Zipcode </h2>
            <input class="zipcode" type="text" name="szipcode">
            
            <h2 class="name">Phone No.</h2>
            <input class="phno" type="text" name="phno">
            
            <h2 class="name">Parent&nbsp;Phone&nbsp;No.</h2>
            <input class="pphno" type="text" name="pphno">
            
            <div class="button">
                <input type="submit" class="btn submit" name="b1" value="Add">
                <input type="reset" class="btn clear" value="Clear">
            </div>
            
           </form>
          </div>  
         </div>   
    </body>
</html>

<%
    try 
    {
        if (request.getParameter("b1")!= null) 
        {
            String s_id = request.getParameter("id");
            String s_firstname = request.getParameter("fname");
            String s_middlename = request.getParameter("mname");
            String s_lastname = request.getParameter("lname");
            int s_age = Integer.parseInt(request.getParameter("sage"));
            String s_email = request.getParameter("semail");
            String father_firstname = request.getParameter("ffname");
            String father_middlename = request.getParameter("fmname");
            String father_lastname = request.getParameter("flname");
            String hostel_name = request.getParameter("hname");
            int room_no = Integer.parseInt(request.getParameter("hrno"));
            String course = request.getParameter("scourse");
            int current_year = Integer.parseInt(request.getParameter("syear"));
            String house_no = request.getParameter("shno");
            String area = request.getParameter("sarea");
            String district  = request.getParameter("sdistrict");
            String city = request.getParameter("scity");
            String state = request.getParameter("sstate");
            String zipcode = request.getParameter("szipcode");
            String s_phno = request.getParameter("phno");
            String s_parentphno = request.getParameter("pphno");
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
            PreparedStatement pst = conn.prepareStatement("insert into student_information "
                    + "(s_id, s_firstname, s_middlename, s_lastname, s_age, s_email, father_firstname, father_middlename, father_lastname, hostel_name, room_no, course, current_year, house_no, area, district, city, state, zipcode, s_phno, s_parentphno)"
                    + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            
            pst.setString(1, s_id);
            pst.setString(2, s_firstname);
            pst.setString(3, s_middlename);
            pst.setString(4, s_lastname);
            pst.setInt(5, s_age);
            pst.setString(6, s_email);
            pst.setString(7, father_firstname);
            pst.setString(8, father_middlename);
            pst.setString(9, father_lastname);
            pst.setString(10, hostel_name);
            pst.setInt(11, room_no);
            pst.setString(12, course);
            pst.setInt(13, current_year);
            pst.setString(14, house_no);
            pst.setString(15, area);
            pst.setString(16, district);
            pst.setString(17, city);
            pst.setString(18, state);
            pst.setString(19, zipcode);
            pst.setString(20, s_phno);
            pst.setString(21, s_parentphno);
            
            int x = pst.executeUpdate();
            if (x > 0) 
            {
                out.print("<script>alert('Added successfully.')</script>");
            }
        }
    } 
    catch(Exception ex) 
    {
        ex.printStackTrace();
        out.println("Unable to connect to batabase.");
    }
%>
