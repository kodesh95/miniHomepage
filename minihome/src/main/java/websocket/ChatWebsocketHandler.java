package websocket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatWebsocketHandler extends TextWebSocketHandler {
	//연결된 모든 sessions 저장
	List<WebSocketSession> list = new ArrayList();
	

	// WebSocket 연결이 열리고 사용이 준비될 때 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getRemoteAddress() + "에서 접속했습니다.");
		list.add(session);
		
		for (int i = 0; i < list.size(); i++) {
			WebSocketSession s = list.get(i);
		}
	}
	
	// 클라이언트로부터 메시지가 도착했을 때 호출
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);
		//웹소켓 연결 클라이언트가 메세지 보낼 때 자동 실행
		//나머지클라이언트(list)에게 전송 구현
		String msg = (String)message.getPayload();
		for (WebSocketSession socket : list) {
			WebSocketMessage<String> sendmsg = new TextMessage(msg);
			socket.sendMessage(sendmsg);
		}
	}

	// WebSocket 연결이 닫혔을 때 호출
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getRemoteAddress() + "에서 해제했습니다.");
		list.remove(session);
		
		// 모든 세션에 채팅 전달
		for (int i = 0; i < list.size(); i++) {
			WebSocketSession s = list.get(i);
		}
	}
	
	// 전송 에러 발생할 때 호출
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(exception + ": 오류 발생");
	}
}
