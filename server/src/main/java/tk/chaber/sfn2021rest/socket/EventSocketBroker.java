package tk.chaber.sfn2021rest.socket;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import tk.chaber.sfn2021rest.socket.handlers.EventHandling;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@Controller
public class EventSocketBroker extends TextWebSocketHandler {

    List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();
    HashMap<EventsEnum, EventHandling> eventHandlers = new HashMap<>();
    ObjectMapper mapper = new ObjectMapper();

    @Autowired
    private void putHandler(List<EventHandling> handlersList){
        handlersList.forEach((EventHandling handler) -> {
            System.out.println("Hello there");
            eventHandlers.put(handler.getEvent(), handler);
        });
    }

    public EventSocketBroker(){

    }


    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);
        System.out.println("Handler: " + eventHandlers.get(EventsEnum.TEST));
    }

    public void emitTextMessage(WebSocketSession session, HashMap<String, Object> data){
    }

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        //JSON to HashMap conversion, and assigning to variables
        HashMap<String, Object> messageMap = mapper.readValue(message.getPayload(), HashMap.class);
        EventsEnum  event = EventsEnum.valueOf(((String) messageMap.get("event")).toUpperCase());
        HashMap<String, Object> headers = (HashMap<String, Object>) messageMap.get("headers"),
                                payload = (HashMap<String, Object>) messageMap.get("payload");

        System.out.println("------------------- New message received by broker -------------------");
        System.out.println("Event type: " + event);
        System.out.println("Headers: " + headers.toString());
        System.out.println("Payload: " + payload.toString());

        System.out.println("Handlers: " + eventHandlers.toString());

        EventHandling handler = eventHandlers.get(event);
        handler.handle(payload);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
    }
}
