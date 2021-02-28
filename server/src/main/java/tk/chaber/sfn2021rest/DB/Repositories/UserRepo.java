package tk.chaber.sfn2021rest.DB.Repositories;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.DB.Entities.UserEntity;

public interface UserRepo extends CrudRepository<UserEntity, Integer> {
}
