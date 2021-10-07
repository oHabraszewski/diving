package tk.chaber.sfn2021rest.socket.handler.board;

import tk.chaber.sfn2021rest.response.EventResponse;
import tk.chaber.sfn2021rest.socket.Event;

import java.util.HashMap;

public class ReadBoard extends BoardHandler{
    public ReadBoard() {
        super(Event.READ_BOARD);
    }

    @Override
    public EventResponse handle(HashMap<String, Object> data) {
        return null;
    }
}
