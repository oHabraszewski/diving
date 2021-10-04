package tk.chaber.sfn2021rest.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.web.bind.annotation.*;
import tk.chaber.sfn2021rest.web.dto.RegisterUserDto;
import tk.chaber.sfn2021rest.web.error.AuthenticationFailedException;
import tk.chaber.sfn2021rest.web.error.UserAlreadyExistsException;
import tk.chaber.sfn2021rest.web.dto.UserDto;
import tk.chaber.sfn2021rest.UserService;
import tk.chaber.sfn2021rest.persistence.entity.User;
import tk.chaber.sfn2021rest.web.error.UserDoesNotExistException;
import tk.chaber.sfn2021rest.web.controller.registration.OnRegistrationCompleteEvent;
import tk.chaber.sfn2021rest.response.*;
import tk.chaber.sfn2021rest.response.Error;
import tk.chaber.sfn2021rest.socket.Event;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
public class UserController {
    @Autowired
    private UserService service;

    @Autowired
    ApplicationEventPublisher eventPublisher;

    @PostMapping(path = "/user/register", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    EventResponse registerUserAccount(@RequestBody @Valid RegisterUserDto userDto, HttpServletRequest request){
        try{
            User registered = service.registerNewUserAccount(userDto);

            String appUrl = request.getContextPath();
            eventPublisher.publishEvent(new OnRegistrationCompleteEvent(appUrl, registered));
        }catch(UserAlreadyExistsException uaeEx){
            System.out.println(uaeEx.getMessage());
            return new FailedResponse(Event.REGISTER_USER, Error.USER_ALREADY_EXISTS);
        }
        return new SuccessResponse(Event.REGISTER_USER);
    }

    @PostMapping(path = "/user/login", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    EventResponse loginUserAccount(@RequestBody @Valid UserDto userDto){
        try{
            User logged = service.loginUserAccount(userDto);

            return new UserResponse(Event.LOGIN_USER, logged);
        }catch(UserDoesNotExistException udneEx){
            System.out.println(udneEx.getMessage());
            return new FailedResponse(Event.LOGIN_USER, Error.USER_DOES_NOT_EXIST);
        }catch (AuthenticationFailedException afEx){
            System.out.println(afEx.getMessage());
            return new FailedResponse(Event.LOGIN_USER, Error.AUTH_FAIL);
        }
    }
}
