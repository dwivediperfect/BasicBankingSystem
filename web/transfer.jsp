
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body style="background: url(image/trans.jpg);background-size: cover;background-attachment: fixed">
        <%@include file="./Master/header.jsp" %>
        <div class="container">
           
            <div class="row">
                <div class="col m5 offset-m4">
                    <div class="card" style="box-shadow: 8px 8px whitesmoke;margin-top: 50px;background: gray">
                        <div class="card-content">
                            <h2 style="font-family:sans;color:maroon;margin-top: 10px;font-size: 40px">Transfer Money </h2>
                            <h4 id="msg"></h4>
                            <div class="form right-align">
                            <form action="transfermoney" method="get" id="myform">
                                <input type="text" name="sender" placeholder="Enter Sender Account Number">
                                <input type="text" name="receiver" placeholder="Enter Receiver Account Number">
                                <input type="text" name="creceiver" placeholder="Confirm Receiver Account Number">
                                <input type="text" name="amount" placeholder="Enter Ammount">
                                
                                <button type="submit" name="submit" style="margin-top: 10px;" class="btn red accent-4">Transfer</button>
                            </form>
                            </div>
                            <div class="loader center-align" style="margin-top: 10px;display: none">
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-red">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-yellow">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-green">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                <h4>please wait..</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col m3"></div>
            </div>
        </div>
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous">
        </script>

        <script>
            $(document).ready(function(){
                console.log("dcument is ready")
          
                $("#myform").on("submit",function(event){
                    event.preventDefault();
              
                    var f=$(this).serialize();
              
                    //console.log(f);
              
                    $(".loader").show();
                    $(".form").hide();
                
                    $.ajax({
                        url:"transfermoney",
                        data:f,
                        type:'GET',
                        success: function(data,textStatus,jqXHR){
                            //console.log(data);
                            console.log("success.........");
                            $(".loader").hide();
                            $(".form").show();
                            if(data.trim()==="done")
                            {
                                $("#msg").html("Transaction done Successfully!!")
                                $("#msg").addClass('green-text')
                            }else{
                                 $("#msg").html("Something went wrong on server...")
                                 $("#msg").addClass('red-text')
                            }
                        },
                        error:function(jqXHR,textStatus,errorThrown){
                            console.log(data);
                            console.log("error.........");
                            $(".loader").hide();
                            $(".form").show();
                            $("#msg").html("Something went wrong on server..")
                            $("#msg").addClass('red-text')
                        },
                        processData:false,
                        contentType:false
                    })
                })
            })
        </script>
    </body>
</html>
