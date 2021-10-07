package tk.chaber.sfn2021rest.response;

import tk.chaber.sfn2021rest.persistence.entity.BoardRecord;
import tk.chaber.sfn2021rest.socket.Event;

import java.util.HashMap;
import java.util.List;

public class BoardResponse extends SuccessResponse{
    public BoardResponse(Event responseToEvent, List<BoardRecord> board) {
        super(responseToEvent);

        payloadObjects.put("board", board);
    }
}
