package com.piotrek.myBlogApp.service;

import com.piotrek.myBlogApp.dao.RoleDao;
import com.piotrek.myBlogApp.dao.UserDao;
import com.piotrek.myBlogApp.entity.Role;
import com.piotrek.myBlogApp.entity.User;
import com.piotrek.myBlogApp.user.BlogUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImplementation implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;



    @Override
    @Transactional
    public User findByUserName(String userName) {
        User user = userDao.findByUserName(userName);
        return user;
    }

    @Override
    @Transactional
    public void save(BlogUser theBlogUser) {

        User user = new User();

        user.setId(theBlogUser.getId());
        user.setUserName(theBlogUser.getUserName());
        if (theBlogUser.getPassword() != null) {
            user.setPassword(theBlogUser.getPassword());
        }
        user.setFirstName(theBlogUser.getFirstName());
        user.setLastName(theBlogUser.getLastName());
        user.setEmail(theBlogUser.getEmail());

        if (theBlogUser.getRole() == null) {
            user.setRole(Arrays.asList(roleDao.findRoleByName("ROLE_USER")));
        }
        else{
            user.setRole(theBlogUser.getRole());
        }

        if (theBlogUser.getPosts() != null) {
            user.setPosts(theBlogUser.getPosts());
        }

        userDao.save(user);
    }

    @Override
    @Transactional
    public void updatePassword(String password,String username) {
        userDao.updatePassword(password,username);
    }

    @Override
    @Transactional
    public List<User> getUsers() {
        return userDao.getUsers();
    }

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        User user = userDao.findByUserName(userName);
        if (user == null) {
            throw new UsernameNotFoundException("Invalid username or password.");
        }
        return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(),
                mapRolesToAuthorities(user.getRole()));
    }

    private List<? extends GrantedAuthority> mapRolesToAuthorities(List<Role> roles) {
        return roles.stream().map(role -> new SimpleGrantedAuthority(role.getRoleName())).collect(Collectors.toList());
    }
}
