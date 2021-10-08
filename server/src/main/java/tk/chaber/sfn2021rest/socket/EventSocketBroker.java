package tk.chaber.sfn2021rest.socket;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import tk.chaber.sfn2021rest.response.Error;
import tk.chaber.sfn2021rest.response.FailedResponse;
import tk.chaber.sfn2021rest.socket.handler.EventHandler;
import tk.chaber.sfn2021rest.response.EventResponse;
import tk.chaber.sfn2021rest.web.error.AuthenticationFailedException;
import tk.chaber.sfn2021rest.web.error.NoUserRecordException;
import tk.chaber.sfn2021rest.web.error.UserDoesNotExistException;
import tk.chaber.sfn2021rest.web.error.UserNotVerifiedException;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@Controller
public class EventSocketBroker extends TextWebSocketHandler {

    List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();
    HashMap<Event, EventHandler> eventHandlers = new HashMap<>();
    ObjectMapper mapper = new ObjectMapper();

    @Autowired
    private void putHandler(List<EventHandler> handlersList){
        handlersList.forEach((EventHandler handler) -> {
            eventHandlers.put(handler.getEvent(), handler);
        });
    }

    public EventSocketBroker(){

    }


    @Override
    public void afterConnectionEstablished(WebSocketSession session){
        sessions.add(session);
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

        @SuppressWarnings("unchecked") HashMap<String, Object> messageMap = mapper.readValue(message.getPayload(), HashMap.class);
        Event event = Event.valueOf(((String) messageMap.get("event")).toUpperCase());
        @SuppressWarnings("unchecked") HashMap<String, Object> headers = (HashMap<String, Object>) messageMap.get("headers");
        @SuppressWarnings("unchecked") HashMap<String, Object> payload = (HashMap<String, Object>) messageMap.get("payload");

        System.out.println("------------------- New message received by broker -------------------");
        System.out.println("Event type: " + event);
        System.out.println("Payload: " + payload.toString());
        System.out.println("----------------------------------------------------------------------");

        EventHandler handler = eventHandlers.get(event);
        System.out.println(eventHandlers.toString());
        EventResponse response;
        try {
            response = handler.handle(payload);
        }catch(UserDoesNotExistException udneEx){
            System.out.println(udneEx.getMessage());
            response = new FailedResponse(event, Error.USER_DOES_NOT_EXIST);
        }catch(UserNotVerifiedException unvEx){
            System.out.println(unvEx.getMessage());
            response = new FailedResponse(event, Error.USER_NOT_VERIFIED);
        }catch(AuthenticationFailedException afEx){
            System.out.println(afEx.getMessage());
            response = new FailedResponse(event, Error.AUTH_FAIL);
        }catch(NoUserRecordException nurEx){
            System.out.println(nurEx.getMessage());
            response = new FailedResponse(event, Error.NO_USER_RECORD);
        }

        this.emitTextMessage(session, response.getRawJSONResponse());
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status){
        sessions.remove(session);
    }
}
