package tk.chaber.sfn2021rest.DB.Repositories;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.DB.World;

public interface WorldRepo extends CrudRepository<World, Integer> {
}
