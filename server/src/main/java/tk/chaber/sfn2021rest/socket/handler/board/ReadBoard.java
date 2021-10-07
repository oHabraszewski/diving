package tk.chaber.sfn2021rest.socket.handler.board;

import tk.chaber.sfn2021rest.persistence.entity.BoardRecord;
import tk.chaber.sfn2021rest.response.BoardResponse;
import tk.chaber.sfn2021rest.response.EventResponse;
import tk.chaber.sfn2021rest.socket.Event;

import java.util.HashMap;
import java.util.List;

public class ReadBoard extends BoardHandler{
    public ReadBoard() {
        super(Event.READ_BOARD);
    }

    @Override
    public BoardResponse handle(HashMap<String, Object> data) {
        List<BoardRecord> board = service.readBoard();

        return new BoardResponse(this.event, board);
    }
}
