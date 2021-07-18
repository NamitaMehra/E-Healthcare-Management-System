<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title> Lab Test Appointment </title>
        <link rel="stylesheet" href="lab_style.css">

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
        <p id="animi"> Timings: 7:00AM to 12:00PM </p>
        <section>
            <div class="form-container">
                <h1>Lab Test</h1>
                <form action="#" method="post" onclick="return validate()">
                    <div class="control">
                        <label for="name">Patient ID</label>
                        <input type="text" name="patientid" id="pid"><span id="error"></span>
                    </div>
                    <div class="control">
                        <label for="name">Test ID</label>
                        <input type="text" name="testid" required>
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
        <form>
            <div class="block">
                <input type="submit" value="Show All Test" name="show">
            </div>
        </form>
        <script>
            function validate(){
		var u=document.getElementById('pid').value;
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
<%
    try {

        if (request.getParameter("book") != null) {
            String pid = request.getParameter("patientid");
            String tst = request.getParameter("testid");
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
            PreparedStatement pst = conn.prepareStatement("insert into labtest_information values(?,?,?)");
            pst.setString(1, pid);
            pst.setString(2, tst);
            pst.setString(3, dte);
            
            int x = pst.executeUpdate();
            if (x > 0) {
                int amt=0;
                ResultSet rsa = stmt.executeQuery("select * from test where test_id='"+ tst +"'");
                while(rsa.next()){
                    amt = rsa.getInt(3);
                }
                
                ResultSet rst = stmt.executeQuery("select p_id from transaction_information where p_id like'" + pid +"'");
                if(rst.next()){
                        PreparedStatement pst1 = conn.prepareStatement("update transaction_information set fees=fees+"+ amt + "where p_id like'" + pid +"'");
                        pst1.executeUpdate();
                    }
                else{
                        PreparedStatement psb2 = conn.prepareStatement("insert into transaction_information values(?,?)");
                        psb2.setString(1, pid);
                        psb2.setInt(2, 0);
                        psb2.executeUpdate();
                        PreparedStatement psb3 = conn.prepareStatement("update transaction_information set fees=fees+" + amt + "where p_id like'" + pid +"'");
                        psb3.executeUpdate();
                    }
                out.print("<script>alert('Lab Test Appointment Book Successfully.')</script>");
            }
        }
         if(request.getParameter("show") != null){
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
            Statement stmt = conn.createStatement(); 
            ResultSet rs = stmt.executeQuery("select test_id, test_name from test");
            out.print("<html><body><center>");
            out.print("<table bgcolor='black' width='60%' border='1'>");
            out.print("<tr>");
                out.print("<th>"+ "TEST_ID" + "</th><th>" + "TEST_NAME" + "</th>");
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