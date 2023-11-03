<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
         
    
     
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>BRACKETS 으로 시작하기</title>
    <meta name="description" content="Brackets에 대한 대화식 시작 안내서입니다.">
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/main.css"> --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
#mapwrap{position:relative;overflow:hidden;}
.category, .category *{margin:0;padding:0;color:#000;}   
.category {position:absolute;overflow:hidden;top:10px;left:10px;width:310px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
.category .ico_comm {display:block;margin:0 auto 2px;width:25px;height:26px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
.category .ico_jang {background-position:-10px 0;}  
.category .ico_kor {background-position:-10px -36px;}   
.category .ico_yang {background-position:-10px -72px;}
.category .ico_chi {background-position:-10px -108;}  
.category .ico_jan {background-position:-10px -144px;}   
.category .ico_boon {background-position:-10px -180px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
        </style>
</head>

<body>
    <div class="container">
        
        <div id="mapwrap"> 
            <!-- 지도가 표시될 div -->
            <div id="map" style="width:100%;height:700px;"></div>
            <!-- 지도 위에 표시될 마커 카테고리 -->
            <div class="category">
                <ul>
                    <li id="JangMenu" onclick="changeMarker('Jang')">
                        장애편의
                    </li>
                    <li id="KorMenu" onclick="changeMarker('Kor')">
                        한식
                    </li>
                    <li id="YangMenu" onclick="changeMarker('Yang')">
                        양식
                    </li>
                    <li id="ChaMenu" onclick="changeMarker('Cha')">
                        중식
                    </li>
                    <li id="JpMenu" onclick="changeMarker('Jp')">
                        일식
                    </li>
                    <li id="BoonMenu" onclick="changeMarker('Boon')">
                        분식
                    </li>
                </ul>
            </div>
        </div>
    </div>
    </div>
    
    <!-- 모달 -->
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
								<a href="##"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a>
								<a href="##"><i class="glyphicon glyphicon-comment"></i>댓글달기</a>
								<a href="##"><i class="glyphicon glyphicon-share-alt"></i>공유하기</a>
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
								<a href="##"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a>
								<a href="##"><i class="glyphicon glyphicon-comment"></i>댓글달기</a>
								<a href="##"><i class="glyphicon glyphicon-share-alt"></i>공유하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
        <footer class="footer">
            <div class="footer_container">
                <div class="row">
                    <div class="footer-col">
                        <h4>Company</h4>
                        <ul>
                            <li><a href="#">about us</a></li>
                            <li><a href="#">our services</a></li>
                            <li><a href="#">privacy policy</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Get help</h4>
                        <ul>
                            <li><a href="#">FAQ</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Contact Us</h4>
                        <div class="social-links">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-telegram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom">
                    <nav class="bottom-menu-bar">
                        <a href="#" class="policy">개인정보처리방침</a>
                        <a href="#" class="policy">홈페이지 이용약관</a>
                        <a href="#" class="policy">위치정보 이용약관</a>
                        <a href="#" class="policy">비회원 이용약관</a>
                        <a href="#" class="policy">윤리경영 핫라인</a>
                    </nav>
                </div>
                <div class="footer-copyright">
                    <p>Copyright &copy;2023 Logo. All Rights Reserved. </p>
                </div>
            </div>
        </footer>
    </div>

    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1aef10108def276437df95d26ab8399f"></script>
    <script> 
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(36.83947776995263, 127.1862027209088), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
            };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);
    
    var total_position=[JangPositions, KorPositions, YangPositions, ChaPositions, JpPositions, BoonPositions];

    // 장애편의 마커가 표시될 좌표 배열입니다
    var JangPositions = [ 
        {
            title:'전통차 담소',
            address_name:'동남구 각원사길 149(안서동)',
            road_address_name:'안서동 143',
            phone:'041-565-3693',
            LatLng: new kakao.maps.LatLng(36.8318914901581,127.18669325992305)
        },
        {
            title:'초당골순두부',
            address_name:'충남 천안시 동남구 각원사길 153',
            road_address_name:'안서동 145-1',
            phone:'041-556-5182',
            LatLng: new kakao.maps.LatLng(36.831945380279656,127.18680548929983)
        },
        {
            title:'초롱박가든',
            address_name:'충남 천안시 동남구 광덕면 죽계2길 5-2',
            road_address_name:'광덕리 558',
            phone:'041-568-5292',
            LatLng: new kakao.maps.LatLng(36.67185310349236,127.04645121012182)
        },
        {
            title:'천안본가장어',
            address_name:'충남 천안시 동남구 다가말4길 28',
            road_address_name:'다가동 409-5',
            phone:'041-577-1592',
            LatLng: new kakao.maps.LatLng(36.798296057996126,127.13805395967391)
        },
        {
            title:'봉평옹심이메밀칼국수 ',
            address_name:'충남 천안시 동남구 대흥로 215',
            road_address_name:'대흥동 134',
            phone:'041-577-3889',
            LatLng: new kakao.maps.LatLng(36.82329954750962,127.18372677109525)
        },
        {
            title:'달식당',
            address_name:'충남 천안시 동남구 대흥로 215',
            road_address_name:'대흥동 134',
            phone:'041-557-2266',
            LatLng: new kakao.maps.LatLng(36.82329954750962,127.18372677109525)
        },
        {
            title:'평택족발',
            address_name:'충남 천안시 동남구 망향로 45-40',
            road_address_name:'신부동 191-1',
            phone:'041-563-7060',
            LatLng: new kakao.maps.LatLng(36.82852199207124,127.16686695107605)
        },
        {
            title:'북경중화요리',
            address_name:'충남 천안시 동남구 신부1길 6',
            road_address_name:'신부동 80-8',
            phone:'041-554-1585',
            LatLng: new kakao.maps.LatLng(36.81420119392472,127.15925975569812)
        },
        {
            title:'능수정',
            address_name:'충남 천안시 동남구 청수4로 8',
            road_address_name:'청당동 535',
            phone:'041-520-6392',
            LatLng: new kakao.maps.LatLng(36.78243272478796,127.15289811823378)
        },
        {
            title:'이고집만두',
            address_name:'충남 천안시 동남구 태조산길 258',
            road_address_name:'유량동 8-3',
            phone:'041-567-2027',
            LatLng: new kakao.maps.LatLng(36.82052075918559,127.18818994932457)
        },
        {
            title:'두목고기',
            address_name:'충남 천안시 서북구 불당5길 15',
            road_address_name:'불당동 1170',
            phone:'041-565-9293',
            LatLng: new kakao.maps.LatLng(36.8027630839144,127.10924566333655)
        },
        {
            title:'박종식스시',
            address_name:'충남 천안시 서북구 미라7길 13 107호',
            road_address_name:'쌍용동 1115',
            phone:'010-8545-4782',
            LatLng: new kakao.maps.LatLng(36.802696042533654,127.12936632206842)
        },
        {
            title:'봉평장터',
            address_name:'충남 천안시 동남구 향교1길 140',
            road_address_name:'유량동 397-1',
            phone:'041-556-6272',
            LatLng: new kakao.maps.LatLng(36.81251609934809,127.17095638649369)
        },
        {
            title:'소사벌소한마리',
            address_name:'충남 천안시 서북구 성정두정로 14 2층',
            road_address_name:'성정동 1453',
            phone:'0507-1400-3395',
            LatLng: new kakao.maps.LatLng(36.82682137384658,127.14131547632553)
        }
    ];

    // 한식 마커가 표시될 좌표 배열입니다
    var KorPositions = [
        {
            title:'한신우동 백석대점',
            address_name:'충남 천안시 동남구 문암4길 10-13',
            road_address_name:'안서동 379-26',
            phone:'041-551-3353',
            LatLng: new kakao.maps.LatLng(36.84149901214754,127.1809091902998)
        },
        {
            title:'서울뚝배기',
            address_name:'충남 천안시 동남구 문암로 90',
            road_address_name:'안서동 406',
            phone:'041-569-3004',
            LatLng: new kakao.maps.LatLng(36.842130927153434,127.18252062578651)
        },
        {
            title:'큰맘할매순대국 천안백석대점',
            address_name:'충남 천안시 동남구 문암로 69',
            road_address_name:'안서동 386',
            phone:'041-562-2244',
            LatLng: new kakao.maps.LatLng(36.84117112017317,127.18083666634271)
        },
        {
            title:'동궁찜닭 백석대점',
            address_name:'충남 천안시 동남구 문암로 69',
            road_address_name:'안서동 386',
            phone:'041-522-4589',
            LatLng: new kakao.maps.LatLng(36.841045218152175,127.1806704445635)
        },
        {
            title:'쪼다쪼림닭',
            address_name:'충남 천안시 동남구 문암로 74-4',
            road_address_name:'안서동 384',
            phone:'041-522-4589',
            LatLng: new kakao.maps.LatLng(36.8408135187273,127.18133808334566)
        },
        {
            title:'이모네식당',
            address_name:'충남 천안시 동남구 문암로 72',
            road_address_name:'안서동 385-13',
            phone:'041-622-2111',
            LatLng: new kakao.maps.LatLng(36.84108406814128,127.18119521905236)
        },
        {
            title:'오래오래',
            address_name:'충남 천안시 동남구 문암2길 10-11',
            road_address_name:'안서동 335-1',
            phone:'041-557-3363',
            LatLng: new kakao.maps.LatLng(36.8381769913777,127.17768612189838)
        }
    ];

    // 양식 마커가 표시될 좌표 배열입니다
    var YangPositions = [
        {
            title:'타임즈핫도그 천안백석대점',
            address_name:'충남 천안시 동남구 문암로 68-4 1, 2층',
            road_address_name:'안서동 384-1',
            phone:'0507-1337-0846',
            LatLng: new kakao.maps.LatLng(36.84055807728798,127.18102805387318)
        },
        {
            title:'샐러핏',
            address_name:'충남 천안시 동남구 문암로 43 1동',
            road_address_name:'안서동 350-6',
            phone:'041-522-8333',
            LatLng: new kakao.maps.LatLng(36.83966792724263,127.17855057351002)
        },
        {
            title:'맘스터치 천안백석대점',
            address_name:'충남 천안시 동남구 문암로 74-4',
            road_address_name:'안서동 384',
            phone:'041-568-9288',
            LatLng: new kakao.maps.LatLng(36.8408135187273,127.18133808334566)
        },
        {
            title:'이삭토스트 천안백석대점',
            address_name:'충남 천안시 동남구 문암로 70 ',
            road_address_name:'안서동 385-4',
            phone:'041-523-2322',
            LatLng: new kakao.maps.LatLng(36.84077432813851,127.1810375324759)
        },
        {
            title:'썬오브비앤피',
            address_name:'충남 천안시 동남구 문암로 80',
            road_address_name:'안서동 382',
            phone:'041-566-2226',
            LatLng: new kakao.maps.LatLng(36.8415733090999,127.1818242031995)
        }
    ];

    // 중식 마커가 표시될 좌표 배열입니다
    var ChaPositions = [
    {
            title:'춘리마라캉 백석대점',
            address_name:'충남 천안시 동남구 문암로 80 101 호',
            road_address_name:'안서동 382',
            phone:'041-415-2116',
            LatLng: new kakao.maps.LatLng(36.8415733090999,127.1818242031995)
        },
        {
            title:'짜우',
            address_name:'충남 천안시 동남구 문암로 63 1층',
            road_address_name:'안서동 371-21',
            phone:'041-552-0401',
            LatLng: new kakao.maps.LatLng(36.84062055139819,127.18023893899606)
        },
        {
            title:'이런이궈 백석대점',
            address_name:'충남 천안시 동남구 문암4길 10-18 3층',
            road_address_name:'안서동 379-37',
            phone:'0507-1388-8775',
            LatLng: new kakao.maps.LatLng(36.84132597326501,127.18092672065013)
        }
    ];

    // 일식 마커가 표시될 좌표 배열입니다
    var JpPositions = [
    {
            title:'자라쿠라멘',
            address_name:'충남 천안시 동남구 문암로 83',
            road_address_name:'안서동 379-38',
            phone:'0507-1395-2591',
            LatLng: new kakao.maps.LatLng(36.84205627914206,127.18183880018523)
        },
        {
            title:'희락',
            address_name:'충남 천안시 동남구 문암1길 68',
            road_address_name:'안서동 365-3',
            phone:'0507-1359-5039',
            LatLng: new kakao.maps.LatLng(36.83894925847838,127.17706906855283)
        }
    ];

    // 분식 마커가 표시될 좌표 배열입니다
    var BoonPositions = [
    {
            title:'봉구스 밥버거',
            address_name:'충남 천안시 동남구 문암로 83',
            road_address_name:'안서동 379-38',
            phone:'010-5663-7052',
            LatLng: new kakao.maps.LatLng(36.84208142767236,127.18189267407737)
        },
        {
            title:'캠퍼스컵밥',
            address_name:'충남 천안시 동남구 문암로 77',
            road_address_name:'안서동 380-8',
            phone:'070-8287-2797',
            LatLng: new kakao.maps.LatLng(36.84164604805056,127.18139834755061)
        },
        {
            title:'도리돈밥',
            address_name:'충남 천안시 동남구 문암로 69',
            road_address_name:'안서동 386',
            phone:'없음',
            LatLng: new kakao.maps.LatLng(36.841131655793106,127.1807154926324)
        },
        {
            title:'용우동',
            address_name:'충남 천안시 동남구 문암로 70 1층',
            road_address_name:'안서동 385-4',
            phone:'041-554-0208',
            LatLng: new kakao.maps.LatLng(36.840940103605924,127.18105586107707)
        },
        {
            title:'청년다방',
            address_name:'충남 천안시 동남구 문암로 65',
            road_address_name:'안서동 386-8',
            phone:'041-566-8185',
            LatLng: new kakao.maps.LatLng(36.840832878169564,127.18045917562321)
        },
        {
            title:'국수나무',
            address_name:'충남 천안시 동남구 문암로 70',
            road_address_name:'안서동 385-4',
            phone:'0507-1390-6623',
            LatLng: new kakao.maps.LatLng(36.8409437011847,127.18106035402056)
        },
        {
            title:'지지고',
            address_name:'충남 천안시 동남구 문암로 70',
            road_address_name:'안서동 385-4',
            phone:'041-556-6999',
            LatLng: new kakao.maps.LatLng(36.8409437011847,127.18106035402056)
        },
        {
            title:'김밥시대',
            address_name:'충남 천안시 동남구 문암로 65',
            road_address_name:'안서동 386-8',
            phone:'041-523-7979',
            LatLng: new kakao.maps.LatLng(36.84078243006416,127.18045008818503)
        },
        {
            title:'천원국수',
            address_name:'충남 천안시 동남구 문암로 66',
            road_address_name:'안서동 387-4',
            phone:'041-554-0965',
            LatLng: new kakao.maps.LatLng(36.840587294676695,127.18077699398884)
        }
    ];
    // 마커 이미지의 이미지 주소입니다
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

    jangMarkers=[];
    korMarkers=[];
    yangMarkers=[];
    chaMarkers=[];
    jpMarkers=[];
    boonMarkers=[];

    createJangMarkers();
    createKorMarkers();
    createYangMarkers();
    createChaMarkers();
    createJpMarkers();
    createBoonMarkers();

    // 장애편의 마커를 생성하고 장애편의 마커 배열에 추가하는 함수입니다
    function createJangMarkers() {
    
        for (var i = 0; i < JangPositions.length; i++) {  
        
            var marker = new kakao.maps.Marker({
                position: JangPositions[i].LatLng, // 마커를 표시할 위치
                title : JangPositions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지 
            });

            // 생성된 마커를 장애편의 마커 배열에 추가합니다
            jangMarkers.push(marker);
        }     
    }
    console.log(jangMarkers)

    // 장애편의 마커들의 지도 표시 여부를 설정하는 함수입니다
    function setJangMarkers(map) {        
        for (var i = 0; i < jangMarkers.length; i++) {
            jangMarkers[i].setMap(map);
        }        
    }

    // 한식 마커를 생성하고 한식 마커 배열에 추가하는 함수입니다
    function createKorMarkers() {
        for (var i = 0; i < KorPositions.length; i++) {

            var marker = new kakao.maps.Marker({
                position: KorPositions[i].LatLng, // 마커를 표시할 위치
                title : KorPositions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지 
            });

            // 생성된 마커를 한식 마커 배열에 추가합니다
            korMarkers.push(marker);    
        }        
    }
    console.log(korMarkers)

    // 한식 마커들의 지도 표시 여부를 설정하는 함수입니다
    function setKorMarkers(map) {        
        for (var i = 0; i < korMarkers.length; i++) {  
            korMarkers[i].setMap(map);
        }        
    }

    // 양식 마커를 생성하고 양식 마커 배열에 추가하는 함수입니다
    function createYangMarkers() {
        for (var i = 0; i < YangPositions.length; i++) {
        
            var marker = new kakao.maps.Marker({
                position: YangPositions[i].LatLng, // 마커를 표시할 위치
                title : YangPositions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지 
            });

            // 생성된 마커를 주차장 마커 배열에 추가합니다
            yangMarkers.push(marker);        
        }
    }
    console.log(yangMarkers)

    // 양식 마커들의 지도 표시 여부를 설정하는 함수입니다
    function setYangMarkers(map) {        
        for (var i = 0; i < yangMarkers.length; i++) {  
            yangMarkers[i].setMap(map);
        }        
    }
    // 중식 마커를 생성하고 중식 마커 배열에 추가하는 함수입니다
    function createChaMarkers() {
        for (var i = 0; i < ChaPositions.length; i++) {
        
            var marker = new kakao.maps.Marker({
                position: ChaPositions[i].LatLng, // 마커를 표시할 위치
                title : ChaPositions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지 
            });

            // 생성된 마커를 주차장 마커 배열에 추가합니다
            chaMarkers.push(marker);        
        }                
    }
    console.log(chaMarkers)

    // 중식 마커들의 지도 표시 여부를 설정하는 함수입니다
    function setChaMarkers(map) {        
        for (var i = 0; i < chaMarkers.length; i++) {  
            chaMarkers[i].setMap(map);
        }        
    }

    // 일식 마커를 생성하고 일식 마커 배열에 추가하는 함수입니다
    function createJpMarkers() {
        for (var i = 0; i < JpPositions.length; i++) {
        
            var marker = new kakao.maps.Marker({
                position: JpPositions[i].LatLng, // 마커를 표시할 위치
                title : JpPositions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지 
            });

            // 생성된 마커를 일식 마커 배열에 추가합니다
            jpMarkers.push(marker);        
        }                
    }
    console.log(jpMarkers)
    // 일식 마커들의 지도 표시 여부를 설정하는 함수입니다
    function setJpMarkers(map) {        
        for (var i = 0; i < jpMarkers.length; i++) {  
            jpMarkers[i].setMap(map);
        }
    }

    // 분식 마커를 생성하고 분식 마커 배열에 추가하는 함수입니다
    function createBoonMarkers() {
        for (var i = 0; i < BoonPositions.length; i++) {
        
            var marker = new kakao.maps.Marker({
                position: BoonPositions[i].LatLng, // 마커를 표시할 위치
                title : BoonPositions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지 
            });

            // 생성된 마커를 분식 마커 배열에 추가합니다
            boonMarkers.push(marker);        
        }                
    }
    console.log(boonMarkers)
    // 분식 마커들의 지도 표시 여부를 설정하는 함수입니다
    function setBoonMarkers(map) {        
        for (var i = 0; i < boonMarkers.length; i++) {  
            boonMarkers[i].setMap(map);
        }
    }
    
    
    
    
    
    function changeMarker(type){
    
        var jangMenu = document.getElementById('JangMenu');
        var korMenu = document.getElementById('KorMenu');
        var yangMenu = document.getElementById('YangMenu');
        var chaMenu = document.getElementById('ChaMenu');
        var jpMenu = document.getElementById('JpMenu');
        var boonMenu = document.getElementById('BoonMenu');

        // 장애편의 카테고리가 클릭됐을 때
        if (type === 'Jang') {
        	
            // 장애편의 카테고리를 선택된 스타일로 변경하고
            jangMenu.className = 'menu_selected';
            korMenu.className = '';
            yangMenu.className = '';
            chaMenu.className = '';
            jpMenu.className = '';
            boonMenu.className = '';
        
            // 장애편의 마커들만 지도에 표시하도록 설정합니다
            setJangMarkers(map);
            setKorMarkers(null);
            setYangMarkers(null);
            setChaMarkers(null);
            setJpMarkers(null);
            setBoonMarkers(null);
        
        } else if (type === 'Kor') { // 한식 카테고리가 클릭됐을 때
        	
            // 한식 카테고리를 선택된 스타일로 변경하고
            jangMenu.className = '';
            korMenu.className = 'menu_selected';
            yangMenu.className = '';
            chaMenu.className = '';
            jpMenu.className = '';
            boonMenu.className = '';
        
            // 한식 마커들만 지도에 표시하도록 설정합니다
            setJangMarkers(null);
            setKorMarkers(map);
            setYangMarkers(null);
            setChaMarkers(null);
            setJpMarkers(null);
            setBoonMarkers(null);

        } else if (type === 'Yang') { // 양식 카테고리가 클릭됐을 때
     
            // 양식 카테고리를 선택된 스타일로 변경하고
            jangMenu.className = '';
            korMenu.className = '';
            yangMenu.className = 'menu_selected';
            chaMenu.className = '';
            jpMenu.className = '';
            boonMenu.className = '';
        
            // 양식 마커들만 지도에 표시하도록 설정합니다
            setJangMarkers(null);
            setKorMarkers(null);
            setYangMarkers(map);
            setChaMarkers(null);
            setJpMarkers(null);
            setBoonMarkers(null);

        } else if (type === 'Cha') { // 중식 카테고리가 클릭됐을 때
     
            // 중식 카테고리를 선택된 스타일로 변경하고
            jangMenu.className = '';
            korMenu.className = '';
            yangMenu.className = '';
            chaMenu.className = 'menu_selected';
            jpMenu.className = '';
            boonMenu.className = '';
 
            // 중식 마커들만 지도에 표시하도록 설정합니다
            setJangMarkers(null);
            setKorMarkers(null);
            setYangMarkers(null);
            setChaMarkers(map);
            setJpMarkers(null);
            setBoonMarkers(null);

        } else if (type === 'Jp') { // 일식 카테고리가 클릭됐을 때
     
            // 일식 카테고리를 선택된 스타일로 변경하고
            jangMenu.className = '';
            korMenu.className = '';
            yangMenu.className = '';
            chaMenu.className = '';
            jpMenu.className = 'menu_selected';
            boonMenu.className = '';

            // 일식 마커들만 지도에 표시하도록 설정합니다
            setJangMarkers(null);
            setKorMarkers(null);
            setYangMarkers(null);
            setChaMarkers(null);
            setJpMarkers(map);
            setBoonMarkers(null);

        } else if (type === 'Boon') { // 분식 카테고리가 클릭됐을 때
     
            // 분식 카테고리를 선택된 스타일로 변경하고
            jangMenu.className = '';
            korMenu.className = '';
            yangMenu.className = '';
            chaMenu.className = '';
            jpMenu.className = '';
            boonMenu.className = 'menu_selected';

            // 분식 마커들만 지도에 표시하도록 설정합니다
            setJangMarkers(null);
            setKorMarkers(null);
            setYangMarkers(null);
            setChaMarkers(null);
            setJpMarkers(null);
            setBoonMarkers(map);
        }
        
        var position =  new kakao.maps.LatLng(36.8318914901581,127.18669325992305)
        
        var marker1 = new kakao.maps.Marker({
        	  position: position
        	});
        
        kakao.maps.event.addListener(marker1, 'click', function() {
        	  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
        		$('#snsModal2').modal('show');
        	});
    } 
    </script>
</body>

</html>