package tk.chaber.sfn2021rest.socket.handler;

import tk.chaber.sfn2021rest.socket.EventsEnum;
import tk.chaber.sfn2021rest.socket.response.EventResponding;

import java.util.HashMap;

public interface EventHandling {
    EventResponding handle(HashMap<String, Object> data);

    EventsEnum getEvent();
}
