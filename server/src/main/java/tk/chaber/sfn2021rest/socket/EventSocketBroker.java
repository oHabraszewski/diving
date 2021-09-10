package tk.chaber.sfn2021rest.socket;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import tk.chaber.sfn2021rest.db.WorldsRepo;
import tk.chaber.sfn2021rest.db.entities.World;
import tk.chaber.sfn2021rest.socket.handlers.Handler;
import tk.chaber.sfn2021rest.TestHandler;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@Controller
public class EventSocketBroker extends TextWebSocketHandler {

    @Autowired
    private TestHandler testHandler;

    List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();
    HashMap<EventsEnum, Class> handlers = new HashMap<>();
    ObjectMapper mapper = new ObjectMapper();

    public EventSocketBroker(){
        handlers.put(EventsEnum.TEST, TestHandler.class);
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);
    }

    public void emitTextMessage(WebSocketSession session, HashMap data){
    }

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        //JSON to HashMap conversion, and assigning to variables
        HashMap messageMap = mapper.readValue(message.getPayload(), HashMap.class);
        EventsEnum  event = EventsEnum.valueOf(((String) messageMap.get("event")).toUpperCase());
        HashMap headers = (HashMap) messageMap.get("headers"),
                payload = (HashMap) messageMap.get("payload");

        System.out.println(event); //TODO: Debug
        System.out.println(headers.toString());
        System.out.println(payload.toString());

        testHandler.handle(payload);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
    }
}
