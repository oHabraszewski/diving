package tk.chaber.sfn2021rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import tk.chaber.sfn2021rest.DB.Entities.Users;
import tk.chaber.sfn2021rest.DB.Repositories.UserRepo;

/*
 *
 * This is starting, testing code and it'll be changed.
 *
 */

@RestController
public class UsersController {
    @Autowired
    private UserRepo userRepository;

    @PostMapping(path = "/registration", consumes = "application/json", produces = "application/json")
    public @ResponseBody Users register(@RequestBody Users user) {
        System.out.println("==== post signup ====");
        System.out.println(user.getUsername());
        return user;
    }

    @GetMapping(path="/all")
    public @ResponseBody Iterable<Users> getAllUsers() {
        return userRepository.findAll();
    }
}
