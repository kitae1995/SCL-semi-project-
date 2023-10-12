<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-9 write-wrap">
                        <div class="titlebox">
                            <p>수정하기</p>
                        </div>
                        
                        <form action="/myweb/freeboard/modify" method="post" name="updateForm">
                          
                            <div class="form-group">
                                <label>번호</label>
                                <input class="form-control" name="bno" value="${article.bno }" readonly>
                            </div>
                            <div class="form-group">
                                <label>작성자</label>
                                <input class="form-control" name="writer" value="${article.writer }" readonly>
                            </div>    
                            <div class="form-group">
                                <label>제목</label>
                                <input class="form-control" name="title" value="${article.title }">
                            </div>

                            <div class="form-group">
                                <label>내용</label>
                                <textarea class="form-control" rows="10" name="content" value="${article.content }"></textarea>
                            </div>

                            <button id="list-btn" type="button" class="btn btn-dark">목록</button>    
                            <button id="update-btn" type="button" class="btn btn-primary">변경</button>
                            <button id="del-btn" type="button" class="btn btn-info">삭제</button>
                    </form>
                                    
                </div>
            </div>
        </div>
        </section>
        
        <%@ include file="../include/footer.jsp" %>

        <script>
            //목록 이동 처리
            document.getElementById('list-btn').onclick = function(){
                location.href='/myweb/freeboard/freeList';
            }

            //form 태그는 메서드없이 form태그의 name으로 요소를 바로 취득할 수 있습니다.
            const $form = document.updateform;

            //수정 버튼 이벤트
            document.getElementById('update-btn').oncllick = function(){
                //form 내부의 요소를 지목할땐 name 속성으로 바로 지목이 가능합니다.
                if($form.title.value === ''){
                    alert('제목은 필수 항목입니다.');
                    return; // 이벤트 바로 종료
                } else if($form.content.value === ''){
                    alert('내용 작성은 필수입니다.');
                    return;
                }

                //문제가 없다면 form을 submit (버튼에 submit 속성 안정해줘도 가능함)
                $form.submit();
            }

            //삭제 버튼 이벤트 처리
            document.getElementById('del-btn').onclick = function(){
                if(confirm('정말 삭제하시겠습니까?')){ // confirm을 쓰면 확인,취소 버튼이 나옴
                    $form.setAttribute('action','/myweb/freeboard/delete');
                    $form.submit();
                }
            }

        </script>
      