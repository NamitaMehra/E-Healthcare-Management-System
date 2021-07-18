<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title> Book Online Appointment </title>
        <link rel="stylesheet" href="style4.css">

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
        <p id="animi"> Timings: 2:00PM to 4:00PM </p>
        <section>
            <div class="form-container">
                <h1> Online Appointment</h1>
                <form action="#" onclick="return validate()" method="post">
                    <div class="control">
                        <label for="name">Patient ID</label>
                        <input type="text" name="patientid" id="pid" required><span id="error"></span>
                    </div>
                    <div class="control">
                        <label for="name">Doctor ID</label>
                        <input type="text" name="department" id="did" required><span id="errorD"></span>
                    </div>
                    <label> Date:</label>
                    <select name="date">
                        <option value="1">Today</option>
                        <option value="2">Tomorrow</option>
                        <option value="3">Day After Tomorrow</option>
                    </select>
                    <div class="control">
                        <input type="submit" value="Book" name="book">
                    </div>

                </form>
            </div>

        </section>
        <form action="#">
        <div >
            <input class="show" type="submit" value="Show All Doctors" name="show">
        </div>
        </form>
        <script>
            function validate(){
		var u=document.getElementById('pid').value;
                var d=document.getElementById('did').value;
                var uregx=/[E+S]/;
                var dregx=/^[D]/;
		var ures=uregx.test(u);
                var dres=dregx.test(d);
		if(ures === false)
		{
			document.getElementById('error').style.color='red';
                        document.getElementById('error').innerHTML='Please enter valid Patient Id';
			return false;
		}
                document.getElementById('error').style.color='none';
                document.getElementById('error').innerHTML="";
		return true;
                if(dres === false)
		{
			document.getElementById('errorD').style.color='red';
                        document.getElementById('errorD').innerHTML='Please enter valid Doctor Id';
			return false;
		}
                document.getElementById('errorD').style.color='none';
                document.getElementById('errorD').innerHTML="";
		return true;
		}
       </script>
    </body>
</html>
<%
    try {

        if (request.getParameter("book") != null) {
            String pid = request.getParameter("patientid");
            String dpt = request.getParameter("department");
            String dp = request.getParameter("date");
            Calendar cal = Calendar.getInstance();
            cal.setTime(new Date());
            if ("3".equals(dp)) {
                cal.add(Calendar.DATE, 2);
            } else if ("2".equals(dp)) {
                cal.add(Calendar.DATE, 1);
            }
            Date timestamp = cal.getTime();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String dte = formatter.format(timestamp);
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
            Statement stmt = conn.createStatement(); 
           String s="online";
           ResultSet rs = stmt.executeQuery("select count(DISTINCT p_id) from appointments where date='"+dte+"' and d_id='"+dpt+"' and mode='"+s+"'");
            rs.next();
           
            int count = rs.getInt(1);
            if(count<25)
            {
            
            PreparedStatement pst = conn.prepareStatement("insert into appointments values(?,?,?,?)");
            pst.setString(1, pid);
            pst.setString(2, dpt);
            pst.setString(3, dte);
            pst.setString(4, "online");
            int x = pst.executeUpdate();
            if (x > 0) {
                
                ResultSet rst = stmt.executeQuery("select p_id from transaction_information where p_id like'" + pid +"'");
                if(rst.next()){
                    PreparedStatement pst1 = conn.prepareStatement("update transaction_information set fees=fees+10 where p_id like'" + pid +"'");
                    pst1.executeUpdate();
                }
                else
                {
                    PreparedStatement pst2 = conn.prepareStatement("insert into transaction_information values(?,?)");
                    pst2.setString(1, pid);
                    pst2.setInt(2, 0);
                    pst2.executeUpdate();
                    PreparedStatement pst3 = conn.prepareStatement("update transaction_information set fees=fees+10 where p_id like'" + pid +"'");
                    pst3.executeUpdate();
                }
                
                out.print("<script>alert('Appointment Booked Successfully. Please connect through the meeting link with your doctor on booked date and time!')</script>");
            }
            else
                {
                   out.print("<script>alert('Bookings are full for the selected doctor and date.')</script>");
                }
            }
        }
        if(request.getParameter("show") != null){
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
            Statement stmt = conn.createStatement(); 
            ResultSet rs = stmt.executeQuery("select d_id, d_dept from doctor_information");
            out.print("<html><body><center>");
            out.print("<table bgcolor='black' width='60%' border='1'>");
            out.print("<tr>");
                out.print("<th>"+ "Doctor_ID" + "</th><th>" + "Doctor_Department" + "</th>");
            out.print("</tr>");
            while (rs.next()){
                out.print("<tr>");
                out.print("<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td>");
                out.print("</tr>");
            }
            out.print("</table");
            out.print("</center></body></html>");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>
