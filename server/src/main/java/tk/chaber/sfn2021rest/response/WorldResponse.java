package tk.chaber.sfn2021rest.response;

import tk.chaber.sfn2021rest.persistence.entity.World;
import tk.chaber.sfn2021rest.socket.Event;

import java.util.HashMap;

public class WorldResponse extends SuccessResponse{
    public WorldResponse(Event responseToEvent, World world) {
        super(responseToEvent);

        HashMap<String, Object> worldMap = new HashMap<>();

        worldMap.put("name", world.getWorldName());
        worldMap.put("seed", world.getSeed());
        worldMap.put("data", world.getWorldData());

        payloadObjects.put("world", worldMap);
    }
}
