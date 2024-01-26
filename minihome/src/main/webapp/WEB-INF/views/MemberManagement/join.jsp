<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/gaest/resources/style/join.css" />




</head>

<body>

	<div class="bookcover">
		<div class="bookdot">
			<div class="main-container">
				<h1>회원가입</h1>
				<form action="joinResult" method="post">

					<div class="main">
						<div class="user" id="divId">
							<label for="id"></label> <input type="text" id="memberid"
								name="memberid" placeholder="아이디" class="input" value
								maxlength="20" autocapitalize="off">
							<!-- required -->
							<br> <span class="guide_id">* 영어, 숫자, 특수기호 - _ 사용
								가능합니다.</span><br> <span class="guide_id">* 5~20글자까지 입력
								가능합니다.</span>
						</div>
						<div class="password" id="divPsw">
							<label for="pw"></label> <input type="password" id="pw"
								name="pw" placeholder="비밀번호" class="input" value maxlength="20"
								autocomplete="new-password">
							<!-- required -->
							<br> <span class="guide_pwd">* 영어, 숫자, 특수기호 !@#$%^&*
								사용 가능합니다.</span><br> <span class="guide_pwd">* 30글자까지 입력
								가능합니다.</span>
						</div>


						<div class="email" id="divEmail">
							<label for="email"> </label> <input type="email" id="email"
								name="email" placeholder="이메일(선택)" class="input" maxlength="100">

						</div>

						<script>
											  // 이메일과 도메인을 합쳐서 서버로 전송
										 /*   var email = document.getElementById("front").value;
										    var domain = document.getElementById("mail_Select").value;
										    var fullEmail = email + "@" + domain;
										    
										    document.getElementById("email").value = fullEmail; */
												</script>

						<div class="list">
							<div class="name" id="divName">
								<label for="name"></label> <input type="text" id="membername"
									name="membername" placeholder="이름" class="input" value
									maxlength="40">
								<!-- required -->
							</div>
							<br>

							<h5>생년월일</h5>
							<div class="calendar" id="divBirthday">
								<label for="birthday"></label> <input type="date" id="birthday"
									name="birthday" placeholder="생년월일 8자리(선택)" class="input">
								<!-- 	max="2077-06-20"
																        min="2077-06-05"
																        value="2077-06-15"  -->

							</div>

							<div class="phone" id="divphone">
								<label for="phone"></label> <input type="text" id="phone"
									name="phone" placeholder="010-" class="input" value
									maxlength="13">
							</div>

							<div class="gender_list" id="listGender">
								<li class="radio"><input type="radio" id="gender1"
									name="gender" value="M" class="blind"> <label
									for="gender1">남자</label></li>

								<li class="radio"><input type="radio" id="gender2"
									name="gender" value="F" class="blind"> <label
									for="gender2">여자</label></li>
							</div>
						</div>
					</div>

					<div class="btn_submit_wrap" id="divBtnJoin">
						<!-- <input type=text name="email" style="display:none;" > -->
						<input type="submit" class="btn_submit" id="btnJoin" value="가입"
							style="text-align: center;"></input>&nbsp; <input type="cancel"
							class="btn_cancel" id="cancel" value="취소"
							style="text-align: center;"></input>
					</div>
				</form>
			</div>
			<div id="test"></div>
		</div>

	</div>

	<script>
		
		/*window.addEventListener('load', function () {
			 	document.querySelector("form").addEventListener("submit", (ev) => {
				//ev.preventDefault();
				let test = document.querySelector("#test");

				// 아이디 검증  영어, 숫자, 특수기호 -_ 사용가능, 5~20글자
				let userid = document.getElementById("id").value;
				let idcheck = /^[a-zA-Z0-9-_]{5,20}$/;
				let count = 0;
				let flag = 0;
				
				if (idcheck.test(userid)) {
					count++;
				} else {
					alert("아이디를 다시 작성해주세요.");
					userid.value = "";
					userid.focus();
					ev.preventDefault();
				}

				비밀번호 검증 영어, 숫자, 특수기호 !@#$%^&* 사용가능, 8~20글자
				let pw = document.getElementById("pw").value;
				let pwcheck = /^[a-zA-Z0-9!@#$%^&*]{8,20}$/;
				if (pwcheck.test(pw)) {
					//count++;
				} else {
					alert("비밀번호를 다시 작성해주세요.\n영문, 숫자, 특수문자가 포함되어야 합니다.");
					pw.value = "";
					ev.preventDefault();
				}
			/*	if (count == 2) {
					alert("회원가입이 완료되었습니다.");
					alert(`id = ${userid}\npw = ${pw} 입니다.`);
					if (confirm("홈페이지로 이동하시겠습니까?")) {
						location.href = "/gaest";
					}
				}
				ev.preventDefault(); 

			}); 
			

			cancel.addEventListener('click', () => {
				alert("회원가입을 취소합니다.");
				if (confirm("홈으로 돌아가시겠습니까?")) {
					location.href = "/gaest";
				}
			})

		}) */


	</script>

	<script>
	function autoHypenPhone(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
        return str;
    }

	var phone = document.getElementById('phone');
	phone.onkeyup = function(event){
    event = event || window.event;
    var _val = this.value.trim();
    this.value = autoHypenPhone(_val) ;
}
	</script>

	<script>
  			document.getElementById('birthday').value = new Date().toISOString().substring(0, 10);;
	</script>
</body>

</html>