package tk.chaber.sfn2021rest.socket.handler.world;

import org.springframework.beans.factory.annotation.Autowired;
import tk.chaber.sfn2021rest.db.UsersRepo;
import tk.chaber.sfn2021rest.db.WorldsRepo;
import tk.chaber.sfn2021rest.socket.EventsEnum;
import tk.chaber.sfn2021rest.socket.handler.EventHandling;

public abstract class WorldHandler implements EventHandling {
    @Autowired
    protected WorldsRepo worldsRepository;

    @Autowired
    protected UsersRepo usersRepository;

    protected final EventsEnum event;

    public WorldHandler(EventsEnum event){
        this.event = event;
    }

    @Override
    public EventsEnum getEvent() {
        return event;
    }
}
