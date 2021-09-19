package tk.chaber.sfn2021rest.socket.handlers.world;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.db.entities.World;
import tk.chaber.sfn2021rest.socket.EventsEnum;

import java.math.BigInteger;
import java.util.HashMap;

@Service
public class CreatingHandler extends WorldHandler{
    public CreatingHandler() {
        super(EventsEnum.CREATE_WORLD);
    }

    @Override
    public void handle(HashMap<String, Object> data) { //TODO: code a proper creating world algorithm
        World world = new World();

        world.setOwnerId(123312312);
        world.setWorldName((String) data.get("name"));
        world.setSeed(BigInteger.valueOf(149148943));
        world.setWorldData(data.get("world_data").toString());

        worldsRepository.save(world);
    }
}
