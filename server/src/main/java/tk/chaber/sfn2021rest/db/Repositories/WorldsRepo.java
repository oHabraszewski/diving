package tk.chaber.sfn2021rest.db.Repositories;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.db.Entities.World;

public interface WorldsRepo extends CrudRepository<World, Integer> {
}
