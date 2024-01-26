<%@page import="MemberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>개스트 미니홈피</title>
	<script src="https://kit.fontawesome.com/412379eca8.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/gaest/resources/style/layout.css" />
	<link rel="stylesheet" href="/gaest/resources/style/player.css">

<!-- 채팅창 -->
<script>
  function openChatPopup() {
      window.open('/gaest/chat', 'chat', 'width=500,height=600,left=200,top=200');
  }
</script>

<%
MemberDTO dto = (MemberDTO)session.getAttribute("oneMember"); 
String result = (String)request.getAttribute("result");
if(result!=null) {
%>
<script>
alert('<%=result%>'); 
</script>
<% 
}
%> 
<%-- <h1 style="display:block;"><%=dto %></h1> --%>
<script> // 로그아웃
window.onload = function () {
/* 	let logout = document.getElementById('logoutButton');

	logout.addEventListener('click', () => {
		if (confirm("로그아웃 하시겠습니까?")) {
			alert("로그아웃이 완료되었습니다.");
			location.href = "/gaest";
			// 메인화면으로 이동
		} else {
			alert("로그아웃이 취소되었습니다.");
		}
	}) */

	/* 투두리스트 */
	function showTodoList(date) {
		const todos = todoList[date];

		const taskBoard = document.getElementById('task-board');
		while (taskBoard.firstChild) {
			taskBoard.removeChild(taskBoard.firstChild);
		}

		if (todos) {
			todos.forEach((todo, index) => {
				const taskDiv = document.createElement('div');
				taskDiv.classList.add('task');
				taskDiv.style.display = "flex";  // 추가된 부분
				taskDiv.style.alignItems = "center";  // 추가된 부분
				taskDiv.innerHTML = `<input type="checkbox" name="checkbox" id="checkbox${index}">
                       <div>${todo}</div>
                       <button id="btn${index}">Del</button>`;
				taskBoard.appendChild(taskDiv);
			});
		}
	}
}
</script>
</head>

<body>



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
				<form action="/gaest/profile" method="post">
					<input type=submit name="profile" value="프로필">
				</form>
				
					<div class="content">
						<div class="profile-image">
							<img src="/gaest/resources/file/profile.jpeg" alt="프로필 이미지" width="200vw" height="140vh" />

						</div>
						<div class="profile-text">
							<!--프로필 내용-->ㄱH스트 ㅁiL1홈ㅍi입L1ㄷr..★
						</div>
					</div>
			</div>


			<!--일기장-->
			<div class="diary-box">
				<form action="/gaest/diary" method="post">
					<input type=submit name="diary" value="일기장">
				</form>
				<div class="content">
					<!--일기 내용-->
				</div>
			</div>
		</div>


		<div class="content-container2"> <!-- 오른쪽 박스 -->
			<!---->
			<div class="todo-box">
				<form action="/gaest/diary" method="post">
					<input type=submit name="todolist" value="To do list">
				</form>
				<div class="todo-content">
					<!--할일 내용-->

					<div class="todoDiv">
						<div class="todolist">
							<section class="task-area">
								<div class="task-tabs">
									<h3>ToDoList</h3>
								</div>

							</section>
							<div id="task-board">
							</div>
							<div id="input-area">
								<div id="task-controls">
									<input type="text" id="task-input" placeholder="할 일을 입력하세요">
									<button id="add-button">추가</button>
								</div>
							</div>
						</div>
					</div>



				</div>

			</div>




			<!-- 방명록 -->
			<div class="guest-box">
				<div class="title">
				<form action="/gaest/guest" method="post">
					<input type=submit name="guest" value="방명록">
				</form>
					<div class="guestimage1">
						<img src="/gaest/resources/file/guest1.jpg" alt="사진" width="140vw" height="140vh">
					</div>

				</div>
				<div class="content">
					<!-- 방명록 내용 -->
				</div>
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
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="/gaest/resources/js/player.js"></script>


</body>

</html>