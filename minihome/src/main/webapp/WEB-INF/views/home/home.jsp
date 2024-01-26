<%@page import="MemberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>개스트 미니홈피</title>
	<link rel="stylesheet" href="/gaest/resources/style/home.css" />
	<link rel="stylesheet" href="/gaest/resources/style/player.css">

<!-- 채팅창 -->
<script>
    function openChatPopup() {
        window.open('/gaest/chat', 'chat', 'width=500,height=600,left=200,top=200');
    }
</script>

</head>

<body>

<%
MemberDTO dto = (MemberDTO)session.getAttribute("oneMember"); 
String result = (String)request.getAttribute("result");
if(result!=null) {
%>
<script>
alert("<%=result%>"); 
</script>
<% 
}
%> 
	<div class="container"> <!--음악-->
		<div class="music-container" id="musicContainer">

			<audio id="audio" src="/gaest/resources/audio_img/mol1.mp3" onloadstart="this.volume=0.5"></audio>

			<div class="img-container">
				<img src="/gaest/resources/audio_img/mol1.jpg" alt="cover" id="cover">
			</div>

			<div class="navigation">
				<button id="prev" class="action-btn"><i class="fa-sharp fa-solid fa-backward"></i></button>
				<button id="play" class="actiong-btn-big"><i class="fa-solid fa-play"></i></button>
				<button id="next" class="actiong-btn"><i class="fa-sharp fa-solid fa-forward"></i></button>
			</div>
		</div>
	</div>

	<!-- 실시간 채팅 버튼 -->
	<button id="chatbtn" onclick="openChatPopup()">채팅💬</button>



	<div class="top-buttons"> <!-- 상단 버튼  -->
		<button id="loginButton" onclick="location.href='/gaest/MemberManagement/login'">로그인</button>
		<button id="signupButton" onclick="location.href='/gaest/MemberManagement/join'">회원가입</button>
		<button id="logoutButton" style="display:none;">로그아웃</button>
		<button id="mypageButton" style="display:none;">마이페이지</button>
	</div>

	<div class="bookcover">
		<div class="bookdot">
			<div class="page">

				<div class="content-container1"> <!-- 왼쪽 박스 -->

					<div class="box">
						<div class="team_photo">
							<img src="/gaest/resources/audio_img/mandu.jpg" alt="team_photo">
							<span id="team_name">스트</span>
						</div>
					</div>

					<div class="box">
						<div class="my_photo">
							<img src="/gaest/resources/audio_img/myPhoto_passport.jpg" alt="my_photo">

							<ul id="intro">
								<li>이름 : 최지은</li>
								<li>이메일 : kodesh95@gmail.com</li>
								<li>희망포지션 : 백엔드</li>
								<li>한마디 : 무쇠도 갈면 바늘된다는 말이 있듯이 꾸준히 노력하면 어려운 일이라도 이룰 수 있을 겁니다.</li>
							</ul>
						</div>
					</div>

					<div class="box">
						<div class="my_photo">
							<img src="/gaest/resources/audio_img/hj.jpg" alt="my_photo">

							<ul id="intro">
								<li>이름 : 정하진</li>
								<li>이메일 : hajin000607@gmail.com</li>
								<li>희망포지션 : 프론트엔드..+풀스택</li>
								<li>한마디 : 즐겁고 재밌게 잘 공부하자 !</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="content-container2"> <!-- 오른쪽 박스 -->

					<div class="box">
						<div class="my_photo">
							<img src="/gaest/resources/audio_img/lys_photo.jpg" alt="my_photo">

							<ul id="intro">
								<li>이름 : 이유석</li>
								<li>이메일 : lys4154@gmail.com</li>
								<li>희망포지션 : 백엔드</li>
								<li>한마디 : 이번 과정이 끝나면 발전된 나를 볼 수 있기를.</li>
							</ul>
						</div>

					</div>

					<div class="box">
						<div class="my_photo">
							<img src="/gaest/resources/audio_img\inae.jpg" alt="my_photo">

							<ul id="intro">
								<li>이름 : 정인애</li>
								<li>이메일 : inaeya23@gmail.com</li>
								<li>희망포지션 : 풀스텍같은 프론트엔트</li>
								<li>한마디 : 느려도 멈추지만 않으면 괜찮아~ </li>
							</ul>
						</div>
					</div>

					<div class="box">
						<div class="my_photo">
							<img src="/gaest/resources/audio_img/JIHOON.png" alt="my_photo">

							<ul id="intro">
								<li>이름 : 유지훈</li>
								<li>이메일 : wlgns713@gmail.com</li>
								<li>희망포지션 : 풀스텍</li>
								<li>한마디 : R=VD </li>
							</ul>
						</div>
					</div>
				</div>

				<div class="menu-container"> <!-- 카테고리 박스 -->
					<div class="menu-button">
						<a href="/gaest"><button id="homeButton">홈</button></a>
						<a href="profile"><button id="profileButton">프로필</button></a>
						<a href="diary"><button id="diaryButton">일기장</button></a>
						<a href="guest"><button id="guestButton">방명록</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script> // 비회원 기능제한
		let profile = document.getElementById('profileButton');
		profile.addEventListener('click', (e) => {
			alert("비회원은 이용하실 수 없습니다.");
			e.preventDefault();
		})

		let diary = document.getElementById('diaryButton');
		diary.addEventListener('click', (e) => {
			alert("비회원은 이용하실 수 없습니다.");
			e.preventDefault();
		})

		let guest = document.getElementById('guestButton');
		guest.addEventListener('click', (e) => {
			alert("비회원은 이용하실 수 없습니다.");
			e.preventDefault();
		})
	</script>
</body>

</html>