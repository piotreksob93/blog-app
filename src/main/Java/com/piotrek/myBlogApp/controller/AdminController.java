package com.piotrek.myBlogApp.controller;

import com.piotrek.myBlogApp.dao.RoleDao;
import com.piotrek.myBlogApp.dao.UserDao;
import com.piotrek.myBlogApp.entity.Role;
import com.piotrek.myBlogApp.entity.User;
import com.piotrek.myBlogApp.service.UserService;
import com.piotrek.myBlogApp.user.RoleDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private Map<String, String> roles;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private UserDao userDao;

    @PostConstruct
    private void loadRoles() {
        roles = new LinkedHashMap<>();

        roles.put("ROLE_USER", "User");
        roles.put("ROLE_ADMIN", "Admin");
    }

    @Autowired
    private UserService userService;

    @GetMapping("/panel")
    public String showAdminPanelPAge() {
        return "admin-panel-page";
    }

    @GetMapping("/users")
    public String showUsersList(Model theModel) {

        List<User> users = userService.getUsers();

        theModel.addAttribute("users",users);

        return "users-list-page";
    }

    @GetMapping("/change")
    public String showRoleChangePage(@RequestParam ("username") String username,Model theModel){

        RoleDto roleDto = new RoleDto();

        roleDto.setUsername(username);

        theModel.addAttribute("roleDto",roleDto);

        theModel.addAttribute("roles", roles);

        return "role-change-page";
    }

    @PostMapping("/processRoleUpdate")
    @Transactional
    public String processRoleUpdate(@ModelAttribute ("roleDto") RoleDto roleDto){

        User user = userService.findByUserName(roleDto.username);

        List<Role> roles = new ArrayList<>();

        roles.add(roleDao.findRoleByName("ROLE_USER"));

        if(!roleDto.formRole.equals("ROLE_USER")){
            roles.add(roleDao.findRoleByName(roleDto.formRole));
        }

        user.setRole(roles);

        userDao.save(user);




        return "redirect:/admin/users";
    }
}
