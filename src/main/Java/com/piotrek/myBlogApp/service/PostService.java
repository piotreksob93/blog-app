package com.piotrek.myBlogApp.service;

import com.piotrek.myBlogApp.entity.Post;

import java.util.List;

public interface PostService {

    List<Post> getPosts();

    void save(Post thePost);

    void delete(int theId);

    Post getPost(int theId);
}
