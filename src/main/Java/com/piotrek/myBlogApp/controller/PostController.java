package com.piotrek.myBlogApp.controller;

import com.piotrek.myBlogApp.entity.Post;
import com.piotrek.myBlogApp.entity.User;
import com.piotrek.myBlogApp.service.PostService;
import com.piotrek.myBlogApp.user.BlogPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/post")
public class PostController {

    @Autowired
    private PostService postService;

    @GetMapping("/new")
    public String addNewPost(Model theModel){

        BlogPost post = new BlogPost();

        theModel.addAttribute("post",post);

        return "post-create-page";
    }

    @PostMapping("/save")
    public String savePost(@Valid @ModelAttribute("post") BlogPost thePost, BindingResult bindingResult, Authentication authentication){

        if(bindingResult.hasErrors()){
            return "post-create-page";
        }

        postService.save(thePost,authentication);

        return "redirect:/1";
    }

    @GetMapping("/delete")
    public String deletePost(@RequestParam("postId") int theId){

        postService.delete(theId);
        return "redirect:/1";
    }

    @GetMapping("/edit")
    public String editPost(@RequestParam("postId") int theId,Model theModel){

        Post thePost = postService.getPost(theId);

        theModel.addAttribute("post",thePost);
        return "post-create-page";
    }
}
