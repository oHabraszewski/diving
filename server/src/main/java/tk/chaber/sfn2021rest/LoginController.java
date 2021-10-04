package tk.chaber.sfn2021rest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import tk.chaber.sfn2021rest.db.RegisterUserDto;
import tk.chaber.sfn2021rest.db.UserDto;
import tk.chaber.sfn2021rest.response.EventResponding;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
public class LoginController {
//    @PostMapping(path = "user/login", consumes = "application/json", produces = "application/json")
//    public @ResponseBody
//    EventResponding loginUser(@RequestBody @Valid UserDto userDto, HttpServletRequest request){
//
//    }
}
