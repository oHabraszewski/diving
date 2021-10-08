package tk.chaber.sfn2021rest.socket.handler.board;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.persistence.entity.BoardRecord;
import tk.chaber.sfn2021rest.response.BoardResponse;
import tk.chaber.sfn2021rest.socket.Event;

import java.util.HashMap;
import java.util.List;

@Service
public class ReadBoard extends BoardHandler{
    public ReadBoard() {
        super(Event.READ_BOARD);
    }

    @Override
    public BoardResponse handle(HashMap<String, Object> data) {
        List<BoardRecord> board = service.readTopBoard();

        return new BoardResponse(this.event, board);
    }
}
