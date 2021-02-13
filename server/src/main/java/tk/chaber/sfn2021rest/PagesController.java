package tk.chaber.sfn2021rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PagesController {
    @GetMapping("/game")
    public String test() {
        return "game.html";
    }
}
