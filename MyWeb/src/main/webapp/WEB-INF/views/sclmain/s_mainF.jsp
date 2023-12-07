<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>SCL 지도</title>

    <style>
         #category {position:absolute;top:60px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
      #category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
      #category li.on {background: #eee;}
      #category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
      #category li:last-child{margin-right:0;border-right:0;}
      #category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
      #category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
        #category li .ys {background:url(/img/YS.jpg); background-size: 100%;}       #category li .ddm {background:url(/img/DDM.png); background-size: 100%;}       #category li .jg {background:url(/img/NEW.jpg); background-size: 100%;}       #category li .sdg {background:url(/img/SDG.png); background-size: 100%;}       #category li .epg {background:url(/img/EPG.png); background-size: 100%;}       #category li .nog {background:url(/img/NEW.jpg); background-size: 100%;}
    </style>
  </head>
  <body>
    <div
      id="map"
      style="width: 100%; height: 700px"
    ></div>
    <ul id="category">
      <li
        id="YS"
        data-order="1"
      >
        <span class="category_bg ys"></span>
        용산구
      </li>
      <li
        id="DDM"
        data-order="2"
      >
        <span class="category_bg ddm"></span>
        동대문
      </li>
      <li
        id="JG"
        data-order="3"
      >
        <span class="category_bg jg"></span>
        중구
      </li>
      <li
        id="SDG"
        data-order="4"
      >
        <span class="category_bg sdg"></span>
        성동구
      </li>
      <li
        id="EPG"
        data-order="5"
      >
        <span class="category_bg epg"></span>
        은평구
      </li>
      <li
        id="NOG"
        data-order="6"
      >
        <span class="category_bg nog"></span>
        노원구
      </li>
    </ul>
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
                  <p id="snsWriter">동대문디자인플라자</p>
                  <small id="snsRegdate">서울특별시 중구 을지로 281</small>
                </div>
                <div class="content-inner">
                  <p id="snsContent"></p>
                </div>

                <div class="link-inner">
                  <input
                    type="button"
                    class="btn btn-outline-danger"
                    value="찜하기"
                    id="zzim"
                  />
                  <a href="##"><i class=""></i>댓글달기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

 
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1aef10108def276437df95d26ab8399f"
    ></script>
    <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(37.52686633, 126.9668797), // 지도의 중심좌표
          level: 7, // 지도의 확대 레벨
        };

      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

      var imageSrc =
        'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png';
      var imageSize = new kakao.maps.Size(24, 35);
      var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

      var markers = [];

      var clicked;
      // 마커가 표시될 위치입니다
      // var makerNum = [];
      document.querySelector('ul#category').onclick = (e) => {
        hideMarkers();
        console.log('카테고리 :', e.target.getAttribute('data-order'));
        let loc = e.target.getAttribute('data-order');
        fetch('/gogo/maker/' + loc)
          .then((res) => res.json())
          .then((data) => {
            console.log(data);
            console.log(data.length);
            var positions = [];
            for (let i = 0; i < data.length; i++) {
              // 마커를 생성합니다

              // console.log(data[i].xcoord);
              positions.push({
                title: data[i].NUM,
                latlng: new kakao.maps.LatLng(data[i].xcoord, data[i].ycoord),
              });

              // 마커가 지도 위에 표시되도록 설정합니다
              marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng, // 마커를 표시할 위치
                image: markerImage, // 마커 이미지
              });

              // console.log(makerNum[i].num);

              markers.push(marker);
              kakao.maps.event.addListener(marker, 'click', function () {
                // // 마커를 클릭했을 때의 처리 (여기서는 콘솔에 NUM 출력)
                console.log('Clicked Marker NUM: ' + data[i].num);
                // // 여기서 NUM을 활용하여 원하는 작업 수행 가능
                const content = data[i].facDesc;
                const src = data[i].mainImg;
                document.getElementById('snsImg').setAttribute('src', src);
                document.getElementById('snsWriter').textContent =
                  data[i].facName;
                document.getElementById('snsRegdate').textContent =
                  data[i].phne;
                document.getElementById('snsContent').innerHTML = content;
                // addMarker(mouseEvent.latLng);

                $('#snsModal').modal('show');

                //찜하기 버튼 클릭 이벤트
                document.getElementById('zzim').onclick = (e) => {
                  const id = '${login}'; //현재 로그인 중인 사용자의 아이디.
                  if (id === '') {
                    alert('로그인이 필요합니다.');
                    return;
                  }

                  // if (button.value === "찜하기♡") {
                  //     button.value = "찜하기♥";
                  // } else {
                  //     button.value = "찜하기♡";
                  // }
                  const placeName = data[i].facName;
                  console.log(data[i].facName);

                  const placeTel = data[i].phne;
                  const placeTitle = data[i].facDesc;
                  const placeNum = data[i].num;

                  // console.log('가게명: ', placeName.textContent);
                  // console.log('주소: ', placeAddr.textContent);
                  // console.log('전화번호: ', placeTel.textContent);

                  var reqObj = {
                    memberId: id.toString(),
                    num: data[i].num,
                    name: data[i].facName
                  };
					console.log(reqObj.name);
                  // fetch를 사용하여 places.place_name을 JSON 데이터로 전송
                  fetch(
                    '${pageContext.request.contextPath}/sclmain/addplace2',
                    {
                      method: 'POST', // HTTP 메서드 선택 (POST, GET 등)
                      headers: {
                        'Content-Type': 'application/json', // 데이터 타입 설정 (JSON)
                      },
                      body: JSON.stringify(reqObj), // JSON 데이터로 변환
                    }
                  )
                    .then((response) => response.text()) // 서버에서의 응답을 JSON으로 파싱
                    .then((data) => {
                      console.log('서버 응답:', data); // 서버 응답을 출력하거나 처리
                    })
                    .catch((error) => {
                      console.error('오류 발생:', error);
                    });
                  //////////////////////////////////////

                  console.log('addplace 함수가 호출되었습니다.');
                  // 다른 작업을 수행할 수 있습니다.
                };
              });
            }
          });
        function setMarkers(map) {
          for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
          }
        }
        function hideMarkers() {
          setMarkers(null);
        }

        function displayInfowindow(marker, title) {
          var content =
            '<div style="padding:5px;z-index:1;">' + title + '</div>';

          infowindow.setContent(content);
          infowindow.open(map, marker);
        }

        // 검색결과 목록의 자식 Element를 제거하는 함수입니다
        function removeAllChildNods(el) {
          while (el.hasChildNodes()) {
            el.removeChild(el.lastChild);
          }
        }

        function searchRest(param) {
          ps.keywordSearch(param, placesSearchCB);
          document.getElementById('keyword').value = param;
        }

        // kakao.maps.event.addListener(marker, 'click', function() {
        //   // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
        //   fetch('/gogo/content/'+NUM)
        //   .then(res => res.json)
        //   .then((data)=>{

        //   })

        // 	$('#snsModal').modal('show');
        // });
      };

      // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
      // marker.setMap(null);
    </script>
  </body>
</html>
