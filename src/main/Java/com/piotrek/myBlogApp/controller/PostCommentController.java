package com.piotrek.myBlogApp.controller;

import com.piotrek.myBlogApp.entity.PostComments;
import com.piotrek.myBlogApp.service.PostCommentsService;
import com.piotrek.myBlogApp.service.PostService;
import com.piotrek.myBlogApp.user.PostCommentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
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
@RequestMapping("/comment")
public class PostCommentController {


    @Autowired
    private PostCommentsService postCommentsService;

    @Autowired
    private PostService postService;

    @InitBinder
    public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
        final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy:MM:dd k:m:s", locale);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping("/new")
    public String addNewComment(@RequestParam ("postId") int theId,Model theModel){

        PostCommentDto postCommentDto = new PostCommentDto();

        postCommentDto.setPost(postService.getPost(theId));

//        theModel.addAttribute("theId",theId);

        theModel.addAttribute("postComment",postCommentDto);

        return "comment-create-page";
    }

    @PostMapping("/save")
    public String saveComment(@Valid @ModelAttribute("postComment") PostCommentDto theComment, BindingResult bindingResult, Authentication authentication){

        if(bindingResult.hasErrors()){
            return "comment-create-page";
        }

        postCommentsService.save(theComment,authentication);

        return "redirect:/";
    }

    @GetMapping("/delete")
    public String deleteComment(@RequestParam("commentId") int theId){

        postCommentsService.delete(theId);
        return "redirect:/";
    }

    @GetMapping("/edit")
    public String editComment(@RequestParam("commentId") int theId,Model theModel){

        PostComments theComment = postCommentsService.getComment(theId);

        theModel.addAttribute("postComment",theComment);
        return "comment-create-page";
    }

    @GetMapping("/list")
    public String showPostCOmments(@RequestParam ("postId") int theId, Model theModel){

        theModel.addAttribute("post",postService.getPost(theId));

        return "post-comments-page";
    }

}
