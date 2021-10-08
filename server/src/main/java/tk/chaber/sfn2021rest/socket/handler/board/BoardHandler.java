package tk.chaber.sfn2021rest.socket.handler.board;

import org.springframework.beans.factory.annotation.Autowired;
import tk.chaber.sfn2021rest.UserService;
import tk.chaber.sfn2021rest.socket.Event;
import tk.chaber.sfn2021rest.socket.handler.EventHandler;

public abstract class BoardHandler implements EventHandler {
    @Autowired
    protected UserService service;

    protected final Event event;

    public BoardHandler(Event event){
        this.event = event;
    }

    @Override
    public Event getEvent() {
        return event;
    }
}
