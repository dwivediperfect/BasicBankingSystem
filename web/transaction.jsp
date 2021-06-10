<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body style="background: url(image/view.jpg);background-size: cover;background-attachment: fixed">
        <%@include file="./Master/header.jsp" %>
        <div class="container">
            <div class="row"><center><p style="color:#4a148c;font-size: 45px;text-align: center;font-family: serif;margin-top: 10px;font-weight: bold;"><u>View All Transactions</u> :</p></center></div>
            <div class="row">
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/banking","root","1420");
                    String q="select * from transaction";
                    Statement stmt=con.createStatement();
                    ResultSet set=stmt.executeQuery(q);
                 %>   
                    
                  
                    <table class="responsive-table striped" style="border: 1px solid;box-shadow:10px 10px gray">
                        <thead>
                            <tr style="background: #8e24aa;color: white;font-weight:bold">
                                <td>Trans. Id.</td>
                                <td>Sender</td>
                                <td>Receiver</td>
                                <td>Amount</td>
                                <td>Date</td>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            while(set.next())
                            {
                            %>
                                <tr style="font-size: 18px;font-family:cursive;color:#4a148c ">
                                    <td> <%=set.getInt("id")%>.</td>
                                    <td> <%=set.getString("sender")%></td>
                                    <td> <%=set.getString("receiver")%></td>
                                    <td> <%=set.getString("amount")%></td>
                                    <td> <%=set.getString("date")%></td>
                                </tr>
                             <%
                            }
                         %>
                        </tbody>
                    </table>
                       
                
            </div>
        </div>
        
        
    </body>
</html>
