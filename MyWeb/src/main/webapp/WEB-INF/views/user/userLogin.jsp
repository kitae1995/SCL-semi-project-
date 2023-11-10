<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
     <%@ include file="/WEB-INF/views/include/header1.jsp" %>


    
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/login.css" />
    
  
  
  <body>
  <form id="allbody" method="post" name="loginForm">
    <!-- body 시작 -->
    <div class="login-container">
      <h2>로그인</h2>
      
        <div class="form-group">
          <label for="username"> User ID</label>
          <input
            type="text"
            id="username"
            name="userId"
            required
          />
        </div>
        <div class="form-group">
          <label for="password"> Password</label>
          <input
            type="password"
            id="password"
            name="userPw"
            required
          />
        </div>
        <button
          type="button"
          id="loginBtn"
          class="login-button"
        >
          로그인
          
        </button>
      
      <p class="register-link">
        계정이 없으신가요? <a href="${pageContext.request.contextPath}/user/userJoin">회원 가입</a>
      </p>
    </div>
    </form>
    
    <script>
  //회원 가입 완료 후 addFlashAttribute로 msg라는 이름의 데이터가 전달됐는지 확인
	const msg = '${msg}';
	if(msg === 'joinSuccess') {
		alert('회원 가입을 환영합니다!');
	} else if(msg === 'loginFail') {
		alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인하세요.');
	}

    //id, pw 입력란이 공백인 지 아닌지 확인한 후, 공백이 아니라면 submit을 진행하세요.
    //요청 url은 /user/userLogin -> post로 갑니다. (비동기 아니에요!)
    document.getElementById('loginBtn').onclick = () => {
        if(document.loginForm.userId.value === '') {
            alert('아이디를 적어야 로그인을 하죠~');
            return;
        }
        if(document.loginForm.userPw.value === '') {
            alert('비밀번호를 작성하세요!');
            return;
        }

        document.loginForm.submit();
    }

   
    
    </script>
    
  </body>
  <%@ include file="/WEB-INF/views/include/footer1.jsp" %>




    
    
    
    
    
    
    
