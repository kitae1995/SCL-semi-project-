<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">

</head>
<body>
<form id="wholebody">
      <!-- body 시작 -->
      <div class="mypage-container">
        <h2>마이페이지</h2>
        <form>
          <div class="button-group">
            <button
              type="button"
              class="edit"
            >
              회원 정보 수정
            </button>
          </div>
          <div class="button-group">
            <button
              type="button"
              class="like"
            >
              찜 목록
            </button>
          </div>
          <div class="button-group">
            <button
              type="button"
              class="list"
            ><a href="${pageContext.request.contextPath}/freeboard/freeList">
              자유 게시판
              </a>
            </button>
          </div>
        </form>
      </div>
    </form>

</body>
</html>
<%@ include file="../include/footer1.jsp" %>