package tk.chaber.sfn2021rest.persistence.repository;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.persistence.entity.World;

import java.util.List;

public interface WorldRepo extends CrudRepository<World, Long> {
    boolean existsByOwnerIdAndWorldName(Long ownerId, String worldName);

    List<World> findByOwnerIdAndWorldName(Long ownerId, String worldName);

    List<World> findByOwnerId(Long ownerId);
}
