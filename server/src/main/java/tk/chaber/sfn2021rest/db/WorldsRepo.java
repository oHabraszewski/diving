package tk.chaber.sfn2021rest.db;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.db.entities.World;

public interface WorldsRepo extends CrudRepository<World, Integer> {
}
