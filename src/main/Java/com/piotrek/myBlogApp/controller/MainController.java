package com.piotrek.myBlogApp.controller;

import com.piotrek.myBlogApp.entity.Post;
import com.piotrek.myBlogApp.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    private PostService postService;

    @GetMapping("/")
    public String showHome(){
        return "redirect:/1";
    }

    @GetMapping("/{pageId}")
    public String showHomePage(@PathVariable int pageId,Model theModel){

        int postByPage = 5;
        int currentPage=pageId;

        if (pageId == 1) {

        }
        else {
            pageId=(pageId-1)*postByPage+1;
        }

        long countPosts = postService.countPosts();

        float pages = (float)countPosts/(float)postByPage;
        List<Post> posts = postService.getPosts(pageId,postByPage);

        theModel.addAttribute("posts",posts);

        theModel.addAttribute("pages",(int)Math.ceil(pages));

        theModel.addAttribute("currentPage", currentPage);

        return "main-page";
    }

}
