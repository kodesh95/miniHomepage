<%@page import="MemberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개스트 마이페이지</title>
<link rel="stylesheet" href="/gaest/resources/style/mypage.css" />
</head>

<body>

	<%
	MemberDTO dto = (MemberDTO) session.getAttribute("oneMember");
	%>
	<%-- <h1 style="display:block;"><%=dto %></h1> --%>

<script>
	window.onload = function () {
			let modify = document.getElementById("modify");
			let cancel = document.getElementById("cancel");
/* 			let password = document.getElementById("pw");
			let name = document.getElementById("membername");
			let email = document.getElementById("email");
			let phone = document.getElementById("phone"); */


			modify.addEventListener('click', () => {
				if (confirm("수정하시겠습니까?")) {
					alert("수정되었습니다.");
				} else {
					alert("수정을 취소합니다.");
				}
			})

			cancel.addEventListener('click', () => {
				alert("정보수정을 취소합니다.");
			}) 
		} 
	</script> 
	
	<div class="bookcover">
		<div class="bookdot">
			<div class="main-container">
				<h1>마이페이지</h1>

				<div class="main">
					<form action="/gaest/MemberManagement/homelogin" method="post" name="form">
<table width="600">
    <tr>
        <td>ID</td>
        <td><input type="text" id="memberid" name="memberid" value="<%= (dto != null) ? dto.getMemberid() : "" %>" readonly="readonly"></td>
    </tr>
    <tr>
        <td>비밀번호</td>
        <td><input type="text" name="pw" id="pw" value="<%= (dto != null) ? dto.getPw() : "" %>" ></td>
    </tr>
    <tr>
        <td>이름</td>
        <td><input type="text" name="membername" id="membername" value="<%= (dto != null) ? dto.getMembername() : "" %>" ></td>
    </tr>
    <tr>
        <td>이메일</td>
        <td><input type="text" name="email" id="email" value="<%= (dto != null) ? dto.getEmail() : "" %>" readonly="readonly"></td>
    </tr>
    <tr>
        <td>휴대전화</td>
        <td><input type="text" name="phone" id="phone" value="<%= (dto != null) ? dto.getPhone() : "" %>"></td>
    </tr>

    <tr>
        <td colspan="2">
        		<input type=text id="birthday" name="birthday" value='<%=dto.getBirthday() %>' style="display:none;">
  					<input type=text id="gender" name="gender" value='<%=dto.getGender() %>' style="display:none;">
            <input type="submit" value="수정" id="modify" style="text-align: center;"> &nbsp;
        </td>
    </tr>
					  
</table>
</form>

					<form action="/gaest/cancelUpdate" method="post">
							<input type="submit" value="취소" id="cancel" style="text-align: center;">
					</form>
					<form action="/gaest/logout">
						<input type="submit" value="탈퇴" id="exit"
							style="text-align: center;">
					</form>

				</div>
			</div>
		</div>
	</div>
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



</body>

</html>