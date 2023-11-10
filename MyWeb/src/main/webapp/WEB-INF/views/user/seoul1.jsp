<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>


<%@ include file="/WEB-INF/views/include/header1.jsp" %>

<link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/seoul1.css" />
  <body>
    <!-- Main Content -->
    <main class="main-content">
      <h1>서울시 문화공간 소개</h1>
      <p>서울의 다양한 문화공간을 탐험하고 소개합니다.</p>
      <button class="explore-button">
        <a href="${pageContext.request.contextPath}/user/userLogin">나와 같이 로그인 하러 가지 않을래?</a>
      </button>
    </main>
  </body>

<%@ include file="/WEB-INF/views/include/footer1.jsp" %>
