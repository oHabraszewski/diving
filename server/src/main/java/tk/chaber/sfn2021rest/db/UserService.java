package tk.chaber.sfn2021rest.db;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.chaber.sfn2021rest.db.entities.User;

@Service
@Transactional
public class UserService {
    @Autowired
    private UserRepo userRepository;

    @Autowired
    private PasswordEncoder passEncoder;

    public User registerNewUserAccount(UserDto userDto) throws UserAlreadyExistsException{
        if(emailExists(userDto.getEmail())){
            throw new UserAlreadyExistsException("There is an account with such an email address: " + userDto.getEmail());
        }
        User user = new User();
        user.setUsername(userDto.getUsername());
        user.setPassword(passEncoder.encode(userDto.getPassword()));
        user.setEmail(userDto.getEmail());

        return userRepository.save(user);
    }

    private boolean emailExists(String email){
        return userRepository.findByEmail(email) != null;
    }
}
