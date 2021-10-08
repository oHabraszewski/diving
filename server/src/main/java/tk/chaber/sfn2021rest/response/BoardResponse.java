package tk.chaber.sfn2021rest.response;

import tk.chaber.sfn2021rest.persistence.entity.BoardRecord;
import tk.chaber.sfn2021rest.socket.Event;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class BoardResponse extends SuccessResponse{
    public BoardResponse(Event responseToEvent, List<BoardRecord> board) {
        super(responseToEvent);
        List<HashMap<String,Object>> boardList = new ArrayList<>();
        for(BoardRecord record : board){
            HashMap<String, Object> recordMap = new HashMap<>();

            recordMap.put("username", record.getUser().getUsername());
            recordMap.put("time", record.getTimeInString());
            recordMap.put("score", record.getScore());

            boardList.add(recordMap);
        }

        payloadObjects.put("board", boardList);
    }
}
