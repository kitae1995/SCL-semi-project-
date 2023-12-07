<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0"
    />
    <title>Document</title>
  </head>
  <body>
    <section>
      <div class="container-fluid">
        <div class="row">
          <!--lg에서 9그리드, xs에서 전체그리드-->
          <div class="col-lg-9 col-xs-12 board-table">
            <div class="titlebox">
              <p>찜목록</p>
            </div>
            <hr />

            <!--form select를 가져온다 -->

            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>이름</th>
                  <th>번호</th>
                  <th>날짜</th>
                  <th>찜 취소</th>
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
                        id="openModal"
                        data-num="${vo.num}"
                        >${vo.name}</a
                      >
                    </td>
                    <td>${vo.num}</td>
                    <td>${vo.regdate}</td>
                    <td>
                      <a
                        href="${pageContext.request.contextPath}/sclmain/delete?bno=${vo.bno}"
                        >찜 삭제</a
                      >
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>

            <!--페이지 네이션을 가져옴-->
            <form
              action="${pageContext.request.contextPath}/sclmain/mapMypage"
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
      </div>
    </section>

    <!-- 모달 -->
    <div
      class="modal fade"
      id="snsModal"
      role="dialog"
    >
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-body row">
            <div class="modal-img col-sm-8 col-xs-6">
              <img
                src="##"
                id="snsImg"
                width="100%"
              />
            </div>
            <div class="modal-con col-sm-4 col-xs-6">
              <div class="modal-inner">
                <div class="title">
                  <p id="snsWriter"></p>
                  <small id="snsRegdate"></small>
                </div>
                <div class="content-inner">
                  <p id="snsContent"></p>
                </div>

                <div class="link-inner">
                  <input
                    type="button"
                    class="btn btn-outline-danger"
                    value="찜하기"
                  />
                  <a href="##"><i class=""></i>댓글달기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <%@ include file="/WEB-INF/views/include/footer1.jsp" %>

    <script>
   
      window.onload = function () {
        
        document.getElementById('pagination').addEventListener('click', (e) => {
          if (!e.target.matches('a')) {
            return;
          }
          e.preventDefault(); //a태그의 고유 기능 중지
          const value = e.target.dataset.pagenum;
          document.pageForm.pageNo.value = value;
          document.pageForm.submit();
        });
        const msg = '${msg}';
        if (msg === 'searchFail') {
          alert('검색 결과가 없었습니다.');
        }
      };
      const numValue = document
        .getElementById('openModal')
        .getAttribute('data-num');
      document.getElementById('openModal').onclick = () => {
        console.log(numValue);
        fetch('/gogo/content/' + numValue)
          .then((res) => res.json())
          .then((data) => {
            console.log(data);
            const content = data[0].facDesc;
            console.log(content);
            const src = data[0].mainImg;
            document.getElementById('snsImg').setAttribute('src', src);
            document.getElementById('snsWriter').textContent = data[0].facName;
            document.getElementById('snsContent').innerHTML = content;
            // addMarker(mouseEvent.latLng);

            $('#snsModal').modal('show');
          });
      };
    </script>
  </body>
</html>
