package tk.chaber.sfn2021rest;

import jdk.jfr.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import tk.chaber.sfn2021rest.db.UserAlreadyExistsException;
import tk.chaber.sfn2021rest.db.UserDto;
import tk.chaber.sfn2021rest.db.UserService;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.response.Error;
import tk.chaber.sfn2021rest.response.EventResponding;
import tk.chaber.sfn2021rest.response.FailedResponse;
import tk.chaber.sfn2021rest.response.SuccessResponse;
import tk.chaber.sfn2021rest.socket.EventsEnum;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
public class RegistrationController {
    @Autowired
    private UserService userService;

    @Autowired
    ApplicationEventPublisher eventPublisher;

    @PostMapping(path = "/user/register", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    EventResponding registerUserAccount(@RequestBody @Valid UserDto userDto, HttpServletRequest request){
        try{
            User registered = userService.registerNewUserAccount(userDto);

            String appUrl = request.getContextPath();
            eventPublisher.publishEvent(new OnRegistrationCompleteEvent(appUrl, registered));
        }catch(UserAlreadyExistsException ex){
            return new FailedResponse(EventsEnum.REGISTER_USER, Error.USER_ALREADY_EXISTS);
        }
        return new SuccessResponse(EventsEnum.REGISTER_USER);
    }
}
