package tk.chaber.sfn2021rest.socket.handlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.db.WorldsRepo;
import tk.chaber.sfn2021rest.db.entities.World;
import tk.chaber.sfn2021rest.socket.EventsEnum;

import java.math.BigInteger;
import java.util.HashMap;

@Service
public class TestHandler implements EventHandling {
    @Autowired
    private WorldsRepo worldsRepository;

    private final EventsEnum event = EventsEnum.TEST;

    @Override
    public EventsEnum getEvent() {
        return event;
    }

    @Override
    public void handle(HashMap data) {
        for (Object dataEntity : data.values()){
            System.out.println(dataEntity.toString());
        }
        World world = new World();

        System.out.println(data);

        world.setOwnerId(123312312);
        world.setWorldName((String) data.get("name"));
        world.setSeed(BigInteger.valueOf(149148943));
        world.setWorldData(data.get("world_data").toString());

        System.out.println("Repo: " + worldsRepository);

        worldsRepository.save(world);
    }
}
