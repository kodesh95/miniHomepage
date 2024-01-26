<%@page import="MemberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>방명록</title>
	<script src="https://kit.fontawesome.com/412379eca8.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/gaest/resources/style/guest.css" />
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

				<div class="content-container1"> <!-- 오른쪽 박스 -->
						<!-- 방명록 -->
						<div class="guest-box">
							<div class="box-title">
								방명록
							</div>
								<div class="guestbook-content">
									<form action="" name="guestbook-frm">
										<textarea name="guestbookText" id="guestbookText"></textarea>
										<button id="guestbookButton">등록</button>
									</form>
								</div>
							
											
												
								<div class="guestbook-scrollbox" style="max-height:550px; overflow:auto;">
	
									<div class="guestbook-box" >
										
										<div class="profile-text" id="profileTextDiv" style="max-height:150px; overflow:auto; text-overflow:ellipsis;">
											<div class="guestbook-title">No. 258 
												<span style = "color :#5c3ccf"> 제니</span>
												<i class="fas fa-home"></i>
												<div class="guestbook-date"> (2023.11.11 11:11)</div>
											</div>
											<div class="guestbook-contents">
												<div class="guestbook-image background-1">
													<img src="" alt="프로필 사진" >
												</div>
												<div class="guestbook-text">
													<p>오늘도 괜찮은 듯<br>그렇ㄱㅔ ㅈ1ㄴㅐㄱㅣ</p>
												</div>
											</div>
										</div>
									</div>
				
				                    <div class="guestbook-box">
										<div class="profile-text" id="profileTextDiv" style="max-height: 150px;overflow:auto;text-overflow:ellipsis;">
				                   			<div class="guestbook-title">No. 259 
				                        		<span style = "color : #5c3ccf">리사 </span>
				                        		<i class="fas fa-home"></i>
				                    			<div class="guestbook-date">(2023.11.11 11:11)</div>
				                    		</div>
						                    <div class="guestbook-contents">
						                        <div class="guestbook-image background-2">
						                            <img src="" alt="프로필 사진" />
						                        </div>
						                        <div class="guestbook-text">
						                             <p>너 내가 보내준 인소 봤냐 이 부분 개쩐다<br><br><br><br><br>내 심장의 색깔은 블랙<br></p>
						                        </div>
						                    </div>
				                    	</div>
				                    </div>
				
				                    <div class="guestbook-box">
										<div class="profile-text" id="profileTextDiv" style="max-height: 150px;overflow:auto;text-overflow:ellipsis;">
				                    		<div class="guestbook-title">No. 260 
						                        <span style = "color :#5c3ccf">리하이 </span>
						                        <i class="fas fa-home"></i>
				                    			<div class="guestbook-date">(2023.11.11 11:11)</div>
				                			</div>
						                    <div class="guestbook-contents">
						                        <div class="guestbook-image background-3">
						                            <img src="" alt="프로필 사진" />
						                        </div>
						                        <div class="guestbook-text">
						                            <p>야 내일 쿠우쿠우 갈래?</p>
						                        </div>
						                    </div>
				                    	</div>
				                    </div>
				
				                    <div class="guestbook-box">
										<div class="profile-text" id="profileTextDiv" style="max-height: 150px;overflow:auto;text-overflow:ellipsis;">
						                    <div class="guestbook-title">No. 261 
						                        <span style = "color :#5c3ccf">징징이 </span>
						                        <i class="fas fa-home"></i>
						                    <div class="guestbook-date">(2023.11.11 11:11)</div>
						                    </div>
					                    	<div class="guestbook-contents">
							                    <div class="guestbook-image background-4">
													<img src="" alt="프로필 사진" />
							                        </div>
							                        <div class="guestbook-text">
							                        	<p>야 뭐해ㅡㅡ 전화받아</p>
													</div>
											</div>
										</div>
									</div>
								</div><!--guest book scroll end -->
								
								
						</div>
					</div><!-- container end-->
							
					<div class="content-container2"> <!-- 오른쪽 박스 -->
					
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
					</div>
				</div>
					
				</div><!-- page end -->
			</div>
		</div>
	</div>
	
	
	<script src="/gaest/resources/js/player.js"></script>
	
</body>

</html>