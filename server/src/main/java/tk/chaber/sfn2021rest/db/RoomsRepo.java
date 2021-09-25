package tk.chaber.sfn2021rest.db;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.db.entities.Room;

public interface RoomsRepo extends CrudRepository<Room, Integer> {
}
