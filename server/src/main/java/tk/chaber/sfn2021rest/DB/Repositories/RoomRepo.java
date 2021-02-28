package tk.chaber.sfn2021rest.DB.Repositories;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.DB.Entities.RoomEntity;

public interface RoomRepo extends CrudRepository<RoomEntity, Integer> {
}
