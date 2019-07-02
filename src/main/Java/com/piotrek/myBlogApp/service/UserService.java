package com.piotrek.myBlogApp.service;

import com.piotrek.myBlogApp.entity.User;
import com.piotrek.myBlogApp.dto.BlogUser;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.List;

public interface UserService extends UserDetailsService {

    User findByUserName(String userName);

    void save(BlogUser theBlogUser);

    void updatePassword(String password, String username);

    List<User> getUsers();

    void updateAvatar(int userId, byte[] aFile);

    void deleteAvatar(int userId);
}
