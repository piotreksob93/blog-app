package com.piotrek.myBlogApp.service;

import com.piotrek.myBlogApp.dao.PostDao;
import com.piotrek.myBlogApp.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class PostServiceImplementation implements PostService {

    @Autowired
    private PostDao postDao;


    @Override
    @Transactional
    public List<Post> getPosts() {
        return postDao.getPosts();
    }

    @Override
    @Transactional
    public void save(Post thePost) {
        postDao.savePost(thePost);
    }

    @Override
    @Transactional
    public void delete(int theId) {
        postDao.delete(theId);
    }

    @Override
    @Transactional
    public Post getPost(int theId) {
        return postDao.getPost(theId);
    }
}
