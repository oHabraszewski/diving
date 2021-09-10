package tk.chaber.sfn2021rest.db;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.db.entities.World;

import java.util.List;

public interface WorldsRepo extends CrudRepository<World, Integer> {
    List<User> findByWorldName(String worldName);
}
