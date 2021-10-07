package tk.chaber.sfn2021rest.socket.handler.board;

import tk.chaber.sfn2021rest.persistence.entity.BoardRecord;
import tk.chaber.sfn2021rest.response.EventResponse;
import tk.chaber.sfn2021rest.response.RecordResponse;
import tk.chaber.sfn2021rest.socket.Event;
import tk.chaber.sfn2021rest.web.error.UserDoesNotExistException;

import java.util.HashMap;

public class ReadRecord extends BoardHandler{
    public ReadRecord() {
        super(Event.READ_RECORD);
    }

    @Override
    public RecordResponse handle(HashMap<String, Object> data) throws UserDoesNotExistException {
        String username = (String) data.get("username");

        BoardRecord record = service.readBoardRecord(username);

        return new RecordResponse(this.event, record);
    }
}
