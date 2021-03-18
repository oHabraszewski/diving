package tk.chaber.sfn2021rest.DB.Repositories;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.DB.Entities.User;

import java.util.List;

public interface UsersRepo extends CrudRepository<User, Integer> {
    List<User> findByUsername(String username);

    List<User> findByEmail(String email);

    List<User> findByToken(byte[] token);
}
