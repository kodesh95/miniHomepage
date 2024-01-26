<%@page import="MemberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>프로필</title>
	<link rel="stylesheet" href="/gaest/resources/style/profile.css" />
	<link rel="stylesheet" href="/gaest/resources/style/player.css">
	<script src="https://kit.fontawesome.com/412379eca8.js" crossorigin="anonymous"></script>
	<script src="/gaest/resources/js/jquery-3.7.1.min.js"></script>


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

%>
	<%-- <h1 style="display:block;"><%=dto %></h1> --%>

	<!--음악플레이어-->
	<div class="container">
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
	<form action="/gaest/logout" method="post">
		<input type="submit" name="logoutButton" id="logoutButton" value="로그아웃">
	</form>
	<form action="/gaest/MemberManagement/mypage" method="post">
		<input type=submit id="mypageButton" name="mypageButton" value="마이페이지">
	</form>
	</div>

	
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">

				<div class="content-container1"> <!-- 왼쪽 박스 -->

					<!--프로필-->
					<div class="profile-box">
						<div class="profile-title">
							<text id="title"> 프로필</text>
							<div class="profile-content">
								<img src="/gaest/resources/file/profile.jpeg" alt="프로필 이미지" width="200vw" height="140vh"
									id="profile-image" />

								<div class="profile-text1" id="profileTextDiv"
									style="max-height: 150px;overflow:auto;text-overflow:ellipsis;">
									<!--프로필 내용-->ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★
									ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★ㄱH스트
									ㅁiL1홈ㅍi입L1ㄷr..★

								</div>
								<div class="profile-text2">
									<form action="" name="profile-frm">
										<textarea name="profileText" id="profileText"> ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★</textarea>
										<button id="profileEditButton">프로필 수정</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="content-container2"> <!-- 오른쪽 박스 -->

					<div class="photo-box">
						<!-- 사진 앨범 -->
						<div class="photo-item"><img src="/gaest/resources/file/profile1.jpg" alt="사진1"></div>
						<div class="photo-item"><img src="/gaest/resources/file/profile2.jpg" alt="사진2"></div>
						<div class="photo-item"><img src="/gaest/resources/file/profile3.jpg" alt="사진3"></div>
						<div class="photo-item"><img src="/gaest/resources/file/profile4.jpg" alt="사진4"></div>
						<div class="photo-item"><img src="/gaest/resources/file/profile5.jpg" alt="사진5"></div>
						<div class="photo-item"><img src="/gaest/resources/file/profile6.jpg" alt="사진6"></div>
						<div class="photo-item"><img src="/gaest/resources/file/profile7.jpg" alt="사진7"></div>
						<div class="photo-item"><img src="/gaest/resources/file/profile8.jpg" alt="사진8"></div>
						<!-- 이후에 필요한 만큼 사진을 추가할 수 있습니다 -->
					</div>



				</div>
				<div class="menu-container"> <!-- 카테고리 박스 -->
				<div class="menu-button">
						
					<!-- 홈 -->
						<form action="/gaest/homelogin" method="post">
							<input type=submit name="homeButton" id="homeButton" value="홈">
						</form>
					<!-- 프로필 -->
						<form action="/gaest/profile" method="post">
							<input type=submit name="profileButton" id="profileButton" value="프로필">
						</form>
					<!-- 일기장 -->
						<form action="/gaest/diary" method="post">
							<input type=submit name="diaryButton" id="diaryButton" value="일기장">
						</form>
					<!-- 방명록 -->
						<form action="/gaest/guest" method="post">
							<input type=submit name="guestButton" id="guestButton" value="방명록">
						</form>
					<!-- 	<a href="/gaest/homelogin"><button id="homeButton">홈</button></a>
						<a href="/gaest/profile"><button id="profileButton">프로필</button></a>
						<a href="/gaest/diary"><button id="diaryButton">일기장</button></a>
						<a href="/gaest/guest"><button id="guestButton">방명록</button></a> -->
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="/gaest/resources/js/player.js"></script>

</body>

</html>