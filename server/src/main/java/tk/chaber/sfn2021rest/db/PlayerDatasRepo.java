package tk.chaber.sfn2021rest.db;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.db.entities.PlayerData;

public interface PlayerDatasRepo extends CrudRepository<PlayerData, Integer> {
}
