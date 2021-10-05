package tk.chaber.sfn2021rest.response;

import tk.chaber.sfn2021rest.persistence.entity.User;
import tk.chaber.sfn2021rest.socket.Event;

import java.util.HashMap;

public class UserResponse extends SuccessResponse{
    public UserResponse(Event responseToEvent, User user) {
        super(responseToEvent);

        HashMap<String, Object> userMap= new HashMap<>();

        userMap.put("username", user.getUsername());
        userMap.put("secret", user.getSecret());

        payloadObjects.put("user", userMap);
    }
}
