package tk.chaber.sfn2021rest.socket.handler.world;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.db.entities.World;
import tk.chaber.sfn2021rest.socket.EventsEnum;
import tk.chaber.sfn2021rest.response.Error;
import tk.chaber.sfn2021rest.response.EventResponding;
import tk.chaber.sfn2021rest.response.FailedResponse;
import tk.chaber.sfn2021rest.response.WorldResponse;
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

        Error error;

        try {
            String rawName = (String) worldPayload.get("name");
            Long rawSeed = (Long) worldPayload.get("seed");
            String rawData = (String) worldPayload.get("data");

            int random = Randomizer.randomInt();
            System.out.println(random); //DELETEME: on prod
            //Data validation and generation if needed.
            worldName = rawName;
            worldSeed = rawSeed == null ? random : rawSeed;
            worldData = rawData == null || rawData.equals("")  ? "{}" : rawData;

            worldSeed += 2147483647;
        }catch(ClassCastException ex){
            return new FailedResponse(this.event, Error.CASTING_IMPOSSIBLE);
        }

        if(userRepository.existsByUsername(username)) {
            List<User> potentialOwners = userRepository.findByUsername(username);

            if(potentialOwners.size() == 1){
                User owner = potentialOwners.get(0);

                if (owner.checkToken(uniqueKey)) {
                    Long ownerId = owner.getId();
                    List<World> ownersWorlds = worldRepository.findByOwnerId(ownerId);

                    if(ownersWorlds.size() < 10) {

                        if (!worldRepository.existsByOwnerIdAndWorldName(ownerId, worldName)) {
                            World world = new World();

                            world.setOwnerId(owner.getId());
                            world.setWorldName(worldName);
                            world.setSeed(worldSeed);
                            world.setWorldData(worldData);

                            worldRepository.save(world);

                            return new WorldResponse(this.event, world);
                        } else {
                            error = Error.WORLD_EXISTS;
                        }
                    }else {
                        error = Error.WORLD_NUMBER_LIMIT;
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
