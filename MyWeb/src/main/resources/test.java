<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/include/header1.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0"
    />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/list2.css" />
  
  </head>
 

<body>
<main>
    <section class="liked-posts">
        <div class="page-title-liked">
            <div class="container-liked">
                <h3>좋아요 누른 목록</h3>
            </div>
        </div>

        <!-- liked posts 검색창 -->
        
        <!--form select를 가져온다 -->
        <form action="${pageContext.request.contextPath}/sclmain/mapMypage">
		<div class="search-wrap">
          <button type="submit" class="btn btn-info search-btn">검색</button>
          <input type="text" name="keyword" class="form-control search-input" value="${pc.page.keyword}">
          <select name="condition" class="form-control search-select">
               <option value="title" ${pc.page.condition == 'name' ? 'selected' : ''}>가게</option>
               <option value="content" ${pc.page.condition == 'address' ? 'selected' : ''}>주소</option>
               <option value="writer" ${pc.page.condition == 'phone' ? 'selected' : ''}>번호</option>  
          </select>
       </div>
		   </form>

        <!-- liked posts 리스트 영역 -->
        <table class="table table-bordered">
        <thead>
            <tr>
            	<th>번호</th>
                <th>가게명</th>
                <th>주소</th>
                <th>번호</th>
                <th>날짜</th>
                <th>찜 취소</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="vo" items="${boardList}">
                <tr>
                	<td>${vo.bno}</td>
                    <td>${vo.name}</td>
                    <td>${vo.address}</td>
                    <td>${vo.phone}</td>
                    <td>${vo.regdate}</td>
                    <td><a href="${pageContext.request.contextPath}/sclmain/delete?bno=${vo.bno}">찜 삭제</a></td>
                </tr>
            </c:forEach>
        </tbody>
        
    </table>
    <form action="${pageContext.request.contextPath}/sclmain/mapMypage" name="pageForm">
    <div class="text-center">
        <hr>
        <ul id="pagination" class="pagination pagination-sm">
            <c:if test="${pc.prev}">
                <li><a href="#" data-pagenum="${pc.begin-1}">이전</a></li>
            </c:if>
            
            <c:forEach var="num" begin="${pc.begin}" end="${pc.end}">               
                <li class="${pc.page.pageNo == num ? 'active' : ''}"><a href="#" data-pagenum="${num}">${num}</a></li>
            </c:forEach>
            
            <c:if test="${pc.next}">
                <li><a href="#" data-pagenum="${pc.end+1}">다음</a></li>
            </c:if>
        </ul>
        
    </div>

    <input type="hidden" name="pageNo" value="${pc.page.pageNo}">
    <input type="hidden" name="amount" value="${pc.page.amount}">
    <input type="hidden" name="keyword" value="${pc.page.keyword}">
    <input type="hidden" name="condition" value="${pc.page.condition}">

</form>
    </section>
</main>
</body>
<script>
window.onload = function() {

    //사용자가 페이지 관련 버튼을 클릭했을 때 (이전, 다음, 1, 2, 3....)
    //a태그의 href에다가 각각 다른 url을 작성해서 요청을 보내기가 귀찮다.
    //클릭한 버튼이 무엇인지를 확인해서 그 버튼에 맞는 페이지 정보를
    //자바스크립트로 끌고 와서 요청을 보내 주겠다.
    document.getElementById('pagination').addEventListener('click', e => {
        if(!e.target.matches('a')) {
            return;
        }

        e.preventDefault(); //a태그의 고유 기능 중지

        //현재 이벤트가 발생한 요소(버튼)의
        //data-pagenum의 값을 얻어서 변수에 저장.
        //data- 으로 시작하는 속성값을 dataset 프로퍼티로 쉽게 끌고 올 수 있습니다.
        const value = e.target.dataset.pagenum;

        //페이지 버튼들을 감싸고 있는 form태그를 지목하여
        //그 안에 숨겨져 있는 input태그의 value에
        //위에서 얻은 data-pagenum의 값을 삽입한 후 submit
        document.pageForm.pageNo.value = value;
        document.pageForm.submit();

    });

    const msg = '${msg}';
    if(msg === 'searchFail') {
        alert('검색 결과가 없었습니다.');
    }
    
    

 



}
</script>
<%@ include file="/WEB-INF/views/include/footer1.jsp" %>
</body>
</html>
