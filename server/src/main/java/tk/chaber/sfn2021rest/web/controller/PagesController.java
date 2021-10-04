package tk.chaber.sfn2021rest.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import tk.chaber.sfn2021rest.UserService;
import tk.chaber.sfn2021rest.persistence.entity.User;
import tk.chaber.sfn2021rest.persistence.entity.VerificationToken;

import java.util.Calendar;
import java.util.Locale;

@Controller
public class PagesController {
    @Autowired
    private UserService service;

    //Mappings for all pages
    @GetMapping("/game")
    public String game() {
        return "game.html";
    }

    @GetMapping("/credits")
    public String credits() {
        return "credits.html";
    }

    @GetMapping("/technical")
    public String technical() {
        return "technical.html";
    }

    @GetMapping("/register")
    public String register() {
        return "register.html";
    }

    @GetMapping("/registrationConfirm")
    public String confirmRegistration(WebRequest request, @RequestParam("token") String token){
        Locale locale = request.getLocale();

        VerificationToken verificationToken = service.getVerificationToken(token);

        if(verificationToken == null){
            //token is null
        }

        User user = verificationToken.getUser();
        Calendar cal = Calendar.getInstance();
        if((verificationToken.getExpiryDate().getTime() - cal.getTime().getTime()) <= 0){
            //Out of time
        }

        user.setEnabled(true);
        service.saveRegisteredUser(user);
        return "redirect:/";
    }
}
