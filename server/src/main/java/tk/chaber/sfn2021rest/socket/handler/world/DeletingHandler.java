package tk.chaber.sfn2021rest.socket.handler.world;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.db.entities.World;
import tk.chaber.sfn2021rest.socket.EventsEnum;
import tk.chaber.sfn2021rest.socket.response.EventResponding;
import tk.chaber.sfn2021rest.socket.response.FailedResponse;
import tk.chaber.sfn2021rest.socket.response.SuccessResponse;
import tk.chaber.sfn2021rest.socket.response.WorldResponse;

import java.util.HashMap;
import java.util.List;

@Service
public class DeletingHandler extends WorldHandler{
    public DeletingHandler() {
        super(EventsEnum.DELETE_WORLD);
    }

    @Override
    public EventResponding handle(HashMap<String, Object> data){
        String username = (String) data.get("username");
        String uniqueKey = (String) data.get("unique_key");

        String worldName = (String) data.get("world_name");

        String errorMsg;

        if(usersRepository.existsByUsername(username)) {
            List<User> potentialOwners = usersRepository.findByUsername(username);

            if(potentialOwners.size() == 1){
                User owner = potentialOwners.get(0);

                if (owner.checkToken(uniqueKey)) {

                    if (worldsRepository.existsByOwnerIdAndWorldName(owner.getId(), worldName)) {
                        List<World> potentialWorlds = worldsRepository.findByOwnerIdAndWorldName(owner.getId(), worldName);

                        if(potentialWorlds.size() == 1){
                            World worldToDelete = potentialWorlds.get(0);
                            worldsRepository.delete(worldToDelete);

                            return new SuccessResponse(this.event);
                        }else{
                            errorMsg = "Somehow there are 2 worlds with exactly the same names.";
                        }
                    } else {
                        errorMsg = "There is no such world.";
                    }
                } else {
                    errorMsg = "Authentication failed.";
                }
            }else {
                errorMsg = "Somehow there are 2 users with exactly the same usernames.";
            }
        }else {
            errorMsg = "There is no user with such username.";
        }
        System.out.println(errorMsg);
        return new FailedResponse(this.event,errorMsg);
    }
}
