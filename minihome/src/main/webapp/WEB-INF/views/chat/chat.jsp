<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅💬</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/gaest/resources/style/chat.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!--     <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script> -->
</head>
<body>
    <script>
        var websocket=null;
        var curDate;
        var curTime;
        
        $(document).ready(function() {
            $("#enterbtn").on('click', function() {

            	
                if (websocket == null) {
                    var nickname = $("#nickname").val();
                    if (nickname.trim() === "") {
                        alert("별명을 입력하세요.");
                        return;
                    }

                    websocket = new WebSocket("ws://localhost:9080/gaest/ws");
                    websocket.onopen = function() {
                    	
                    	curDate = new Date();
                        curTime = curDate.getFullYear() + "-" 
                        + (curDate.getMonth() + 1) 
                        + "-" + curDate.getDate() 
                        + " " + curDate.getHours() 
                        + ":" + curDate.getMinutes() 
                        + ":" + curDate.getSeconds();
                    	
                        console.log("웹소켓 연결 성공");
                        $("#nickname").attr("readonly", true);
                        $('#chatmsg').append('<div class="chat-msg">' + nickname +"님이 입장했습니다.</div>");
                        $('#chatmsg').append('<div class="chat-time">' + curTime + '</div>');
                        
                    };
                    

                    websocket.onclose = function() {
                        console.log("웹소켓 연결 해제");
                    };

                    websocket.onmessage = function(event) {
                        var data = event.data;
                        $('#chatmsg').append('<div class="chat-msg">' + data + '</div>');
                        $('#chatmsg').append('<div class="chat-time">' + curTime + '</div>');
                        console.log("웹소켓 서버로부터 수신 성공");
                        scrollToBottom();
                        
                    };
                }
            });

            $("#exitbtn").on('click', function() {
            	var nickname = $("#nickname").val();
                if (websocket != null) {
                	curDate = new Date();
                    curTime = curDate.getFullYear() + "-" 
                    + (curDate.getMonth() + 1) 
                    + "-" + curDate.getDate() 
                    + " " + curDate.getHours() 
                    + ":" + curDate.getMinutes() 
                    + ":" + curDate.getSeconds();
                	
                	$('#chatmsg').append('<div class="chat-msg">' + nickname +"님이 퇴장했습니다.</div>");
                	$('#chatmsg').append('<div class="chat-time">' + curTime + '</div>');
                	
                    websocket.close();
                    window.close();
                }
            });

            $("#sendbtn").on('click', function() {
                sendMessage();
            });

            //엔터키 메시지 전송
            $("#message").on('keypress', function(event) {
                if (event.which === 13) {
                    sendMessage();
                }
            });

         //sendMessage 함수 정의
            function sendMessage() {
                if (websocket != null) {
                    var nick = $("#nickname").val();
                    var msg = $("#message").val();
                    if (msg.trim() !== "") {
                        // send 메소드를 호출하기 전에 연결 상태 확인
                        if (websocket.readyState === WebSocket.OPEN) {
                        	
                        	  curDate = new Date();
                              curTime = curDate.getFullYear() + "-" 
                              + (curDate.getMonth() + 1) 
                              + "-" + curDate.getDate() 
                              + " " + curDate.getHours() 
                              + ":" + curDate.getMinutes() 
                              + ":" + curDate.getSeconds();
                            websocket.send(nick + " : " + msg);
                            console.log(nick + " : 웹소켓 서버로부터 송신 성공");
                            $("#message").val("");
                            
                            
                            
                        } else if (websocket.readyState === WebSocket.CONNECTING) {
                            console.error("WebSocket is still connecting.");
                        } else {
                            console.error("WebSocket is not open.");
                        }
                    } else {
                        alert("메시지를 입력하세요.");
                    }
                }
            }
        
         // 스크롤을 맨 아래로 이동시키는 함수
            function scrollToBottom() {
                var chatContainer = $('#chatmessagearea');
                chatContainer.scrollTop(chatContainer.prop('scrollHeight'));
            }
         
        });
    </script>
    

   
<div class="chatcover">
	<div class="chatdot">
		<div class="chatbox">
	
			<div class="nickdiv">
				닉네임 <input type="text" id="nickname">
				<input type="button" id="enterbtn" value="입장">
				<input type="button" id="exitbtn" value="퇴장">
			</div>
			
			<div id="chatmessagearea" class="chat-container">
			<div id="chatmsg" ></div>		
			</div>
		
			<div class="senddiv">
				전송 메세지 <input type="text" id="message">
				<input type="button" id="sendbtn" value="전송">
			</div>

		</div>
	</div> 
</div> 


</body>
</html>
