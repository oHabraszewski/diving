package tk.chaber.sfn2021rest.admin;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import tk.chaber.sfn2021rest.admin.handler.AdminHandler;
import tk.chaber.sfn2021rest.response.Error;
import tk.chaber.sfn2021rest.response.FailedResponse;
import tk.chaber.sfn2021rest.socket.Event;
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
public class AdminSocketBroker extends TextWebSocketHandler {

    List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();
    HashMap<AdminEvent, AdminHandler> adminHandlers = new HashMap<>();
    ObjectMapper mapper = new ObjectMapper();

    @Autowired
    private void putHandler(List<AdminHandler> handlersList){
        handlersList.forEach((AdminHandler handler) -> {
            adminHandlers.put(handler.getEvent(), handler);
        });
    }

    public AdminSocketBroker(){

    }


    @Override
    public void afterConnectionEstablished(WebSocketSession session){
        sessions.add(session);
    }

    public void emitTextMessage(WebSocketSession session, boolean success){
        try {
            HashMap<String, Object> data = new HashMap<>();
            data.put("success", success);

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
        AdminEvent event = AdminEvent.valueOf(((String) messageMap.get("event")).toUpperCase());
        @SuppressWarnings("unchecked") HashMap<String, Object> credentials = (HashMap<String, Object>) messageMap.get("credentials");
        @SuppressWarnings("unchecked") HashMap<String, Object> payload = (HashMap<String, Object>) messageMap.get("payload");

        System.out.println("------------------- New message received by broker -------------------");
        System.out.println("Event type: " + event);
        System.out.println("Payload: " + payload.toString());
        System.out.println("----------------------------------------------------------------------");

        boolean success = false;
        if(verifyAdmin((String) credentials.get("username"), (String) credentials.get("password"))){
            AdminHandler handler = adminHandlers.get(event);
            System.out.println(adminHandlers.toString());

            success = handler.handle(payload);

            this.emitTextMessage(session, success);
        }else{
            this.emitTextMessage(session, success);
        }

    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status){
        sessions.remove(session);
    }

    private boolean verifyAdmin(String username, String password){
        String pUsername = System.getenv("A_USERNAME");
        String pPass = System.getenv("A_PASSWORD");

        return username.equals(pUsername) && password.equals(pPass);
    }
}
