package tk.chaber.sfn2021rest.db;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.db.entities.VerificationToken;

import java.util.List;

public interface VerificationTokenRepo extends CrudRepository<VerificationToken, Long> {
    VerificationToken findByToken(String token);

    VerificationToken findByUser(User user);
}
