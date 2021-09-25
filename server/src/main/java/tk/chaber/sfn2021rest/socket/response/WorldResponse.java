package tk.chaber.sfn2021rest.socket.response;

import tk.chaber.sfn2021rest.db.entities.World;

import java.util.HashMap;

public class WorldResponse extends SuccessResponse{
    public WorldResponse(String responseToEvent, World world) {
        super(responseToEvent);

        HashMap<String, Object> worldJSON = new HashMap<>();

        worldJSON.put("name", world.getWorldName());
        worldJSON.put("seed", world.getSeed());
        worldJSON.put("data", world.getWorldData());

        payloadObjects.put("world", worldJSON);
    }
}
