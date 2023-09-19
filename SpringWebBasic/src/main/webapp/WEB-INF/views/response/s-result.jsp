<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1 class="result-title">
	<%--<c:if test="${result == 'f-id' }">아이디가 존재하지 않습니다</c:if>
	<c:if test="${result == 'f-pw' }">비밀번호가 틀렸습니다</c:if>
	<c:if test="${result == 'success' }">로그인 성공</c:if>--%>
</h1>

<script>

	//el문도 js에서 사용가능
	
	/*
		브라우저가 html을 해석고 css룰 해석하고 javasript 코드를 실행하서
		화면에 표현하는 과정을 렌더링,
		지금 우리가 작성하는 파일 형태 -> jsp > 서버 내에서 클래스로 변환 -> 응답은 HTML
		jsp 파일이 클래스로 변환하는 과정에서 작성한 el문법은 자바 코드로 변환 -> 값을 표현
		->응답은 html로 표현.
		EL 표현식이 서버에서 먼저 평가되고 그 결과를 클라이언트에게 전달하여 브라우저로 표현하기 때문에
		Scritt 내에서도 el문법을 사용 가능함
		javascript에서도 마찬가지로 el은 ${}로 작성함.
	*/
	
	const result = '${result}';
	
	const $h1 = document.querySeletor(".result-title")
	switch(result){
	
	case 'f-id':
		$h1.textContent = '아이디가 존재하지 않습니다'
	}
	
	case 'f-pw':
		$h1.textContent = '비밀번호가 틀렸습니다'
		
	case 'success':
		$h1.text = '로그인 성공!'
		
</script>

</body>
</html>