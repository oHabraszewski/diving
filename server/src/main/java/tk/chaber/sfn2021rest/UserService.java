package tk.chaber.sfn2021rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.chaber.sfn2021rest.persistence.entity.User;
import tk.chaber.sfn2021rest.persistence.entity.VerificationToken;
import tk.chaber.sfn2021rest.web.dto.RegisterUserDto;
import tk.chaber.sfn2021rest.web.dto.UserDto;
import tk.chaber.sfn2021rest.web.error.AuthenticationFailedException;
import tk.chaber.sfn2021rest.web.error.UserAlreadyExistsException;
import tk.chaber.sfn2021rest.web.error.UserDoesNotExistException;
import tk.chaber.sfn2021rest.persistence.repository.UserRepo;
import tk.chaber.sfn2021rest.persistence.repository.VerificationTokenRepo;
import tk.chaber.sfn2021rest.web.error.UserNotVerifiedException;

import java.util.UUID;

@Service
@Transactional
public class UserService {
    @Autowired
    private UserRepo userRepository;

    @Autowired
    private VerificationTokenRepo tokenRepository;

    @Autowired
    private PasswordEncoder passEncoder;

    public User loginUserAccount(UserDto userDto) throws
            UserDoesNotExistException,
            UserNotVerifiedException,
            AuthenticationFailedException {
        if(!userRepository.existsByUsername(userDto.getUsername())){
            throw new UserDoesNotExistException("There is no user with such a username: " + userDto.getUsername());
        }

        User user = userRepository.findByUsername(userDto.getUsername());

        if(!user.isEnabled()){
            throw new UserNotVerifiedException("User has not verified their email address.");
        }

        if(!passEncoder.matches(userDto.getPassword(), user.getPassword())){
            throw new AuthenticationFailedException("Authentication failed");
        }

        user.setSecret(UUID.randomUUID().toString());

        return userRepository.save(user);
    }

    public User registerNewUserAccount(RegisterUserDto userDto) throws UserAlreadyExistsException {
        System.out.println(userDto.getEmail());
        if(userRepository.existsByEmail(userDto.getEmail())){
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

    public void createVerificationToken(User user, String token){
        VerificationToken verificationToken = new VerificationToken(token, user);
        tokenRepository.save(verificationToken);
    }

    public VerificationToken getVerificationToken(String token){
        return tokenRepository.findByToken(token);
    }
}
