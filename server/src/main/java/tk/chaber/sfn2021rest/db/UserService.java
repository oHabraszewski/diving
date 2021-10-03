package tk.chaber.sfn2021rest.db;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.db.entities.VerificationToken;

@Service
@Transactional
public class UserService {
    @Autowired
    private UserRepo userRepository;

    @Autowired
    private VerificationTokenRepo tokenRepository;

    @Autowired
    private PasswordEncoder passEncoder;

    public User registerNewUserAccount(RegisterUserDto userDto) throws UserAlreadyExistsException{
        if(emailExists(userDto.getEmail())){
            throw new UserAlreadyExistsException("There is an account with such an email address: " + userDto.getEmail());
        }
        User user = new User();
        user.setUsername(userDto.getUsername());
        user.setPassword(passEncoder.encode(userDto.getPassword()));
        user.setEmail(userDto.getEmail());

        return userRepository.save(user);
    }

    public void saveRegisteredUser(User user){
        userRepository.save(user);
    }

    public User getUser(String verificationToken){
        return tokenRepository.findByToken(verificationToken).getUser();
    }

    private boolean emailExists(String email){
        return userRepository.findByEmail(email) != null;
    }

    public void createVerificationToken(User user, String token){
        VerificationToken verificationToken = new VerificationToken(token, user);
        tokenRepository.save(verificationToken);
    }

    public VerificationToken getVerificationToken(String token){
        return tokenRepository.findByToken(token);
    }
}
