<%-- 
    Document   : signup
    Created on : 31 May, 2021, 1:44:19 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
        <title>JSP Page</title>
    </head>
    <body style="background: url(image/img2.jpg);background-size: cover;background-attachment: fixed">
        <%@include file="./Master/header.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col m3"></div>
                <div class="col m3">
                    <div class="card" style="box-shadow: 15px 15px grey">
                        <div class="card-content">
                            <h3 style="font-family: red serifs;"  class:teal darken-4;margin-top: 10px;">Open Your Account !!</h3>
                            <h5 id="msg"></h5>
                            <div class="form center-align">
                                
                                <!--creating form-->
                                <form action="AccountOpening" id="myform" mothod="post">
                                   
                                <input type="text" name="name" placeholder="Enter your name">
                                <input type="text" name="user_name" placeholder="Create your AccountNumber">
                                <input type="email" name="user_email" placeholder="Enter your email">
                                <input type="password" name="user_password" placeholder="Create your password">
                                <input type="password" name="user_cpassword" placeholder="Confirm password">
                                <input type="text" name="user_mobile" placeholder="Enter your mobile number">
                                <input type="text" name="user_pin" placeholder="Enter Amount">
                                    <div class="file-field input-field">
                                        <div class="btn green">
                                            <span>Upload Image</span>
                                            <input type="file" name="image">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>
                                    </div>
                                    <button style="margin-top: 10px;" class="btn red accent-4" type="reset">reset</button>
                                    <button style="margin-top: 10px;" class="btn red accent-4" type="submit">register</button>
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
          console.log("dcument.is ")
          
          $("#myform").on("submit",function(event){
              event.preventDefault();
              
              let f=new FormData(this);
              
              console.log(f);
              
              $(".loader").show();
              $(".form").hide();
                
              $.ajax({
                  url:"AccountOpening",
                  data:f,
                  type:'POST',
                  success: function(data,textStatus,jqXHR){
                      console.log(data);
                      console.log("success.........");
                      $(".loader").hide();
                      $(".form").show();
                      if(data.trim()==="done")
                      {
                          $("#msg").html("Successfully Rrgistered!!")
                          $("#msg").addClass('green-text')
                      }else{
                           $("#msg").html("Upload your profile Photo...")
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
