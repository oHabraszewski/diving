package tk.chaber.sfn2021rest.socket.handlers;

import tk.chaber.sfn2021rest.socket.EventsEnum;

import java.util.HashMap;

public interface EventHandling {
    void handle(HashMap data);

    EventsEnum getEvent();
}
