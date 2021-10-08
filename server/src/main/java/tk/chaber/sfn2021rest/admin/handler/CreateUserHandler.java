package tk.chaber.sfn2021rest.admin.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.UserService;
import tk.chaber.sfn2021rest.admin.AdminEvent;
import tk.chaber.sfn2021rest.socket.Event;

import java.util.HashMap;

@Service
public class CreateUserHandler implements AdminHandler{
    @Autowired
    private UserService service;

    protected final AdminEvent event;

    public CreateUserHandler(AdminEvent event){
        this.event = event;
    }

    @Override
    public boolean handle(HashMap<String, Object> data) {
        return false;
    }

    @Override
    public AdminEvent getEvent() {
        return event;
    }
}
