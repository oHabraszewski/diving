package tk.chaber.sfn2021rest.response;

import tk.chaber.sfn2021rest.persistence.entity.BoardRecord;
import tk.chaber.sfn2021rest.persistence.entity.World;
import tk.chaber.sfn2021rest.socket.Event;

import java.util.HashMap;

public class RecordResponse extends SuccessResponse{
    public RecordResponse(Event responseToEvent, BoardRecord record) {
        super(responseToEvent);

        HashMap<String, Object> recordMap = new HashMap<>();

        recordMap.put("username", record.getUser().getUsername());
        recordMap.put("time", record.getTimeInString());
        recordMap.put("score", record.getScore());

        payloadObjects.put("record", recordMap);
    }
}
