package tk.chaber.sfn2021rest.DB.Repositories;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.DB.User;

public interface UserRepo extends CrudRepository<User, Integer> {
}
