package tk.chaber.sfn2021rest.socket.handler.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.response.EventResponse;
import tk.chaber.sfn2021rest.response.FailedResponse;
import tk.chaber.sfn2021rest.response.SuccessResponse;
import tk.chaber.sfn2021rest.socket.Event;
import tk.chaber.sfn2021rest.web.dto.BoardRecordDto;
import tk.chaber.sfn2021rest.web.error.AuthenticationFailedException;
import tk.chaber.sfn2021rest.web.error.UserDoesNotExistException;
import tk.chaber.sfn2021rest.web.error.UserNotVerifiedException;

import java.util.HashMap;

@Service
public class WriteRecord extends BoardHandler{
    public WriteRecord() {
        super(Event.WRITE_RECORD);
    }

    @Override
    public SuccessResponse handle(HashMap<String, Object> data) throws
            UserDoesNotExistException,
            UserNotVerifiedException,
            AuthenticationFailedException {
        String username = (String) data.get("username");
        String uniqueKey = (String) data.get("unique_key");

        @SuppressWarnings("unchecked")
        HashMap<String,Object> boardPayload = (HashMap<String, Object>) data.get("world");

        BoardRecordDto recordDto = new BoardRecordDto(username,uniqueKey, (String) boardPayload.get("time"), Long.parseLong(String.valueOf(boardPayload.get("score"))));

        service.saveBoardRecord(recordDto);

        return new SuccessResponse(this.getEvent());
    }
}
