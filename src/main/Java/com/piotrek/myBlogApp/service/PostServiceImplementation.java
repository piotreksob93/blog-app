package com.piotrek.myBlogApp.service;

import com.piotrek.myBlogApp.dao.PostDao;
import com.piotrek.myBlogApp.entity.Post;
import com.piotrek.myBlogApp.entity.User;
import com.piotrek.myBlogApp.user.BlogPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Repository
public class PostServiceImplementation implements PostService {

    @Autowired
    private PostDao postDao;

    @Autowired
    private UserService userService;


    @Override
    @Transactional
    public List<Post> getPosts() {
        return postDao.getPosts();
    }

    @Override
    @Transactional
    public void save(BlogPost thePost, Authentication authentication) {
        Post tempPost = new Post();
        tempPost.setId(thePost.getId());

        tempPost.setPostTitle(thePost.getPostTitle().substring(0,1).toUpperCase()+thePost.getPostTitle().substring(1));
        tempPost.setPostContent(thePost.getPostContent().substring(0,1).toUpperCase()+thePost.getPostContent().substring(1));

        Date data = new Date();
        tempPost.setEditDate(data);
        System.out.println(authentication.getName());
        User tempUser = userService.findByUserName(authentication.getName());
        tempPost.setUser(tempUser);


        postDao.savePost(tempPost);
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

    @Override
    @Transactional
    public List<Post> getPosts(int pageId, int postByPage) {
        return postDao.getPosts(pageId,postByPage);
    }

    @Override
    @Transactional
    public long countPosts() {
        return postDao.countPosts();
    }
}
