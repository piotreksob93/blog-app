package com.piotrek.myBlogApp.dao;

import com.piotrek.myBlogApp.entity.User;

import java.util.List;

public interface UserDao {

    User findByUserName(String userName);

    void save(User user);

    void updatePassword(String password,String username);

    List<User> getUsers();
}
