package tk.chaber.sfn2021rest.admin.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.UserService;
import tk.chaber.sfn2021rest.admin.AdminEvent;
import tk.chaber.sfn2021rest.persistence.entity.User;
import tk.chaber.sfn2021rest.socket.Event;

import java.util.HashMap;
import java.util.UUID;

@Service
public class CreateUserHandler implements AdminHandler{
    @Autowired
    private UserService service;

    protected final AdminEvent event;

    public CreateUserHandler(){
        this.event = AdminEvent.CREATE_USER;
    }

    @Override
    public boolean handle(HashMap<String, Object> data) {
        String username = (String) data.get("username");
        String password = (String) data.get("password");
        String secret = (data.get("unique_key") != null) ?  (String) data.get("unique_key") : UUID.randomUUID().toString();
        String email = (data.get("email") != null) ?  (String) data.get("email") : "random@email.com";

        User user = new User();
        user.setUsername(username);
        user.setPassword(service.encodePass(password));
        user.setSecret(secret);
        user.setEmail(email);
        user.setEnabled(true);

        service.saveRegisteredUser(user);
        return true;
    }

    @Override
    public AdminEvent getEvent() {
        return event;
    }
}
