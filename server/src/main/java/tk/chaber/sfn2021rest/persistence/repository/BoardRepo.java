package tk.chaber.sfn2021rest.persistence.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;
import tk.chaber.sfn2021rest.persistence.entity.BoardRecord;
import tk.chaber.sfn2021rest.persistence.entity.User;

import java.util.List;

public interface BoardRepo extends CrudRepository<BoardRecord, Long> {
    List<BoardRecord> findAll();

    List<BoardRecord> findAll(Pageable page);

    boolean existsByUser(User user);

    BoardRecord findByUser(User user);
}
