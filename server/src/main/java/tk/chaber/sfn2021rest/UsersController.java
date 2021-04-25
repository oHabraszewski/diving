package tk.chaber.sfn2021rest;

import org.hibernate.exception.JDBCConnectionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.web.bind.annotation.*;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.db.UsersRepo;
import tk.chaber.sfn2021rest.utils.ConfigVars;
import tk.chaber.sfn2021rest.utils.Hasher;
import tk.chaber.sfn2021rest.utils.Randomizer;
import tk.chaber.sfn2021rest.utils.Response;

import javax.naming.CommunicationException;
import javax.persistence.PersistenceException;
import java.util.Arrays;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
RLS (in ..."/rls") - Register and Login System
 */

@RestController
@RequestMapping(ConfigVars.API_PREFIX + "/rls")
public class UsersController {
    //Autoconnection of Hibernate database with variable by @Autowired
    @Autowired
    private UsersRepo usersRepository;

    //Pattern for email validation. TODO: make it more reliable and strict
    private Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    //Register mapping, creates mount point for register request from client.
    @PostMapping(path = "/register", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    Response register(@RequestBody Map<String, String> data) {

        //Gathering data from request into variables, using modern Java syntax for same-type variables.
        String  username = data.get("username"),
                password = data.get("password"),
                email = data.get("email");

        //Username validation
        if(username.length() > 24){
            return new Response(false, "Username can have up to 24 characters, please choose shorter one.", null);
        }

        //Password validation
        if(password.length() < 8 || password.length() > 32){
            return new Response(false, "Password must have from 8 to 32 characters.", null);
        }
        //Email validation
        if(email.length() > 256){
            return new Response(false, "Email can have up to 256 characters. (where did you create such long email, huh?)", null);
        }
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(email);
        if(!matcher.find()){
            return new Response(false, "It's not a proper email!", null);
        }

        //Try/Catch block for catching exceptions with database-server connectivity
        try {
            //Checking if there is already player with such username
            if(usersRepository.findByUsername(username).size() > 0){
                return new Response(false, "There is already a player with such username, choose another one!", null);
            }

            //Checking if there is already player with such email
            if(usersRepository.findByEmail(email).size() > 0){
                return new Response(false, "There is already an account with such an email!", null);
            }

            //Generating UniqueKey, used for token generation
            String UK = Long.toHexString(Randomizer.randomLong());

            //Creating new User instance
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            user.setToken(UK);

            //Saving new user in database
            usersRepository.save(user);

            //Sending response with UniqueKey, which will be stored in client for holding login session
            System.out.println("==== post signup ====");
            return new Response(true, null, UK);
        }
        catch(DataAccessResourceFailureException exception) {
            //Sending response with error message if database is unavailable
            System.out.println("Database Exception");
            return new Response(false, "Server cannot connect to the database, please try again later or contact with developers.", null);
        }
        catch(Exception e){
            //Sending response with error message if there is exception with unknown reason
            e.printStackTrace();
            return new Response(false, "Unknown exception, more details: " + e.getMessage(), null);
        }
    }

    //Login mapping, creates mount point for login request from client.
    @PostMapping(path = "/login", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    Response login(@RequestBody Map<String, String> data) {

        //Gathering data from request into variables, using modern Java syntax for same-type variables.
        String  username = data.get("username"),
                passToCheck = data.get("password");

        //Username validation
        if(username.length() > 24){
            return new Response(false, "Username can have up to 24 characters, please choose shorter one.", null);
        }

        //Password validation
        if(passToCheck.length() < 8 || passToCheck.length() > 32){
            return new Response(false, "Password must have from 8 to 32 characters.", null);
        }

        //Try/Catch block for catching exceptions with database-server connectivity
        try {
            //Checking if there is player with such username
            if(usersRepository.findByUsername(username).size() == 0){
                return new Response(false, "There is no player with such username, register!", null);
            }

            //Getting user from database
            User user = usersRepository.findByUsername(username).get(0);

            //Creating variables containing right password
            byte[]  correctPassword = user.getPassword(),
                    userSalt = user.getSalt();

            //Creating variable containing password to check (password provided in login form)
            byte[] hashedPassword = Hasher.hashWithSalt(passToCheck, userSalt);

            //Checking if passwords are the same
            if(Arrays.equals(correctPassword, hashedPassword)){
                System.out.println("==== post login ====");

                //Generating UniqueKey, used for token generation
                String UK = Long.toHexString(Randomizer.randomLong());

                System.out.println(UK);

                //Updating token in the user
                user.setToken(UK);

                //Saving updated user in database
                usersRepository.save(user);

                //Sending response with new UniqueKey, which will be stored in client for holding login session
                return new Response(true, null, UK);
            }else{
                //Sending response with error message if password is incorrect
                return new Response(false, "This password is not correct, try again (make sure your caps lock is off)", null);
            }
        }catch(DataAccessResourceFailureException exception) {
            //Sending response with error message if database is unavailable
            System.out.println("Database Exception");
            return new Response(false, "Server cannot connect to the database, please try again later or contact with developers.", null);
        }
        catch(Exception e){
            //Sending response with error message if there is exception with unknown reason
            e.printStackTrace();
            return new Response(false, "Unknown exception, more details: " + e.getMessage(), null);
        }
    }

    //Dev-mode mapping, for getting response with all users TODO: remove on production
    @GetMapping(path="/all")
    public @ResponseBody Iterable<User> getAllUsers() {
        return usersRepository.findAll();
    }
}
