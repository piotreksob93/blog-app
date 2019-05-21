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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Collection;
import java.util.stream.Collectors;

@Service
public class UserServiceImplemntation implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

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

        user.setUserName(theBlogUser.getUserName());
        user.setPassword(passwordEncoder.encode(theBlogUser.getPassword()));
        user.setFirstName(theBlogUser.getFirstName());
        user.setLastName(theBlogUser.getLastName());
        user.setEmail(theBlogUser.getEmail());

        user.setRole(Arrays.asList(roleDao.findRoleByName("ROLE_USER")));

        userDao.save(user);
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

    private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles) {
        return roles.stream().map(role -> new SimpleGrantedAuthority(role.getRoleName())).collect(Collectors.toList());
    }
}
