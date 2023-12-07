<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>인덱스를 만들어 보자</title>

    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
</head>
<body>
	<header>
        <div class="container-fluid">
            <div class="row" style="background-color: purple !important;">
                <div class="container">
                    <div class="navbar">
                        <div class="navbar-header" >
                            <!--data-toggle 같은 것들은 내부적으로 지원하는 반응형 API기능이므로 지우면 안됩니다-->
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/img/smail2.png" alt="로고"></a>
                        </div>


                        <div class="collapse navbar-collapse" id="myNavbar" style="background-color: purple !important;">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="${pageContext.request.contextPath}/user/seoul2">Main</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/myPage">MYPAGE</a></li>
								
                                <!-- 
                                <li><a href="#">Form</a></li>
                                <li><a href="#">Board</a></li>
 				-->

                            </ul>
                            

                            <form class="navbar-form navbar-right" action="">
                                <div class="input-group">
                                  

                                       
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>