package tk.chaber.sfn2021rest.socket.handlers;

import tk.chaber.sfn2021rest.socket.EventsEnum;

import java.util.HashMap;

public interface EventHandling {
    void handle(HashMap<String, Object> data) throws Exception; //TODO: Make custom Exceptions and implement them.

    EventsEnum getEvent();
}
