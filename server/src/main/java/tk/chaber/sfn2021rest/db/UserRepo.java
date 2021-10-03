package tk.chaber.sfn2021rest.db;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.db.entities.User;

import java.util.List;

public interface UserRepo extends CrudRepository<User, Integer> {
    boolean existsByUsername(String username);

    List<User> findByUsername(String username);

    List<User> findByEmail(String email);

    List<User> findByToken(byte[] token);

    List<User> findById(Long id);
}
