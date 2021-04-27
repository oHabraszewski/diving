package tk.chaber.sfn2021rest;

import org.hibernate.exception.JDBCConnectionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.web.bind.annotation.*;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.db.UsersRepo;
import tk.chaber.sfn2021rest.utils.Hasher;
import tk.chaber.sfn2021rest.utils.Randomizer;
import tk.chaber.sfn2021rest.utils.Response;

import javax.naming.CommunicationException;
import javax.persistence.PersistenceException;
import java.util.Arrays;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RestController
public class UsersController {
    @Autowired
    private UsersRepo usersRepository;

    private Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    @PostMapping(path = "/registerValidation", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    Response register(@RequestBody Map<String, String> data) {

        String username = data.get("username");
        String password = data.get("password");
        String email = data.get("email");

        if(username.length() > 24){
            return new Response(false, "Username can have up to 24 characters, please choose shorter one.", null);
        }

        if(password.length() < 8 || password.length() > 32){
            return new Response(false, "Password must have from 8 to 32 characters.", null);
        }

        if(email.length() > 256){
            return new Response(false, "Email can have up to 256 characters. (where did you create such long email, huh?)", null);
        }

        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(email);
        if(!matcher.find()){
            return new Response(false, "It's not a proper email!", null);
        }
        try {
            if(usersRepository.findByUsername(username).size() > 0){
                return new Response(false, "There is already a player with such username, choose another one!", null);
            }
            if(usersRepository.findByEmail(email).size() > 0){
                return new Response(false, "There is already an account with such an email!", null);
            }

            String UK = Long.toHexString(Randomizer.randomLong());

            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            user.setToken(UK);

            usersRepository.save(user);

            System.out.println("==== post signup ====");
            return new Response(true, null, UK);
        }catch(DataAccessResourceFailureException exception) {
            System.out.println("Database Exception");
            return new Response(false, "Server cannot connect to the database, please try again later or contact with developers.", null);
        }
    }

    @PostMapping(path = "/loginValidation", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    Response login(@RequestBody Map<String, String> data) {

        String username = data.get("username");
        String passToCheck = data.get("password");

        if(username.length() > 24){
            return new Response(false, "Username can have up to 24 characters, please choose shorter one.", null);
        }

        if(passToCheck.length() < 8 || passToCheck.length() > 32){
            return new Response(false, "Password must have from 8 to 32 characters.", null);
        }

        try {
            if(usersRepository.findByUsername(username).size() == 0){
                return new Response(false, "There is no player with such username, register!", null);
            }

            User user = usersRepository.findByUsername(username).get(0);

            byte[] correctPassword = user.getPassword();
            byte[] userSalt = user.getSalt();


            byte[] hashedPassword = Hasher.hashWithSalt(passToCheck, userSalt);

            if(Arrays.equals(correctPassword, hashedPassword)){
                System.out.println("==== post login ====");
                String UK = Long.toHexString(Randomizer.randomLong());

                System.out.println(UK);

                user.setToken(UK);
                usersRepository.save(user);

                return new Response(true, null, UK);
            }else{
                return new Response(false, "This password is not correct, try again (make sure your caps lock is off)", null);
            }
        }catch(DataAccessResourceFailureException exception) {
            System.out.println("Database Exception");
            return new Response(false, "Server cannot connect to the database, please try again later or contact with developers.", null);
        }
        catch(Exception e){
            e.printStackTrace();
            return new Response(false, "Unknown exception, more details: " + e.getMessage(), null);
        }
    }

    @GetMapping(path="/all")
    public @ResponseBody Iterable<User> getAllUsers() {
        return usersRepository.findAll();
    }
}
