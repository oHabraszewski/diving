package tk.chaber.sfn2021rest.socket.handler.world;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.persistence.entity.User;
import tk.chaber.sfn2021rest.persistence.entity.World;
import tk.chaber.sfn2021rest.socket.Event;
import tk.chaber.sfn2021rest.response.Error;
import tk.chaber.sfn2021rest.response.EventResponse;
import tk.chaber.sfn2021rest.response.FailedResponse;
import tk.chaber.sfn2021rest.response.SuccessResponse;

import java.util.HashMap;
import java.util.List;

@Service
public class DeleteWorld extends WorldHandler{
    public DeleteWorld() {
        super(Event.DELETE_WORLD);
    }

    @Override
    public EventResponse handle(HashMap<String, Object> data){
        String username = (String) data.get("username");
        String uniqueKey = (String) data.get("unique_key");

        @SuppressWarnings("unchecked")
        HashMap<String,Object> worldPayload = (HashMap<String, Object>) data.get("world");

        String worldName = (String) worldPayload.get("name");

        Error error;

        if(userRepository.existsByUsername(username)) {
            User owner =  userRepository.findByUsername(username);

            //if (owner.checkToken(uniqueKey)) { FIXME: you know what to do

                if (worldRepository.existsByOwnerIdAndWorldName(owner.getId(), worldName)) {
                    List<World> potentialWorlds = worldRepository.findByOwnerIdAndWorldName(owner.getId(), worldName);

                    if(potentialWorlds.size() == 1){
                        World worldToDelete = potentialWorlds.get(0);
                        worldRepository.delete(worldToDelete);

                        return new SuccessResponse(this.event);
                    }else{
                        error = Error.MULTIPLE_WORLDS_EXIST;
                    }
                } else {
                    error = Error.WORLD_DOES_NOT_EXIST;
                }
            //} else {
                //error = Error.AUTH_FAIL;
            //}
        }else {
            error = Error.USER_DOES_NOT_EXIST;
        }
        System.out.println(error.getMessage());
        return new FailedResponse(this.event,error);
    }
}
