package com.piotrek.myBlogApp.service;

import com.piotrek.myBlogApp.entity.Post;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface PostService {

    List<Post> getPosts();
}
