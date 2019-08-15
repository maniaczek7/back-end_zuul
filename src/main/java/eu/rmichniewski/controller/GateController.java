package eu.rmichniewski.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GateController {

    @GetMapping(value = "/")
    public String redirect() {
        return "forward:/ui/";
    }
}