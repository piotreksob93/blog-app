package com.piotrek.myBlogApp.service;

import com.piotrek.myBlogApp.entity.Post;
import com.piotrek.myBlogApp.user.BlogPost;
import org.springframework.security.core.Authentication;

import java.util.List;

public interface PostService {

    List<Post> getPosts();

    void save(BlogPost thePost, Authentication authentication);

    void delete(int theId);

    Post getPost(int theId);
}
