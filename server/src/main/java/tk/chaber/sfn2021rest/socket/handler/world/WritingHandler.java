package tk.chaber.sfn2021rest.socket.handler.world;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.db.entities.World;
import tk.chaber.sfn2021rest.socket.EventsEnum;
import tk.chaber.sfn2021rest.socket.response.Error;
import tk.chaber.sfn2021rest.socket.response.EventResponding;
import tk.chaber.sfn2021rest.socket.response.FailedResponse;
import tk.chaber.sfn2021rest.socket.response.SuccessResponse;
import tk.chaber.sfn2021rest.socket.response.WorldResponse;

import java.util.HashMap;
import java.util.List;

@Service
public class WritingHandler extends WorldHandler{
    public WritingHandler() {
        super(EventsEnum.WRITE_WORLD);
    }

    @Override
    public EventResponding handle(HashMap<String, Object> data) {
        String username = (String) data.get("username");
        String uniqueKey = (String) data.get("unique_key");

        @SuppressWarnings("unchecked")
        HashMap<String,Object> worldPayload = (HashMap<String, Object>) data.get("world");

        String worldName = (String) worldPayload.get("name");
        String worldData = (String) worldPayload.get("data");

        Error error;

        if(usersRepository.existsByUsername(username)) {
            List<User> potentialOwners = usersRepository.findByUsername(username);

            if(potentialOwners.size() == 1){
                User owner = potentialOwners.get(0);

                if (owner.checkToken(uniqueKey)) {

                    if (worldsRepository.existsByOwnerIdAndWorldName(owner.getId(), worldName)) {
                        List<World> potentialWorlds = worldsRepository.findByOwnerIdAndWorldName(owner.getId(), worldName);

                        if(potentialWorlds.size() == 1){
                            World world = potentialWorlds.get(0);

                            world.setWorldData(worldData);

                            worldsRepository.save(world);

                            return new SuccessResponse(this.event);
                        }else{
                            error = Error.MULTIPLE_WORLDS_EXIST;
                        }
                    } else {
                        error = Error.WORLD_DOES_NOT_EXIST;
                    }
                } else {
                    error = Error.AUTH_FAIL;
                }
            }else {
                error = Error.MULTIPLE_USERS_EXIST;
            }
        }else {
            error = Error.USER_DOES_NOT_EXIST;
        }
        System.out.println(error.getMessage());
        return new FailedResponse(this.event, error);
    }
}

