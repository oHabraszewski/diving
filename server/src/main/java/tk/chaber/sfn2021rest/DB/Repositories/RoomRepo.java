package tk.chaber.sfn2021rest.DB.Repositories;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.DB.Entities.Rooms;

public interface RoomRepo extends CrudRepository<Rooms, Integer> {
}
