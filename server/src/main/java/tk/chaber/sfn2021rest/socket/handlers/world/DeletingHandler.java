package tk.chaber.sfn2021rest.socket.handlers.world;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.db.entities.World;
import tk.chaber.sfn2021rest.socket.EventsEnum;

import java.util.HashMap;
import java.util.List;

@Service
public class DeletingHandler extends WorldHandler{
    public DeletingHandler() {
        super(EventsEnum.DELETE_WORLD);
    }

    @Override
    public void handle(HashMap<String, Object> data) throws Exception{ //TODO: code a proper deleting world algorithm - owner validation using UK/TOKEN
        Integer ownerId = Integer.parseInt((String) data.get("owner_id"));
        String worldName = (String) data.get("world_name");

        List<World> worldsToDelete = worldsRepository.findByOwnerIdAndWorldName(ownerId, worldName);

        if(worldsToDelete.size() > 1){
            System.out.println("There was issue during deleting world: There is more than 1 world with such name.");
            throw new Exception("There was issue during deleting world: There is more than 1 world with such name.");
        }else {
            System.out.println(worldsToDelete.toString());
            worldsRepository.delete(worldsToDelete.get(0));
        }
    }
}
