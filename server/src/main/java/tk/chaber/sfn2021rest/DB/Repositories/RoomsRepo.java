package tk.chaber.sfn2021rest.DB.Repositories;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.DB.Entities.Room;

public interface RoomsRepo extends CrudRepository<Room, Integer> {
}
