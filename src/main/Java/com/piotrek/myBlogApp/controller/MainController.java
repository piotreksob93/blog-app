package com.piotrek.myBlogApp.controller;

import com.piotrek.myBlogApp.entity.Post;
import com.piotrek.myBlogApp.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller

public class MainController {

    @Autowired
    private PostService postService;

    @GetMapping("/")
    public String showHomePage(Model theModel){

        List<Post> posts = postService.getPosts();

        theModel.addAttribute("posts",posts);

        return "main-page";
    }

}
