package tk.chaber.sfn2021rest.DB.Repositories;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.DB.Entities.PlayerDataEntity;

public interface PlayerDataRepo extends CrudRepository<PlayerDataEntity, Integer> {
}