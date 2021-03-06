package com.piotrek.myBlogApp.service;

import com.piotrek.myBlogApp.entity.Post;
import com.piotrek.myBlogApp.dto.BlogPost;
import org.springframework.security.core.Authentication;

import java.util.List;

public interface PostService {

    List<Post> getPosts();

    void save(BlogPost thePost, Authentication authentication);

    void delete(int theId);

    Post getPost(int theId);

    List<Post> getPosts(int pageId, int postByPage);

    long countPosts();

    List<Post> searchPosts(String postTitle);
}
