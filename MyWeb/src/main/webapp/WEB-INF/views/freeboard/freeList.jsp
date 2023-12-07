<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>

<!DOCTYPE html>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
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
      href="${pageContext.request.contextPath}/css/freeList.css"
    />
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
                    class="board-title"
                  >
                    제목
                  </th>
                  <th
                    scope="col"
                    class="th-date"
                  >
                    작성자
                  </th>
                  <th
                    scope="col"
                    class="th-num"
                  >
                    등록일
                  </th>
                </tr>
              </thead>
              <tbody>
                <c:forEach
                  var="vo"
                  items="${boardList}"
                >
                  <tr>
                    <td>${vo.bno}</td>
                    <td>
                      <a
                        href="${pageContext.request.contextPath}/freeboard/content?bno=${vo.bno}&pageNo=${pc.page.pageNo}&amount=${pc.page.amount}&keyword=${pc.page.keyword}&condition=${pc.page.condition}"
                        style="color: white !important"
                        >${vo.title}</a
                      >
                    </td>
                    <td>${vo.writer}</td>
                    <td>${vo.date}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
            <form
              action="${pageContext.request.contextPath}/freeboard/freeList"
              name="pageForm"
            >
              <div class="text-center">
                <hr />
                <ul
                  id="pagination"
                  class="pagination pagination-sm"
                >
                  <c:if test="${pc.prev}">
                    <li>
                      <a
                        href="#"
                        data-pagenum="${pc.begin-1}"
                        >이전</a
                      >
                    </li>
                  </c:if>

                  <c:forEach
                    var="num"
                    begin="${pc.begin}"
                    end="${pc.end}"
                  >
                    <li class="${pc.page.pageNo == num ? 'active' : ''}">
                      <a
                        href="#"
                        data-pagenum="${num}"
                        >${num}</a
                      >
                    </li>
                  </c:forEach>

                  <c:if test="${pc.next}">
                    <li>
                      <a
                        href="#"
                        data-pagenum="${pc.end+1}"
                        >다음</a
                      >
                    </li>
                  </c:if>
                </ul>
                <button
                  type="button"
                  class="btn btn-info"
                  onclick="location.href='${pageContext.request.contextPath}/freeboard/freeRegist'"
                >
                  글쓰기
                </button>
              </div>

              <input
                type="hidden"
                name="pageNo"
                value="${pc.page.pageNo}"
              />
              <input
                type="hidden"
                name="amount"
                value="${pc.page.amount}"
              />
              <input
                type="hidden"
                name="keyword"
                value="${pc.page.keyword}"
              />
              <input
                type="hidden"
                name="condition"
                value="${pc.page.condition}"
              />
            </form>
          </div>
        </div>
      </section>
    </main>
    <script>
      window.onload = function () {
        //사용자가 페이지 관련 버튼을 클릭했을 때 (이전, 다음, 1, 2, 3....)
        //a태그의 href에다가 각각 다른 url을 작성해서 요청을 보내기가 귀찮다.
        //클릭한 버튼이 무엇인지를 확인해서 그 버튼에 맞는 페이지 정보를
        //자바스크립트로 끌고 와서 요청을 보내 주겠다.
        document.getElementById('pagination').addEventListener('click', (e) => {
          if (!e.target.matches('a')) {
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
        if (msg === 'searchFail') {
          alert('검색 결과가 없었습니다.');
        }
      };
    </script>
  </body>
  
</html>
