package tk.chaber.sfn2021rest.db;

import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.db.entities.VerificationToken;

public interface VerificationTokenRepo extends CrudRepository<VerificationToken, Integer> {
}
