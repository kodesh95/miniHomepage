<%@page import="MemberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>개스트 일기장</title>
	<script src="https://kit.fontawesome.com/412379eca8.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/gaest/resources/style/diary.css" />
	<link rel="stylesheet" href="/gaest/resources/style/player.css">
<!-- 채팅창 -->
<script>
    function openChatPopup() {
        window.open('/gaest/chat', 'chat', 'width=500,height=600,left=200,top=200');
    }
</script>


</head>

<script> 
	/* 달력 */
	document.addEventListener("DOMContentLoaded", function() {
    let nowMonth = new Date();
    let today = new Date();
    today.setHours(0,0,0,0);

    let diary = {};
    let todoList = {};

    buildCalendar();

    function buildCalendar() {
        let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(),1);
        let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);

        let tbody_Calendar = document.querySelector(".calendar > tbody");

        document.getElementById("calYear").innerText = nowMonth.getFullYear();
        document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);
        
        while (tbody_Calendar.rows.length > 0){
            tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
        }

        let nowRow = tbody_Calendar.insertRow();

        for (let i = 0; i < firstDate.getDay(); i++){
            let nowCol = nowRow.insertCell();
        }

        for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)){
            if (nowRow.cells.length >= 7) {
                nowRow = tbody_Calendar.insertRow();
            }

            let nowCol = nowRow.insertCell();
            nowCol.innerText = nowDay.getDate();

            if (nowDay.toDateString() === today.toDateString()) {
                nowCol.classList.add('today');
            }

            let date = nowDay.getFullYear() + '-' + (nowDay.getMonth() + 1).toString().padStart(2, '0') + '-' + nowDay.getDate().toString().padStart(2, '0');
            let diaryExists = diary[date] && diary[date].length > 0;
            let todoExists = todoList[date] && todoList[date].length > 0;
            let dotDiv = document.createElement('span');

            if (diaryExists && todoExists) {
                dotDiv.style.color = 'purple';
            } else if (diaryExists) {
                dotDiv.style.color = 'blue';
            } else if (todoExists) {
                dotDiv.style.color = 'red';
            } else {
                dotDiv = null;  
            }

            if (dotDiv) {
                dotDiv.style.fontSize = '5px';
                dotDiv.innerHTML = '●';
                nowCol.appendChild(dotDiv);
            }

            nowCol.onclick = function(){choiceDate(this, date);}
        }
    }

    function leftPad(month){
        if (month < 10){
            month = "0" + month;
            return month;
        }
        return month;
    }

    function choiceDate(newDiv, date){
        if (document.getElementsByClassName("choiceDay")[0]){
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
        }
        newDiv.classList.add('choiceDay');

        document.getElementById('diary-date').value = date;
        showTodoList(date);
    }


	/* 투두리스트 */
    function showTodoList(date) {
    const todos = todoList[date];

    const taskBoard = document.getElementById('task-board');
    while(taskBoard.firstChild) {
        taskBoard.removeChild(taskBoard.firstChild);
    }

    if(todos) {
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

    document.getElementById('add-button').addEventListener('click', function() {
        const taskInput = document.getElementById('task-input');
        const taskText = taskInput.value;
        const selectedDate = document.getElementById('diary-date').value;

        if(todoList[selectedDate]) {
            todoList[selectedDate].push(taskText);
        } else {
            todoList[selectedDate] = [taskText];
        }

        taskInput.value = '';
        showTodoList(selectedDate);
        buildCalendar();
    });

/* 다이어리 작성 */
    document.getElementById('diary-submit').addEventListener('click', function() {
        const date = document.getElementById('diary-date').value;
        const text = document.getElementById('diary-text').value;

        const newEntry = `<div class="txtBox">
                            <div class="diary-date">${date}</div>
                            <div class="diary-txt">
                                <p>${text}</p>
                            </div>
                        </div>`;
        document.querySelector('.diary-scroll').innerHTML += newEntry;

        if (diary[date]) {
            diary[date].push(text);
        } else {
            diary[date] = [text];
        }

        buildCalendar();
    });

/* 다이어리 수정 */
    document.getElementById('diary-edit').addEventListener('click', function() {
        const date = document.getElementById('diary-date').value;
        const text = document.getElementById('diary-text').value;

        let entries = document.querySelectorAll('.txtBox');
        entries.forEach(entry => {
            if(entry.querySelector('.diary-date').innerText === date) {
                entry.querySelector('.diary-txt p').innerText = text;
            }
        });

        if (diary[date]) {
            diary[date] = diary[date].map(entry => entry === text ? text : entry);
        }

        buildCalendar();
    });
});

	
</script>



<body>

<%
MemberDTO dto = (MemberDTO)session.getAttribute("oneMember"); 
%>
<%-- <h1 style="display:block;"><%=dto %></h1> --%>
	
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
				
				<div class="content-container1">
				<div class="container1"> <!-- 왼쪽 박스 -->

					<!-- 달력 -->
					<div id="calendarDiv">
						
						<table class ="calendar">
						<thead>
						<tr class ="yy-mm">
							<td onClick="prevCalendar();">&#60;</td>
							<td colspan="5">
							<span id="calYear">?년</span>
							<span id="calMonth">?월</span>
							</td>
							<td onClick="nextCalendar();">&#62;</td>
						</tr> 

						<tr class="dd">
							<td class="sun">일</td>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<td class="sat">토</td>
						</tr>
						</thead>
						<tbody>

						</tbody>
						</table>
					</div>
			<!-- 투두리스트 -->		
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
					
				</div> <!-- // container1  -->


		

					<div class="container2"><!-- 오른쪽 박스 다이어리-->	
			
					<div class="diary-scroll">
						
				<div class="diary-input">
					<input id="diary-date" type="date" value="">
					<textarea id="diary-text" placeholder="오늘의 일기를 작성해주세요"></textarea>
					<button id="diary-submit">글올리기</button>
					<button id="diary-edit">수정</button>
				</div>
				

						<div class="txtBox">
							<div class="diary-date">2023.11.08 수 16:03</div>
							<div class="diary-txt">
								<p> 프론트엔드 첫 프로젝트로 미니홈피를 만들게 됐다.<br>
								우리 팀 이름은 <개트스><br>
								내가 맡은 부분은 다이어리랑 투두리스트!<br>
								어떻게 완성될 지 모르겠지만, 일단 꽤 재미는 있다ㅋㅋ<br>
								약간.. 스케치북에 그림 그리는 것 같기도 하네!<br>
								처음 배우는 거라 너무 어렵지만 ... <br>
								끝까지 화이팅하자!!🔥</p>
							</div>
						</div>
				
						<div class="txtBox">
							<div class="diary-date">2023.11.10 금 12:03</div>
							<div class="diary-txt">
								<p> 프론트엔드 첫 프로젝트로 미니홈피를 만들게 됐다.<br>
								우리 팀 이름은 <개트스><br>
								내가 맡은 부분은 다이어리랑 투두리스트!<br>
								어떻게 완성될 지 모르겠지만, 일단 꽤 재미는 있다ㅋㅋ<br>
								약간.. 스케치북에 그림 그리는 것 같기도 하네!<br>
								처음 배우는 거라 너무 어렵지만 ... <br>
								끝까지 화이팅하자!!🔥</p>
							</div>
						</div>
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