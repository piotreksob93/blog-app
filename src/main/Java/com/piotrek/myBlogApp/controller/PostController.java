package com.piotrek.myBlogApp.controller;

import com.piotrek.myBlogApp.entity.Post;
import com.piotrek.myBlogApp.entity.User;
import com.piotrek.myBlogApp.service.PostService;
import com.piotrek.myBlogApp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.util.Date;

@Controller
@RequestMapping("/post")
public class PostController {

    @Autowired
    private PostService postService;

    @Autowired
    private UserService userService;

    @GetMapping("/new")
    public String addNewPost(Model theModel){

        Post post = new Post();

        theModel.addAttribute("post",post);

        return "post-create-page";
    }

    @RequestMapping("/save")
    public String savePost(@ModelAttribute("post") Post thePost, Authentication authentication) throws ParseException {

        Date data = new Date();
        thePost.setEditDate(data);
        System.out.println(authentication.getName());
        User tempUser = userService.findByUserName(authentication.getName());
        thePost.setUser(tempUser);
        postService.save(thePost);

        return "redirect:/";
    }

    @GetMapping("/delete")
    public String deletePost(@RequestParam("postId") int theId){

        postService.delete(theId);
        return "redirect:/";
    }

    @GetMapping("/edit")
    public String editPost(@RequestParam("postId") int theId,Model theModel){

        Post thePost = postService.getPost(theId);

        theModel.addAttribute("post",thePost);

        return "post-create-page";
    }
}
