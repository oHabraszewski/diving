package tk.chaber.sfn2021rest.socket.handler.world;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.socket.EventsEnum;
import tk.chaber.sfn2021rest.socket.response.EventResponding;
import tk.chaber.sfn2021rest.socket.response.FailedResponse;

import java.util.HashMap;

@Service
public class ReadingHandler extends WorldHandler{
    public ReadingHandler() {
        super(EventsEnum.READ_WORLD);
    }

    @Override
    public EventResponding handle(HashMap<String, Object> data) { //TODO: code a proper reading world algorithm
        return new FailedResponse(this.event);
    }
}
