package com.piotrek.myBlogApp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/showLogin")
    public String showLoginPage(){
        return "custom-login-page";
    }


    @GetMapping("/access-denied")
    public String showAccessDeniedPage(){
        return "access-denied";
    }


}
