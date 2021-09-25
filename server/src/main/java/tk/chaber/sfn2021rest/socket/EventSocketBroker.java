package tk.chaber.sfn2021rest.socket;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import tk.chaber.sfn2021rest.socket.handler.EventHandling;
import tk.chaber.sfn2021rest.socket.response.EventResponding;

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
    public void afterConnectionEstablished(WebSocketSession session){
        sessions.add(session);
        System.out.println("Handler: " + eventHandlers.get(EventsEnum.TEST));
    }

    public void emitTextMessage(WebSocketSession session, HashMap<String, Object> data){
        try {
            String stringResponse = mapper.writeValueAsString(data);

            System.out.println("Raw response: " + stringResponse);

            session.sendMessage(new TextMessage(stringResponse));
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws JsonProcessingException {
        //JSON to HashMap conversion, and assigning to variables
        HashMap<String, Object> messageMap = mapper.readValue(message.getPayload(), HashMap.class);
        EventsEnum  event = EventsEnum.valueOf(((String) messageMap.get("event")).toUpperCase());
        HashMap<String, Object> headers = (HashMap<String, Object>) messageMap.get("headers"),
                                payload = (HashMap<String, Object>) messageMap.get("payload");

        System.out.println("------------------- New message received by broker -------------------");
        System.out.println("Event type: " + event);
        System.out.println("Headers: " + headers.toString());
        System.out.println("Payload: " + payload.toString());

        System.out.println("Handlers: " + eventHandlers.toString()); //DELETEME: on production

        EventHandling handler = eventHandlers.get(event);
        EventResponding response = handler.handle(payload);

        this.emitTextMessage(session, response.getRawJSONResponse());
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status){
        sessions.remove(session);
    }
}
