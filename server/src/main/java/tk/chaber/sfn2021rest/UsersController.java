package tk.chaber.sfn2021rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tk.chaber.sfn2021rest.DB.Entities.Users;
import tk.chaber.sfn2021rest.DB.Repositories.UserRepo;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 *
 * This is starting, testing code and it'll be changed.
 *
 */

@RestController
public class UsersController {
    @Autowired
    private UserRepo userRepository;
    private Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    @PostMapping(path = "/registerValidation", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    Response register(@RequestBody Map<String, String> data) {

        String username = data.get("username");
        String password = data.get("password");
        String email = data.get("email");

        if(username.length() > 24){
            return new Response("Username can have up to 24 characters, please choose shorter one.", null);
        }

        if(password.length() < 8 || password.length() > 32){
            return new Response("Password must have from 8 to 32 characters.", null);
        }

        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(email);
        if(!matcher.find()){
            return new Response("It's not a proper email!", null);
        }

        if(userRepository.findByUsername(username).size() > 0){
            return new Response("There is already a player with such username, choose another one!", null);
        }
        if(userRepository.findByEmail(email).size() > 0){
            return new Response("There is already an account with such an email!", null);
        }

        Users user = new Users();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setSession();

        userRepository.save(user);

        System.out.println("==== post signup ====");
        return new Response(null, user.getSession());
    }

    @GetMapping(path="/all")
    public @ResponseBody Iterable<Users> getAllUsers() {
        return userRepository.findAll();
    }
}
