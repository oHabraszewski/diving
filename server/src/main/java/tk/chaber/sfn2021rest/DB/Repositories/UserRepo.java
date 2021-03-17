package tk.chaber.sfn2021rest.DB.Repositories;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.DB.Entities.Users;

import java.util.List;

public interface UserRepo extends CrudRepository<Users, Integer> {
    List<Users> findByUsername(String username);

    List<Users> findByEmail(String email);

    List<Users> findByToken(byte[] token);
}
