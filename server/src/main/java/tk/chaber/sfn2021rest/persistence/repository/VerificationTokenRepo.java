package tk.chaber.sfn2021rest.persistence.repository;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.persistence.entity.User;
import tk.chaber.sfn2021rest.persistence.entity.VerificationToken;

public interface VerificationTokenRepo extends CrudRepository<VerificationToken, Long> {
    VerificationToken findByToken(String token);

    VerificationToken findByUser(User user);
}
