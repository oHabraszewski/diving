package tk.chaber.sfn2021rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PagesController {
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
        return "login.html";
    }
}
