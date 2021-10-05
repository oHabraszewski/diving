package tk.chaber.sfn2021rest.socket.handler;

import tk.chaber.sfn2021rest.socket.Event;
import tk.chaber.sfn2021rest.response.EventResponse;

import java.util.HashMap;

public interface EventHandler {
    EventResponse handle(HashMap<String, Object> data);

    Event getEvent();
}
