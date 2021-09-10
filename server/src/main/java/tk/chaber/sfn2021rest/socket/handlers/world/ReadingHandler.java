package tk.chaber.sfn2021rest.socket.handlers.world;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.socket.EventsEnum;

import java.util.HashMap;

@Service
public class ReadingHandler extends WorldHandler{
    public ReadingHandler() {
        super(EventsEnum.READ_WORLD);
    }

    @Override
    public void handle(HashMap data) { //TODO: code a proper reading world algorithm

    }
}
