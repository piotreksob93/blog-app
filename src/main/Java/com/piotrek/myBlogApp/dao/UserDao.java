package com.piotrek.myBlogApp.dao;

import com.piotrek.myBlogApp.entity.User;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.List;

public interface UserDao {

    User findByUserName(String userName);

    void save(User user);

    void updatePassword(String password,String username);

    List<User> getUsers();

    void updateAvatar(int userId, byte[] aFile);

    void deleteAvatar(int userId);
}
