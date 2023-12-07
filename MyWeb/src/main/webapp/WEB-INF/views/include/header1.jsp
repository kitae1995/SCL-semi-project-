<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서울시 문화공간 소개</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/styles.css">
    <script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
</head>
<body>
    <!-- Header -->
    <form id="head" style="  position: fixed; width: 100%;">
    <header>
        <!-- header 왼쪽 로고랑 메뉴들 -->
        <nav class="header-nav">
            <div class="logo">
                <a href="#"><img src="${pageContext.request.contextPath}/img/smail.png" alt="로고">gogo Seoul</a>
            </div>
            <ul class="nav-links">
                <li><a href="#">Main</a></li>
                <li><a href="#">Review</a></li>
                <li><a href="#">FAQ</a></li>
            </ul>
        </nav>

        <!-- header 오른쪽 사이드바 메뉴 -->
        <div class="menu-button">
            <div class="bar bar-1"></div>
            <div class="bar bar-2"></div>
            <div class="bar bar-3"></div>
        </div>

        <div class="dropdown-menu">
            <ul>
                <li><a href="${pageContext.request.contextPath}/user/userLogin"><img src="${pageContext.request.contextPath}/img/login-icon.png" alt="로그인">Login</a></li>
                <li><a href="${pageContext.request.contextPath}/user/myPage"><img src="${pageContext.request.contextPath}/img/mypage-icon.png" alt="마이페이지">MyPage</a></li>
            </ul>
        </div>
        <!-- header 오른쪽 사이드바 메뉴 끝 -->
    </header>
    </form>
    
     <script>
         document.addEventListener('DOMContentLoaded', function () {
    const menuButton = document.querySelector('.menu-button');

    menuButton.addEventListener('click', function () {
      menuButton.classList.toggle('active');
    });
  });
   </script>  
</body>
</html>