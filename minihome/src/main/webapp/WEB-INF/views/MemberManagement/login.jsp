<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개스트 로그인</title>
<link rel="stylesheet" href="/gaest/resources/style/login.css" />
</head>
<body>

<%
String result = (String)request.getAttribute("result");
if(result!=null) {
%>
<script>
alert('${result }');
</script>
<% 
}
%>




		<div class="bookcover">
				<div class="bookdot">
						<div class="main-container">
								<div class="main">
										<h1>로그인</h1>
										<section class="login-input-section">
										
												<form action="/gaest/home/homelogin" method="post">
														<div class="login-input">
																<!--  <label>ＩＤ：</label> -->
																<input name="memberid" type="text" id="loginId"><br>
														</div>

														<div class="login-input password">
																<!--  <label>ＰＷ：</label> -->
																<input name="pw" type="password" id="loginPw"><br>
														</div>

														<!-- <div class="login-button"> -->
														<input type="submit" class="button"
																style="text-align: center;" value="로그인" id="login">&nbsp;
														<input type="reset" class="button"
																style="text-align: center;" value="취소" id="cancel">
												</form>
												
										</section>
								</div>
						</div>
				</div>
		</div>
		<!-- 관리자 계정 admin123
    관리자 비밀번호 admin123!@# -->

		<script>
        const id = document.getElementById('loginId')
        const password = document.getElementById('loginPw')
        const login = document.getElementById('login')
        let errStack = 0;

        
        
/*         login.addEventListener('click', () => {
        if (id.value == 'admin123') {
            if (password.value == 'admin123!@#') {
                alert(id.value+'님'+' 로그인 되었습니다.');
                errStack=0;
                location.href="/gaest/homelogin";
            }
            else {
                alert('아이디와 비밀번호를 다시 한 번 확인해주세요.')
                errStack ++;
            }
        }
        else {
            alert('존재하지 않는 계정입니다.');
        }

        if (errStack >= 5) {
            alert('비밀번호를 5회 이상 틀렸습니다.\n홈으로 돌아갑니다.');
            location.href="/gaest";
    }
}) */
    cancel.addEventListener('click', ()=>{
        if(confirm("홈으로 돌아가시겠습니까?")){
            location.href="/gaest";
        }
    }) 
    </script>

</body>
</html>