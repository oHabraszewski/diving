package tk.chaber.sfn2021rest.socket.handler.world;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.db.entities.World;
import tk.chaber.sfn2021rest.socket.EventsEnum;

import java.util.HashMap;

@Service
public class CreatingHandler extends WorldHandler{
    public CreatingHandler() {
        super(EventsEnum.CREATE_WORLD);
    }

    @Override
    public void handle(HashMap<String, Object> data) {
        String username = (String) data.get("username");
        String uniqueKey = (String) data.get("unique_key");

        String worldName = (String) data.get("world_name");
        Long worldSeed = Long.parseLong((String) data.get("world_seed"));

        User owner = usersRepository.findByUsername(username).get(0); //FIXME: vulnerability if somehow there is 2 people with the same username.
        if(owner.checkToken(uniqueKey)){
            World world = new World();

            world.setOwnerId(owner.getId());
            world.setWorldName(worldName);
            world.setSeed(worldSeed);
            world.setWorldData("{}");

            worldsRepository.save(world);
        }else{
            System.out.println("Incorrect authentication");
        }
    }
}
