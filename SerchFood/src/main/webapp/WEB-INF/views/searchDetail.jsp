<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="net.sf.json.JSONObject" %>
<%  int blockBegin=((Integer)request.getAttribute("blockBegin")).intValue();		// pageBlock의 시작값
	int blockEnd=((Integer)request.getAttribute("blockEnd")).intValue();			// pageBlock의 마지막값
	int nowpage=((Integer)request.getAttribute("page")).intValue();					// 현재 page값
	int endpage=((Integer)request.getAttribute("endPage")).intValue();				// 마지막 page값
	int display=((Integer)request.getAttribute("display")).intValue();				// 블로그 리스트를 나타낼 display값 
	int mapx = (Integer)request.getAttribute("mapx"); 								//
	int mapy = (Integer)request.getAttribute("mapy");								// 검색 category의 detail을 보여주기 위한 mapx, mapy값
	String category = ((String)request.getAttribute("category")).toString();		// 검색 category값 
	String blogCategory = ((String)request.getAttribute("blogCategory")).toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- 지도 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=JsRivo1hBqek9J_l3Tw3&submodules=geocoder"></script>

    <!-- 스타일 -->
    <link href="../assets/css/bootstrap-ko.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 20px;
        padding-bottom: 40px;
      }

      /* 전체 내용을 감쌈 */
      .container-narrow {
        margin: 0 auto;
        max-width: 700px;
      }
      .container-narrow > hr {
        margin: 30px 0;
      }

      /* 핵심 마케팅 문구와 가입 버튼 */
      .jumbotron {
        margin: 60px 0;
        text-align: center;
      }
      .jumbotron h1 {
        font-size: 72px;
        line-height: 1;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }

      /* 부수적인 마케팅 내용 */
      .marketing {
        margin: 60px 0;
      }
      .marketing p + h4 {
        margin-top: 28px;
      }
    </style>
    <!-- <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet"> -->

    <!-- IE6~8에서 HTML5 태그를 지원하기위한 HTML5 shim -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- 파비콘과 앱 아이콘 -->
    <!-- <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="../assets/ico/favicon.png"> -->
    
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/3-col-portfolio.css" rel="stylesheet">
    
    <!-- StarPoint CSS -->
    <link rel="stylesheet" type="text/css" media="screen" href="/jun/resources/css/star.css"/>
    
  </head>

  <body>

    <div class="container-narrow">

      <!-- Navigation -->
    <c:if test="${empty userid}">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="main.sf">밥먹고 합시다</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="main.sf">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
	</c:if>
	
	<c:if test="${!empty userid}">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="main.sf">밥먹고 합시다</a>
        
        <p style=color:white;>${userid} 님 환영합니다.</p>
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="main.sf">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
	</c:if>
      <hr>
		<!-- class="jumbotron" style="width:100%;height:400px;"--> 
      <div id="map" style="width:100%;height:400px;">
      </div>

      <hr>
      <c:set var="mapx" value='<%=mapx%>' />
      <c:set var="mapy" value='<%=mapy%>' />
      
      <div class="row-fluid marketing">
      <c:forEach items="${searchResult}" var="result">
      <c:if test="${result.mapx eq mapx && result.mapy eq mapy}">
        <div class="span6">
          <h1>${result.title}</h1><br><br>
          <li>카테고리 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${result.category}</li><br>
          <li>주소(구)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${result.address}</li><br>
          <li>도로명주소<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${result.roadAddress}</li><br>
          <address><li>전화번호<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${result.telephone}</li></address>
        </div>
        </c:if>
	  </c:forEach>
      <hr>
      
      <strong><h3>평점</h3></strong><br>
      <div class="row">
      	<div class="starRev">
  			<span class="starR1 on" id="starL1">별1_왼쪽</span>
  			<span class="starR2" id="starR1">별1_오른쪽</span>
  			<span class="starR1" id="starL2">별2_왼쪽</span>
  			<span class="starR2" id="starR2">별2_오른쪽</span>
  			<span class="starR1" id="starL3">별3_왼쪽</span>
  			<span class="starR2" id="starR3">별3_오른쪽</span>
  			<span class="starR1" id="starL4">별4_왼쪽</span>
  			<span class="starR2" id="starR4">별4_오른쪽</span>
  			<span class="starR1" id="starL5">별5_왼쪽</span>
  			<span class="starR2" id="starR5">별5_오른쪽</span>
		</div>
	</div>
      <hr>
      
      <strong><h3>다른 주변 식당</h3></strong><br>
      <div class="row">
		<c:forEach items="${menuResult}" var="menu" begin="0" end="9">
		<c:if test="${menu.mapx > mapx-500 && menu.mapx < mapx+500 && menu.mapy > mapy-500 && menu.mapy < mapy+500 && menu.mapx ne mapx}">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="./search_detail.sf?category=${menu.title}&blogCategory=<%=blogCategory %>&mapx=${menu.mapx}&mapy=${menu.mapy}">${menu.title}</a>
              </h4>
              <p class="card-text">${menu.description}</p>
            </div>
          </div>
        </div>
        </c:if>
        </c:forEach>
      </div> 
      <hr>
      <!-- /.row -->
      
      
      <div class="row-fluid marketing">
      <strong><h3>추천 블로그</h3></strong><br>
      <c:forEach items="${blogResult}" var="result">
      <c:if test="${result eq null}">
      	추천 블로그가 없습니다.
      </c:if>
        <div class="span6">
        	<table border = "0">
        	<tr>
        		<td style = font-size:20px;><a href="${result.link}">${result.title}</a></td>
            	<td rowspan="2" style="width:190px; border-left:1px solid gray; text-align:left"> 
            		&nbsp;Date : ${result.postdate}<br><br>
            		&nbsp;Link : 네이버 블로그<br><br>
            		&nbsp;By : <a href="${result.bloggerlink}">${result.bloggername}</a> </td>
        	</tr>
        	<tr>
        		<td><br><dd>${result.description}</dd></td><hr>
        	</tr>
    		</table>
        </div>
	  </c:forEach>
      <hr>

    </div> <!-- /container -->
    
    <!-- Pagination -->
      
      <ul class="pagination justify-content-center">
        <li class="page-item">
        <%if(nowpage == 1) {%>
       		<a class="page-link" onclick="alert('첫 번쨰 페이지 입니다.');" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        <%} else { %>
          <a class="page-link" href="./search_detail.sf?category=<%=category %>&blogCategory=<%=blogCategory %>&page=<%= nowpage-1 %>&start=<%=((nowpage-1)*10)-9%>&mapx=<%=mapx%>&mapy=<%=mapy%>" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
         <%} %>
        </li>
        
        <%for(int i = blockBegin; i <= blockEnd; i++){ %>
        <li class="page-item">
        		<%if(i==nowpage){ %>
          		<a class="page-link" href="./search_detail.sf?category=<%=category %>&blogCategory=<%=blogCategory %>&page=<%= i %>&start=<%=(i*10)-9%>&mapx=<%=mapx%>&mapy=<%=mapy%>"><%= i %></a>

          		<%}else{ %>
				<a class="page-link" href="./search_detail.sf?category=<%=category %>&blogCategory=<%=blogCategory %>&page=<%= i %>&start=<%=(i*10)-9%>&mapx=<%=mapx%>&mapy=<%=mapy%>"><%= i %></a>
				<%} %>
        </li>
        <%} %>
		
		<%if(nowpage >= endpage) {%>
		<li class="page-item">
          <a class="page-link" onclick="alert('마지막 페이지 입니다.');" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>	
		<%}else { %>
        <li class="page-item">
          <a class="page-link" href="./search_detail.sf?category=<%=category %>&blogCategory=<%=blogCategory %>&page=<%= nowpage+1 %>&start=<%=((nowpage+1)*10)-9%>&mapx=<%=mapx%>&mapy=<%=mapy%>" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
        <%} %>
      </ul>
      	
    <!-- /.container -->
    
     <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; 밥먹고합시다</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Star -->
	<script>
	$('.starRev span').click(function(){
		 $(this).parent().children('span').removeClass('on');
		 var up = $(this).addClass('on').prevAll('span').addClass('on');
		 var title ='<%=category%>'
		 
		   checkStar(up, title);
		 
		  return false;
		});
	</script>
	
	<script>
	function checkStar(up, title){
		console.log(up.index());
		var starPoint = 0.5;
		
		if(up.index() == -1) starPoint = starPoint; 
		else if(up.index() == 0) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 1) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 2) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 3) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 4) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 5) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 6) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 7) starPoint=starPoint*(up.index()+2);
		else if(up.index() == 8) starPoint=starPoint*(up.index()+2);
		console.log(starPoint);
		
		
		var param = {"starPoint":starPoint, "title":title};
		
		$.ajax({
			type:"post",
			url:"./starPoint.sf",
			data:param
			}).done(function(data){
				});
	};
	</script>
	
