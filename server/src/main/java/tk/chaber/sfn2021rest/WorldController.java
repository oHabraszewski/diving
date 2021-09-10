package tk.chaber.sfn2021rest;
import org.springframework.web.bind.annotation.*;
import tk.chaber.sfn2021rest.db.WorldsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import tk.chaber.sfn2021rest.db.entities.World;
import tk.chaber.sfn2021rest.utils.Response;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/api/websocket/world")
public class WorldController {
    @Autowired
    private WorldsRepo worldsRepository;

    public boolean worldTest(Map<String, String> data) {
        World world = new World();

        System.out.println("hello");

        world.setOwnerId(123312312);
        world.setWorldName((String) data.get("name"));
        world.setSeed(BigInteger.valueOf(149148943));
        world.setWorldData(data.get("world_data").toString());

        worldsRepository.save(world);
        return true;
    }
}
