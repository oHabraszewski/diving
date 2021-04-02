package tk.chaber.sfn2021rest.db.Repositories;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.db.Entities.Room;

public interface RoomsRepo extends CrudRepository<Room, Integer> {
}
