package tk.chaber.sfn2021rest.socket.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.db.WorldsRepo;
import tk.chaber.sfn2021rest.db.entities.World;
import tk.chaber.sfn2021rest.socket.EventsEnum;

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
    public void handle(HashMap<String, Object> data) {
        for (Object dataEntity : data.values()){
            System.out.println(dataEntity.toString());
        }
        World world = new World();

        System.out.println(data);

        world.setOwnerId(123312313l);
        world.setWorldName((String) data.get("world_name"));
        world.setSeed(149148943l);
        world.setWorldData(data.get("world_data").toString());

        System.out.println("Repo: " + worldsRepository);
        System.out.println("New World: " + world.toString());

        worldsRepository.save(world);
    }
}
