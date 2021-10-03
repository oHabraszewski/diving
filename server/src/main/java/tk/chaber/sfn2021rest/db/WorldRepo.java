package tk.chaber.sfn2021rest.db;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.db.entities.World;

import java.util.List;

public interface WorldRepo extends CrudRepository<World, Integer> {
    boolean existsByOwnerIdAndWorldName(Long ownerId, String worldName);

    List<World> findByOwnerIdAndWorldName(Long ownerId, String worldName);

    List<World> findByOwnerId(Long ownerId);
}
