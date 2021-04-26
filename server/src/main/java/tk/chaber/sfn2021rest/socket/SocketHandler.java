package tk.chaber.sfn2021rest.socket;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

@Component
public class SocketHandler extends TextWebSocketHandler {

    List<WebSocketSession> sessions = new CopyOnWriteArrayList<>(); //List for storing actually connected sessions
    ObjectMapper mapper = new ObjectMapper(); //JSON mapper

    //Message handler function
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws InterruptedException, IOException {
        //Reading values from JSON into Map
        Map value = mapper.readValue(message.getPayload(), Map.class);

        //Responding with a message
        session.sendMessage(new TextMessage("Requested world's name is " + value.get("world_name")));
        System.out.println("Requested world's name is " + value.get("world_name"));
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        //Adding new session to the List
        sessions.add(session);
        System.out.println("New session: " + session.getId());
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        //Removing session from List on close
        sessions.remove(session);
        System.out.println("Session closed: " + session.getId());

    }
}
