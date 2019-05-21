package com.piotrek.myBlogApp.service;

import com.piotrek.myBlogApp.entity.User;
import com.piotrek.myBlogApp.user.BlogUser;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User findByUserName(String userName);

    void save(BlogUser theBlogUser);
}
