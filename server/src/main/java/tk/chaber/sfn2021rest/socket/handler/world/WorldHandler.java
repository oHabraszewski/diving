package tk.chaber.sfn2021rest.socket.handler.world;

import org.springframework.beans.factory.annotation.Autowired;
import tk.chaber.sfn2021rest.db.UserRepo;
import tk.chaber.sfn2021rest.db.WorldRepo;
import tk.chaber.sfn2021rest.socket.EventsEnum;
import tk.chaber.sfn2021rest.socket.handler.EventHandling;

public abstract class WorldHandler implements EventHandling {
    @Autowired
    protected WorldRepo worldRepository;

    @Autowired
    protected UserRepo userRepository;

    protected final EventsEnum event;

    public WorldHandler(EventsEnum event){
        this.event = event;
    }

    @Override
    public EventsEnum getEvent() {
        return event;
    }
}

