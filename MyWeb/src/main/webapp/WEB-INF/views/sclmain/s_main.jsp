<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>SCL 지도</title>
    
</head>
<body>
<div id="map" style="width:100%;height:700px;"></div>

<!-- 모달 -->-
	<div class="modal fade" id="snsModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body row">
					<div class="modal-img col-sm-8 col-xs-6">
						<img src="${pageContext.request.contextPath}/img/SCL.png" id="snsImg" width="100%">
					</div>
					<div class="modal-con col-sm-4 col-xs-6">
						<div class="modal-inner">
							<div class="profile">
								<img src="${pageContext.request.contextPath}/img/SCLP.png">
							</div>
							<div class="title">
								<p id="snsWriter">동대문디자인플라자</p>
								<small id="snsRegdate">서울특별시 중구 을지로 281</small>
							</div>
							<div class="content-inner">
								<p id="snsContent"><h5 class='tit_chapter' style='padding: 0px; 
								margin: 0px 0px 20px;' arial,='' 
								vernade,='' 돋움,='' dotum,='' noto='' kr?,='' 
								sans-serif;?='' sans=''><font color='#231f20'>
								<span style='font-size: 18px; font-weight: 300; color: rgb(0, 0, 0);'>
								DDP는 대한민국 서울특별시 동대문에 위치한 복합 문화공간입니다.&nbsp;
								</span></font></h5><h5 class='tit_chapter' style='padding: 0px; 
								margin: 0px 0px 20px;' 
								arial,='' vernade,='' 돋움,='' dotum,='' noto='' kr?,='' sans-serif;?='' sans=''>
								<font color='#231f20'>
								<span style='font-size: 18px; font-weight: 300; color: rgb(0, 0, 0);'>
								2014년 3월 21일 개관한 이래 DDP에서는 각종 전시, 패션쇼, 신제품 발표회, 포럼, 콘퍼런스 등 다양한 문화 행사가 진행되고 있습니다.&nbsp;
								</span></font></h5><h5 class='tit_chapter' style='padding: 0px; margin: 0px 0px 20px;' arial,='' vernade,='' 돋움,='' dotum,='' noto='' kr?,='' sans-serif;?='' sans=''><font color='#231f20'>
								<span style='font-size: 18px; font-weight: 300; color: rgb(0, 0, 0);'>
								DDP는 디자인 트렌드가 시작되고 문화가 교류하는 장소입니다.
								&nbsp;</span></font></h5>
								<h5 class='tit_chapter' style='padding: 0px; 
								margin: 0px 0px 20px;' arial,='' vernade,='' 돋움,='' dotum,='' noto='' kr?,='' 
								sans-serif;?='' sans=''><font color='#231f20'>
								<span style='font-size: 18px; font-weight: 300; color: rgb(0, 0, 0);'>
								또한, 세계 최초로 선보이는 신제품과 패션 트렌드를 소개하고 글로벌 전시를 통해 지식을 공유하며, 
								다양한 디자인 체험이 가능합니다.<br><br>문의전화 : 02-1452-1142</span></font></h5>
								</p>
							</div>
							<div class="link-inner">
								<a href="##"><img src="${pageContext.request.contextPath}/img/like1.png" width="20px" height="20px" />좋아요</a>	
								<a href="##"><i class="glyphicon glyphicon-share-alt"></i>댓글달기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 모달2 -->
	<div class="modal fade" id="snsModal2" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body row">
					<div class="modal-img col-sm-8 col-xs-6">
						<img src="${pageContext.request.contextPath}/img/SCL2.png" id="snsImg2" width="100%">
					</div>
					<div class="modal-con col-sm-4 col-xs-6">
						<div class="modal-inner">
							<div class="profile">
								<img src="${pageContext.request.contextPath}/img/SCLP2.png">
							</div>
							<div class="title">
								<p id="snsWriter">주한영국문화원</p>
								<small id="snsRegdate">서울특별시 중구 서소문로11길 19</small>
							</div>
							<div class="content-inner">
								<p id="snsContent"><span style='font-size: 12pt;'><br>영국문화원은 교육과 문화 교류를 위한 영국정부의 공식기관으로 
								<br>1973년 개원하였으며
								, 오피스와 어학센터를 통하여 유학상담, 영어교육, 영국에 대한 각종 정보제공, 문화교류 등 다양한 서비스와 활동을 하고 있다. 
								특히 1999년 4월 엘리자베스 2세 영국여왕에 의하여 개관한 영국 센터는 영국에 관한 정보를 제공하는 원스톱 숍으로 영국에 관한 
								일반적인 정보를 비롯하여 영국의 교육, 시험, 관광, 비즈니스 등에 관한 다양한 참고 자료와 시설을 갖추고 있다.<br>
								<br>문의 전화 : 1522-5009</span> </p>
							</div>
							<div class="link-inner">
								<a href="##"><img src="${pageContext.request.contextPath}/img/like1.png" width="20px" height="20px" />좋아요</a>	
								<a href="##"><i class="glyphicon glyphicon-share-alt"></i>댓글달기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>
<p><em>마커에 마우스 커서를 올려주세요!</em></p> 

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1aef10108def276437df95d26ab8399f"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.566813, 127.009625), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커를 표시할 위치입니다 
var position =  new kakao.maps.LatLng(37.566813, 127.009625);
var position2 =  new kakao.maps.LatLng(37.563787, 126.972089);

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
  position: position
});

var marker2 = new kakao.maps.Marker({
	  position: position2
	});


// 마커를 지도에 표시합니다.
marker.setMap(map);
marker2.setMap(map);

// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
//var iwContent = '<div style="padding:5px;">Hello World!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

// 인포윈도우를 생성합니다
//var infowindow = new kakao.maps.InfoWindow({
//    content : iwContent
//});

// 마커에 마우스오버 이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'click', function() {
  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
 	console.log('마커 눌렀다~');
	$('#snsModal').modal('show');
});

kakao.maps.event.addListener(marker2, 'click', function() {
	  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		$('#snsModal2').modal('show');
	});

// 마커에 마우스아웃 이벤트를 등록합니다
//kakao.maps.event.addListener(marker, 'mouseout', function() {
    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
    //infowindow.close();
//});
</script>
</body>
</html>