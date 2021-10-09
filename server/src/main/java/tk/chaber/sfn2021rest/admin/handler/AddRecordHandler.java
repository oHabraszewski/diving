package tk.chaber.sfn2021rest.admin.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.UserService;
import tk.chaber.sfn2021rest.admin.AdminEvent;
import tk.chaber.sfn2021rest.persistence.entity.BoardRecord;
import tk.chaber.sfn2021rest.persistence.entity.User;
import tk.chaber.sfn2021rest.socket.Event;

import java.util.HashMap;
import java.util.UUID;

@Service
public class AddRecordHandler implements AdminHandler{
    @Autowired
    private UserService service;

    protected final AdminEvent event;

    public AddRecordHandler(AdminEvent event){
        this.event = event;
    }

    @Override
    public boolean handle(HashMap<String, Object> data) {
        String username = (String) data.get("username");
        String time = (String) data.get("time");
        Long score = Long.valueOf((String) data.get("score"));

        User user = service.getUser(username);

        BoardRecord record = new BoardRecord(user, score, time);

        service.saveCreatedRecord(record);
        return true;
    }

    @Override
    public AdminEvent getEvent() {
        return event;
    }
}
