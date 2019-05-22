package com.piotrek.myBlogApp.dao;

import com.piotrek.myBlogApp.entity.Post;

import java.util.List;

public interface PostDao {

    List<Post> getPosts();

    void savePost(Post thePost);

    void delete(int theId);

    Post getPost(int theId);
}
