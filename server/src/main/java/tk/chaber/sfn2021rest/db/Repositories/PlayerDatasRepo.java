package tk.chaber.sfn2021rest.db.Repositories;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.db.Entities.PlayerData;

public interface PlayerDatasRepo extends CrudRepository<PlayerData, Integer> {
}
