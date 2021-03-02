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


@Controller
@RequestMapping(path="/demo")
public class DBController {
    @Autowired
    private UserRepo userRepository;

    @PostMapping(path="/add")
    public @ResponseBody
    String addNewUser (@RequestParam String name
            , @RequestParam String email, @RequestParam String password) {

        Users n = new Users();
        n.setUsername(name);
        n.setPassword(password);
        n.setEmail(email);
        userRepository.save(n);
        return "Saved";
    }

    @GetMapping(path="/all")
    public @ResponseBody Iterable<Users> getAllUsers() {
        return userRepository.findAll();
    }
}
