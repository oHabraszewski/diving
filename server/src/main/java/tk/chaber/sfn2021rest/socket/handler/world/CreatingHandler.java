package tk.chaber.sfn2021rest.socket.handler.world;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.db.entities.World;
import tk.chaber.sfn2021rest.socket.EventsEnum;
import tk.chaber.sfn2021rest.socket.response.EventResponding;
import tk.chaber.sfn2021rest.socket.response.FailedResponse;
import tk.chaber.sfn2021rest.socket.response.WorldResponse;
import tk.chaber.sfn2021rest.utils.Randomizer;

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

        @SuppressWarnings("unchecked")
        HashMap<String,Object> worldPayload = (HashMap<String, Object>) data.get("world");

        String worldName;
        long worldSeed;
        String worldData;

        String errorMsg;

        try {
            String rawName = (String) worldPayload.get("name");
            Long rawSeed = (Long) worldPayload.get("seed");
            String rawData = (String) worldPayload.get("data");
            //Data validation and generation if needed.
            worldName = rawName;
            worldSeed = rawSeed == null ? Randomizer.randomLong() : rawSeed;
            worldData = rawData == null || rawData.equals("")  ? "{}" : rawData;
        }catch(ClassCastException ex){
            errorMsg = "There was problem during casting data. Numerical data should be send as number, not as string.";
            return new FailedResponse(this.event, errorMsg);
        }

        if(usersRepository.existsByUsername(username)) {
            List<User> potentialOwners = usersRepository.findByUsername(username);

            if(potentialOwners.size() == 1){
                User owner = potentialOwners.get(0);

                if (owner.checkToken(uniqueKey)) {

                    if(!worldsRepository.existsByOwnerIdAndWorldName(owner.getId(), worldName)) {
                        World world = new World();

                        world.setOwnerId(owner.getId());
                        world.setWorldName(worldName);
                        world.setSeed(worldSeed);
                        world.setWorldData(worldData);

                        worldsRepository.save(world);

                        return new WorldResponse(this.event, world);
                    }else{
                        errorMsg = "There is already a world with such name.";
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
        return new FailedResponse(this.event, errorMsg);
    }
}
