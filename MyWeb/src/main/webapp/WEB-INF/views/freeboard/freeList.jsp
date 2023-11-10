<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
      href="${pageContext.request.contextPath}/css/freeList.css" />
  
  </head>
 

  <body>
 	 <main>
	    <section class="notice">
	      <div class="page-title">
	        <div class="container">
	          <h3>게시판</h3>
	        </div>
	      </div>
	
	      <!-- board 검색창 -->
	      <div id="board-search">
	        <div class="container">
	          <div class="search-window">
	            <form action="">
	              <div class="search-wrap">
	                <label
	                  for="search"
	                  class="blind"
	                ></label>
	                <input
	                  id="search"
	                  type="search"
	                  name=""
	                  placeholder="검색어를 입력해주세요."
	                  value=""
	                />
	                <button
	                  type="submit"
	                  class="btn btn-dark"
	                >
	                  검색
	                </button>
	                <select class="choice">
	                  <option>제목</option>
	                  <option>내용</option>
	                  <option>작성자</option>
	                  <option>제목+내용</option>
	                </select>
	              </div>
	            </form>
	          </div>
	        </div>
	      </div>
	
	      <!-- board 리스트 영역 -->
	      <div id="board-list">
	        <div class="container">
	          <table class="board-table">
	            <thead>
	              <tr>
	                <th
	                  scope="col"
	                  class="th-num"
	                >
	                  번호
	                </th>
	                <th
	                  scope="col"
	                  class="th-title"
	                >
	                  제목
	                </th>
	                <th
	                  scope="col"
	                  class="th-date"
	                >
	                  등록일
	                </th>
	              </tr>
	            </thead>
	            <tbody>
	              <tr>
	                <td>5</td>
	                <th>
	                  <a href="#!"></a>
	                  <p>테스트</p>
	                </th>
	                <td></td>
	              </tr>
	
	              <tr>
	                <td>4</td>
	                <th><a href="#!"></a></th>
	                <td></td>
	              </tr>
	
	              <tr>
	                <td>3</td>
	                <th><a href="#!"></a></th>
	                <td></td>
	              </tr>
	              <tr>
	                <td>2</td>
	                <th><a href="#!"></a></th>
	                <td></td>
	              </tr>
	              <tr>
	                <td>1</td>
	                <th><a href="#!"></a></th>
	                <td></td>
	              </tr>
	          	  </tbody>
	        	  </table>
        		</div>
      		</div>
    	</section>
    </main>
  </body>
</html>
<%@ include file="/WEB-INF/views/include/header1.jsp" %>