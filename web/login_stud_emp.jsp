<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager,java.sql.*"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Message.RecipientType"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Patient</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            h1{
                text-transform: uppercase;
                font-size: 2em;
                text-align: center;
                margin-bottom: 2em;
            }
            .control input{
                width: 100%;
                display: block;
                padding: 10px;
                color: #222;
                border: none;
                outline: none;
                margin: 1em 0;
            }
            .control input[type="submit"]{
                background: red;
                color: #000;
                text-transform: uppercase;
                font-size: 1.5em;
                opacity: .7;
                transition: opacity .3s ease;
                font-weight : 600;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1> Patient Login </h1>
            <form action="login_emp" method="POST" onclick="return validate()">
                <div class="control">
                    <label for="name"> Patient ID </label>
                    <input type="text" name="id1" id="id"><span id="error"></span><br>
                </div>
                <div class="control">
                    <label for="password"> Password </label>
                    <input type="password" name="psw" id="pass"><span id="error1"></span><br>
                </div>

                <div class="control">
                    <input type="submit" value="Login" name="btnlogin">
                </div>
               
            </form>
             <div class="forgot">
                    <a href="fpass.jsp"><font color="red">Forgot Password</font></a>
             </div>
        </div>
        <script>
    function validate()
    {
        var id=document.getElementById('id').value;
        var idregx=/[E+S]/;
        var idres=idregx.test(id);
                
//        var pass=document.getElementById('pass').value;
//        var dpass=/(?=.\d)(?=.[a-z])(?=.*[A-Z]).{8,}/;
//        var ddpass=dpass.test(pass);
        if(idres === false)
        {
                document.getElementById('error').style.color='red';
                document.getElementById('error').innerHTML='Please enter valid Patient Id';
                return false;
        }
        
//                if(ddpass === false)
//                {
//                    document.getElementById('error1').style.color='red';
//                    document.getElementById('error1').innerHTML='Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters';
//                    return false;
//                }
        document.getElementById('error').style.color='none';
        document.getElementById('error').innerHTML="";
        return true;
    }
        </script>
    </body>
    
</html>
<%
    try
    {
       if(request.getParameter("btn")!=null)
       {
           String bid=request.getParameter("id1");
//     String bid="S1";
//    int rid=Integer.parseInt(request.getParameter("rid"));
    Class.forName("org.apache.derby.jdbc.ClientDriver");
//    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/BloodDrive");
//    Statement stmt=conn.createStatement();
//    ResultSet rs=stmt.executeQuery("select email from requester where req_id="+rid+" ");
    
//    if(rs.next())
//        emailto=rs.getString(1);
//    rs=stmt.executeQuery("select email,password from bloodbank where bloodbank_id="+bid+" ");
    String emailfrom="arogyabv@gmail.com";
    String pass1="arogyamandir2021";
    String pass="";
    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
    String query = "select S_EMAIL,password from STUDENT_INFORMATION,authentication where S_ID=id and S_ID IN (select id from authentication where id like '" + bid + "')";
    PreparedStatement pst = conn.prepareStatement(query); 
    ResultSet rst = pst.executeQuery();
    String emailto="";
    if(rst.next())
    {
        emailto=rst.getString(1);
        pass=rst.getString(2);
    }
     Properties props = new Properties();
     props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.user", emailfrom);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.socketFactory.port", 465);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "true"); 
                   
                Session session1 = Session.getDefaultInstance(props, null);
                session1.setDebug(true);
                MimeMessage message = new MimeMessage(session1);
                message.setText("Your forgot password request has been accepted. Password  : "+pass );
                message.setSubject("Password Recovery ");
                message.setFrom(new InternetAddress( emailfrom));
                message.addRecipient( RecipientType.TO, new InternetAddress( emailto));
                message.saveChanges();
                Transport transport = session1.getTransport("smtp");
                transport.connect("smtp.gmail.com", emailfrom, pass1);
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
                out.println("Your password mailed to you");  
       }
    }
    catch(Exception e)
    {
        
    }
   
%>