<script>

//현재 위치 콘솔에 출력해보기
navigator.geolocation.getCurrentPosition(function(position) {
	  console.log(position.coords.latitude + ", " + position.coords.longitude);

// 현재위치 변수 만들기 + 위도 경도를 네이버 지도에 맞는 위도 경도로 만들기
var thisposition = new naver.maps.LatLng(position.coords.latitude, position.coords.longitude);
var utmk = naver.maps.TransCoord.fromLatLngToUTMK(thisposition); // 위/경도 -> UTMK
var tm128 = new naver.maps.Point(position.coords.latitude, position.coords.longitude);
tm128 = naver.maps.TransCoord.fromUTMKToTM128(utmk);   // UTMK -> TM128

console.log("tm122222228 ," + tm128);
console.log("tm128 ," + tm128.x); //tm128 x 좌표
console.log("tm1282222222 ," + tm128.y); //tm128 y좌표
var posi= new naver.maps.Point(tm128.x, tm128.y);


// 현재 위도 확인
var latitude =position.coords.latitude;
console.log("now la   ," + latitude);

// 현재 경도 확인
var longitude =position.coords.longitude;
console.log("now lo   ," + longitude);

//지도 생성하기
var HOME_PATH = window.HOME_PATH || '.';
map = new naver.maps.Map("map", {
    center: new naver.maps.Point(tm128.x, tm128.y),
    zoom: 8,
    mapTypes: new naver.maps.MapTypeRegistry({
        'normal': naver.maps.NaverMapTypeOption.getNormalMap({
            projection: naver.maps.TM128Coord
        }),
        'terrain': naver.maps.NaverMapTypeOption.getTerrainMap({
            projection: naver.maps.TM128Coord
        }),
        'satellite': naver.maps.NaverMapTypeOption.getSatelliteMap({
            projection: naver.maps.TM128Coord
        }),
        'hybrid': naver.maps.NaverMapTypeOption.getHybridMap({
            projection: naver.maps.TM128Coord
        })
    }),
    mapTypeControl: true
});

var circle = new naver.maps.Circle({
    map: map,
    center: tm128,
    radius:1000,
    fillColor: 'crimson',
    fillOpacity: 0.2
 });


var marker1 = new naver.maps.Marker({//현재 내위치
	position: posi,
    map: map,
    icon: {
        path: [
            new naver.maps.Point(0, 70), new naver.maps.Point(20, 100), new naver.maps.Point(40, 70),
            new naver.maps.Point(30, 70), new naver.maps.Point(70, 0), new naver.maps.Point(10, 70)
        ],
        style: "closedPath",
        anchor: new naver.maps.Point(23, 103),
        fillColor: '#ff0000',
        fillOpacity: 1,
        strokeColor: '#000000',
        strokeStyle: 'solid',
        strokeWeight: 3
    }
});

var object = ${menuResult};
var jmapx= [];
var jmapy = [];

for(var i = 0; i<object.length; i++){
	
	var mapx = object[i].mapx;
	var mapy = object[i].mapy;
	
	
 	if(mapx-tm128.x<100000){//참거짓을 판별하는 척도 일뿐  1000보다 작으면 그것에 해당하는 mapx 
 		
 		jmapx.push(mapx);
 		console.log("if문 사이에서의 " + jmapx[2]);
 		
	}

 	if(mapy-tm128.y<100000){//참거짓을 판별하는 척도 일뿐
		jmapy.push(mapy);
	}
	
 
	console.log("x값 = " + jmapx+ ""+ "y값= " + jmapy);	

}//상단 for문
var markers = [],
infoWindows = [];
var markers = [],   //마커의 모임
infoWindows = [];   //정보창의 모임
var contentStringarr =[]; //각 좌표에 대한 내용들 즉 , 제목 주소 카테고리

//jmapx와 jmapy 값들을 지도에 찍기
for(var i = 0; i<object.length; i++){ //찍는 위치
		var marker2 = new naver.maps.Marker({
   		position: new naver.maps.Point(jmapx[i],jmapy[i]),
   		map: map
		});
markers.push(marker2);

} //상단 for문 마침

var infoWindow;
for(var i = 0; i<object.length; i++){
  contentString=("title     :"  + object[i].title +  "   address     :"+ object[i].address +  "   category     :" +  object[i].category);
  contentStringarr.push(contentString); 
  console.log(contentStringarr);

   infoWindow = new naver.maps.InfoWindow({
    content:'<div style="width:150px;text-align:center;padding:10px;"> <b>"'+  contentStringarr[i] +'"</b>.</div>' 
   });
   infoWindows.push(infoWindow)
  
   // 좌표의 모음들.
}//상단 for문   
           
  console.log("0번쨰" , markers[0]);
  console.log(infoWindows);

  function equalindex(seq){
	  
	  var markerss = markers[seq];
	  var infowindowss = infoWindows[seq];
	  
	  if(${mapx}==jmapx[i] && ${mapy}==jmapy[i]) {
			infowindowss.open(map, markerss);
		}
	  
     return function(e){
  
	   if(infowindowss.getMap()){
		   infowindowss.close();
         } else {
        	 infowindowss.open(map, markerss);
             }
        }
     
  }    

  for (var i=0, ii=markers.length; i<ii; i++) {
     naver.maps.Event.addListener(markers[i], "click", equalindex(i));
  } 


//마커 있던 자리
 /* for(var i = 0; i<object.length; i++){ //찍는 위치
	 
		var searchPosi= new naver.maps.Point(jmapx[i], jmapy[i]);
		console.log("디스포지션 씨발" + searchPosi + "  mapy나옴?" + ${mapy});
 	
		if(${mapy} == jmapy[i]){
		
			var marker2 = new naver.maps.Marker({
				position: searchPosi,
    			map: map
			});
		}
 }
//여기까지가 마커찍기 

//검색한 식당 설명-------------------
<c:forEach items="${searchResult}" var="result">
<c:if test="${result.mapx eq mapx && result.mapy eq mapy}">
	var contentString = [
        '<div class="iw_inner">',
        '   <h3>"${result.title}"</h3>',
        '   <p>${result.address} <br /> ${result.roadAddress}<br />',
        '       ${result.telephone} | ${result.category}<br />',
        '       <a href="${result.link}" target="_blank">${result.link}/</a>',
        '   </p>',
        '</div>'
    ].join('');

var infowindow = new naver.maps.InfoWindow({
    content: contentString
});

naver.maps.Event.addListener(marker2, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker2);
    }
});

infowindow.open(map, marker2);
</c:if>
</c:forEach>
//----------------------------------

//주변 추천 집 마커 찍기

var nearby = ${menuResult};
var nmapx = [];
var nmapy = [];

 for(var i = 0; i<nearby.length; i++){
		
		var mapx = nearby[i].mapx;
		var mapy = nearby[i].mapy;
		
		
	 	if(mapx-tm128.x<1000){//참거짓을 판별하는 척도 일뿐  1000보다 작으면 그것에 해당하는 mapx 
	 		
	 		nmapx.push(mapx);
	 		console.log("if문 사이에서의 " + nmapx[2]);
	 		
		}

	 	if(mapy-tm128.y<1000){//참거짓을 판별하는 척도 일뿐
			nmapy.push(mapy);
		}
		
	 
		console.log("x값 = " + nmapx+ ""+ "y값= " + nmapy);	

	}

	//마커 있던 자리
	 for(var i = 0; i<nearby.length; i++){ //찍는 위치
	
		 var nearbyPosi = new naver.maps.Point(nmapx[i], nmapy[i]);
			console.log("니얼바이 씨발" + nearbyPosi + "  mapy나옴?" + nmapx[i]);	 
		 
	if(nmapx[i]>=${mapx}-500 && nmapx[i]<=${mapx}+500 && nmapy[i]>=${mapy}-500 && nmapy[i]<=${mapy}+500){
		var marker3 = new naver.maps.Marker({
	    	position: nearbyPosi,
	    	map: map
		});
	}

	 }
	//검색한 식당 설명-------------------
	 <c:forEach items="${menuResult}" var="menu">
	 <c:if test="${menu.mapx eq mapx && menu.mapy eq mapy}">
	 	var contentString = [
	         '<div class="iw_inner">',
	         '   <h3>"${menu.title}"</h3>',
	         '   <p>${menu.address} <br /> ${menu.roadAddress}<br />',
	         '       ${menu.telephone} | ${menu.category}<br />',
	         '       <a href="${menu.link}" target="_blank">${menu.link}/</a>',
	         '   </p>',
	         '</div>'
	     ].join('');
	 </c:if>
	 </c:forEach>
	 var infowindow = new naver.maps.InfoWindow({
	     content: contentString
	 });

	 naver.maps.Event.addListener(marker3, "click", function(e) {
	     if (infowindow.getMap()) {
	    	 infowindow.open(map, marker3);
	     } else {
	    	 infowindow.close();
	     }
	 });

	 infowindow.open(map, marker3);
	 //---------------------------------- */

})//지우지 말것 최상단 메소드 

</script>
	
   <!-- 자바스크립트
    ================================================== -->
    <!-- 페이지를 빨리 읽어들이도록 문서 마지막에 배치 -->
    <!-- <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap-transition.js"></script>
    <script src="../assets/js/bootstrap-alert.js"></script>
    <script src="../assets/js/bootstrap-modal.js"></script>
    <script src="../assets/js/bootstrap-dropdown.js"></script>
    <script src="../assets/js/bootstrap-scrollspy.js"></script>
    <script src="../assets/js/bootstrap-tab.js"></script>
    <script src="../assets/js/bootstrap-tooltip.js"></script>
    <script src="../assets/js/bootstrap-popover.js"></script>
    <script src="../assets/js/bootstrap-button.js"></script>
    <script src="../assets/js/bootstrap-collapse.js"></script>
    <script src="../assets/js/bootstrap-carousel.js"></script>
    <script src="../assets/js/bootstrap-typeahead.js"></script> -->

  </body>
</html>