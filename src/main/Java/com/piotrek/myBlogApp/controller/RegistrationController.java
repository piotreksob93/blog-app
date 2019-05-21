package com.piotrek.myBlogApp.controller;

import com.piotrek.myBlogApp.entity.User;
import com.piotrek.myBlogApp.service.UserService;
import com.piotrek.myBlogApp.user.BlogUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    @Autowired
    private UserService userService;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {

        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);

        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/showRegistrationPage")
    public String showRegistrationPage(Model theModel){

        theModel.addAttribute("blogUser", new BlogUser());
        return "registration-page";
    }

    @PostMapping("/processRegistrationForm")
    public String processRegistrationForm(
            @Valid @ModelAttribute("blogUser") BlogUser theBlogUser,
            BindingResult theBindingResult,
            Model theModel) {

        String userName = theBlogUser.getUserName();
        System.out.println("Processing registration form for: " + userName);

        // form validation
        if (theBindingResult.hasErrors()){
            return "registration-page";
        }

        // check the database if user already exists
        User existing = userService.findByUserName(userName);
        if (existing != null){
            theModel.addAttribute("blogUser", new BlogUser());
            theModel.addAttribute("registrationError", "User name already exists.");

            System.out.println("User name already exists.");
            return "registration-page";
        }

        userService.save(theBlogUser);

        System.out.println("Successfully created user: " + userName);

        return "registration-confirmation";
    }
}
