package tk.chaber.sfn2021rest.socket.handler.board;

import tk.chaber.sfn2021rest.response.EventResponse;
import tk.chaber.sfn2021rest.socket.Event;

import java.util.HashMap;

public class WriteRecord extends BoardHandler{
    public WriteRecord() {
        super(Event.WRITE_RECORD);
    }

    @Override
    public EventResponse handle(HashMap<String, Object> data) {
        return null;
    }
}
