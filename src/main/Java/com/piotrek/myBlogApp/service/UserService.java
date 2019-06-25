package com.piotrek.myBlogApp.service;

import com.piotrek.myBlogApp.entity.User;
import com.piotrek.myBlogApp.user.BlogUser;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {

    User findByUserName(String userName);

    void save(BlogUser theBlogUser);

    void updatePassword(String password, String username);

    List<User> getUsers();
}
