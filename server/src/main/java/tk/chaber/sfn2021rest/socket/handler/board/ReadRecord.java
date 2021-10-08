package tk.chaber.sfn2021rest.socket.handler.board;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.persistence.entity.BoardRecord;
import tk.chaber.sfn2021rest.response.EventResponse;
import tk.chaber.sfn2021rest.response.RecordResponse;
import tk.chaber.sfn2021rest.socket.Event;
import tk.chaber.sfn2021rest.web.error.UserDoesNotExistException;

import java.util.HashMap;
import java.util.List;

@Service
public class ReadRecord extends BoardHandler{
    public ReadRecord() {
        super(Event.READ_RECORD);
    }

    @Override
    public RecordResponse handle(HashMap<String, Object> data) throws UserDoesNotExistException {
        String username = (String) data.get("username");

        List<BoardRecord> records = service.readBoard();

        BoardRecord record = null;
        Integer position = 0;

        for(int i = 0; i < records.size(); i++){
            BoardRecord iRecord = records.get(i);
            if(iRecord.getUser().getUsername().equals(username)){
                record = iRecord;
                position = i;
            }
        }
        if(record == null){
            throw new UserDoesNotExistException("User does not exist.");
        }

        return new RecordResponse(this.event, record, position);
    }
}
