package tk.chaber.sfn2021rest.socket.handler.world;

import org.springframework.beans.factory.annotation.Autowired;
import tk.chaber.sfn2021rest.persistence.repository.UserRepo;
import tk.chaber.sfn2021rest.persistence.repository.WorldRepo;
import tk.chaber.sfn2021rest.socket.Event;
import tk.chaber.sfn2021rest.socket.handler.EventHandler;

public abstract class WorldHandler implements EventHandler {
    @Autowired
    protected WorldRepo worldRepository;

    @Autowired
    protected UserRepo userRepository;

    protected final Event event;

    public WorldHandler(Event event){
        this.event = event;
    }

    @Override
    public Event getEvent() {
        return event;
    }
}

