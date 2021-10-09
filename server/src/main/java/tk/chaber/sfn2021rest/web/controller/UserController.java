package tk.chaber.sfn2021rest.web.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.web.bind.annotation.*;
import tk.chaber.sfn2021rest.web.dto.RegisterUserDto;
import tk.chaber.sfn2021rest.web.error.*;
import tk.chaber.sfn2021rest.web.dto.UserDto;
import tk.chaber.sfn2021rest.UserService;
import tk.chaber.sfn2021rest.persistence.entity.User;
import tk.chaber.sfn2021rest.web.controller.registration.OnRegistrationCompleteEvent;
import tk.chaber.sfn2021rest.response.*;
import tk.chaber.sfn2021rest.response.Error;
import tk.chaber.sfn2021rest.socket.Event;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;

@RestController
public class UserController {
    @Autowired
    private UserService service;

    @Autowired
    ApplicationEventPublisher eventPublisher;

    ObjectMapper mapper = new ObjectMapper();

    @PostMapping(path = "/user/register", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    HashMap<String, Object> registerUserAccount(@RequestBody @Valid RegisterUserDto userDto, HttpServletRequest request){
        try{
            User registered = service.registerNewUserAccount(userDto);

            String appUrl = request.getContextPath();
            eventPublisher.publishEvent(new OnRegistrationCompleteEvent(appUrl, registered));
        }catch(UserAlreadyExistsException uaeEx){
            System.out.println(uaeEx.getMessage());
            EventResponse response = new FailedResponse(Event.REGISTER_USER, Error.USER_ALREADY_EXISTS);
            return response.getRawJSONResponse();
        }catch (EmailAlreadyExistsException eaeEx){
            System.out.println(eaeEx.getMessage());
            EventResponse response = new FailedResponse(Event.REGISTER_USER, Error.EMAIL_ALREADY_EXISTS);
            return response.getRawJSONResponse();
        }
        EventResponse response = new SuccessResponse(Event.REGISTER_USER);
        return response.getRawJSONResponse();
    }

    @PostMapping(path = "/user/login", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    HashMap<String, Object> loginUserAccount(@RequestBody @Valid UserDto userDto){
        try{
            User logged = service.loginUserAccount(userDto);

            EventResponse response = new UserResponse(Event.LOGIN_USER, logged);
            return response.getRawJSONResponse();
        }catch(UserDoesNotExistException udneEx){
            System.out.println(udneEx.getMessage());

            EventResponse response = new FailedResponse(Event.LOGIN_USER, Error.USER_DOES_NOT_EXIST);
            return response.getRawJSONResponse();
        }catch(UserNotVerifiedException unvEx){
            System.out.println(unvEx.getMessage());

            EventResponse response = new FailedResponse(Event.LOGIN_USER, Error.USER_NOT_VERIFIED);
            return  response.getRawJSONResponse();
        }catch (AuthenticationFailedException afEx){
            System.out.println(afEx.getMessage());

            EventResponse response = new FailedResponse(Event.LOGIN_USER, Error.AUTH_FAIL);
            return response.getRawJSONResponse();
        }
    }
}
