package tk.chaber.sfn2021rest.socket.handler.world;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.db.entities.World;
import tk.chaber.sfn2021rest.socket.EventsEnum;
import tk.chaber.sfn2021rest.socket.response.EventResponding;
import tk.chaber.sfn2021rest.socket.response.FailedResponse;
import tk.chaber.sfn2021rest.socket.response.WorldResponse;

import java.util.HashMap;
import java.util.List;

@Service
public class CreatingHandler extends WorldHandler{
    public CreatingHandler() {
        super(EventsEnum.CREATE_WORLD);
    }

    @Override
    public EventResponding handle(HashMap<String, Object> data) {
        String username = (String) data.get("username");
        String uniqueKey = (String) data.get("unique_key");

        String worldName = (String) data.get("world_name");
        Long worldSeed = Long.parseLong((String) data.get("world_seed"));

        String errorMsg;

        if(usersRepository.existsByUsername(username)) {
            List<User> potentialOwners = usersRepository.findByUsername(username);

            if(potentialOwners.size() == 1){
                User owner = potentialOwners.get(0);

                if (owner.checkToken(uniqueKey)) {
                    World world = new World();

                    world.setOwnerId(owner.getId());
                    world.setWorldName(worldName);
                    world.setSeed(worldSeed);
                    world.setWorldData("{}");

                    worldsRepository.save(world);

                    return new WorldResponse(this.event, world);
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
        return new FailedResponse(this.event, errorMsg);
    }
}
