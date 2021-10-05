package tk.chaber.sfn2021rest.persistence.repository;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.persistence.entity.User;

public interface UserRepo extends CrudRepository<User, Long> {
    boolean existsByUsername(String username);

    boolean existsByEmail(String email);

    User findByUsername(String username);

    User findByEmail(String email);
}
