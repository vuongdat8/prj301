<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
        ustora by freshdesignweb.com
        Twitter: https://twitter.com/freshdesignweb
        URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Clothes Shop</title>

        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <style>
            label{color: black;}
        </style>
    </head>
    <body>


        <jsp:include page="header.jsp"/>


        <div class="slider-area">
            <!-- Slider -->
            <div class="block-slider block-slider4">
                <h1 style="text-align: center;">Assignment Name: ${a.name}</h1>
                <h1 style="text-align: center;">Due date: ${a.duedate}</h1>
                <h1 style="text-align: center;">Note: ${a.description}</h1>
            </div>
            <!-- ./Slider -->
        </div> <!-- End slider area -->

        <div class="promo-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <form method="post" action="SubmitAssignment" enctype="multipart/form-data">
                            <label>Comment:</label>
                            <input name="cmt" class="form-control" value="${sa.cmt}" type="text">
                            <input name="aid" class="form-control" type="hidden" value="${param.aid}">                  
                            <input name="said" class="form-control" type="hidden" value="${sa.id}">     
                            <c:if test="${sa!=null}">
                                <label>Submitted Solution: </label>
                                <a href="./SubmitAssignment/${sa.linkSource}" download>${sa.linkSource}</a>
                            </c:if>
                            <label>Submit File: </label>
                            <input name="file" class="form-control" value="${sa.linkSource}" type="file"> 
                            <c:if test="${sa==null}">
                                <input value="add" name="action" type="submit" class="btn btn-primary" style="margin: 10px;"  />
                            </c:if>
                            <c:if test="${sa!=null}">
                                <div style="padding: 10px; display: flex; justify-content: space-between;width: 100%">
                                      <input value="delete" name="action" type="submit" class="btn btn-danger" style="margin: 10px;"  />
                                      <input value="edit" name="action" type="submit" class="btn btn-primary" style="margin: 10px;"  />
                                </div>
                            </c:if>
                        </form>
                    </div>
                    <div class="col-md-4"></div>
                </div>
            </div>
        </div> <!-- End promo area -->

        <jsp:include page="footer.jsp"/>
        <!-- Latest jQuery form server -->
        <script src="https://code.jquery.com/jquery.min.js"></script>

        <!-- Bootstrap JS form CDN -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <!-- jQuery sticky menu -->
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.sticky.js"></script>

        <!-- jQuery easing -->
        <script src="js/jquery.easing.1.3.min.js"></script>

        <!-- Main Script -->
        <script src="js/main.js"></script>

        <!-- Slider -->
        <script type="text/javascript" src="js/bxslider.min.js"></script>
        <script type="text/javascript" src="js/script.slider.js"></script>
    </body>
</html>