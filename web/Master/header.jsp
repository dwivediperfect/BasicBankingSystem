
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="sigma.css">
	<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Sarala:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        
    </head>
    <body>
        <div class="container-fluid">
            <div class="nav">
                
                <nav class="navbar navbar-expand-md bg-transparent navbar-dark">
                    <div class="container-fluid">
                        <a href="#" class="navbar-brand text-warning" >Banking World</a>
                        <button class="navbar-toggler" data-toggle="collapse" data-target="#touch">
                            <span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="touch">
                            <ul class="navbar-nav text-center ml-auto" id="padd" >
                                <li class="nav-item" >
                                    <a href="home.html" class="nav-link text-white">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a href="AccountOpeningForm.jsp" class="nav-link text-white">Open Account</a>
                                </li>
                                <li class="nav-item">
                                    <a href="customers.jsp" class="nav-link text-white">View Customers</a>
                                </li>
                                <li class="nav-item">
                                    <a href="transfer.jsp" class="nav-link text-white">Transfer Money</a>
                                </li>

                                <li class="nav-item">
                                    <a href="transaction.jsp" class="nav-link text-white">Transactions</a>
                                </li>
                            </ul>
                        </div>
                </nav>
                
            </div>
        </div>
    </body>
</html>
