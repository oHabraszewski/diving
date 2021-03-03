package tk.chaber.sfn2021rest.DB.Repositories;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.DB.Entities.PlayerDatas;

public interface PlayerDataRepo extends CrudRepository<PlayerDatas, Integer> {
}
