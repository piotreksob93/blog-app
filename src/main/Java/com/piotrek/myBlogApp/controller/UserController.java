package com.piotrek.myBlogApp.controller;

import com.piotrek.myBlogApp.entity.User;
import com.piotrek.myBlogApp.service.UserService;
import com.piotrek.myBlogApp.user.BlogUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;


@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @InitBinder
    public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
        final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy:MM:dd k:m:s", locale);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping("/profile")
    public String showUserPanel(@RequestParam("username") String userName, Model theModel){

        User user = userService.findByUserName(userName);
        BlogUser blogUser = new BlogUser();

        blogUser.setId(user.getId());
        blogUser.setUserName(user.getUserName());
        blogUser.setPassword(user.getPassword());
        blogUser.setFirstName(user.getFirstName());
        blogUser.setLastName(user.getLastName());
        blogUser.setEmail(user.getEmail());
        blogUser.setRole(user.getRole());
        blogUser.setPosts(user.getPosts());
        theModel.addAttribute("user", blogUser);
        return "user-profile-page";
    }


    @PostMapping("/edit")
    public String showUserEditPage(@ModelAttribute("user") BlogUser theBlogUser){

        return "user-profile-edit-page";
    }

    @PostMapping("/processUserUpdate")
    public String updateUser(@Valid @ModelAttribute("user") BlogUser theBlogUser,
                             BindingResult bindingResult){

//        if (bindingResult.hasErrors()){
//
//            //tutaj trzeba poprawić żeby nie łapało błędu z pól z hasłem
//            return "user-profile-edit-page";
//        }

        userService.save(theBlogUser);


        String redirectLink = "redirect:/user/profile?username=" + theBlogUser.getUserName();

        return redirectLink;
    }
}