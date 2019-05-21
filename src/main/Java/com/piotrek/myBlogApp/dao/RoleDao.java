package com.piotrek.myBlogApp.dao;

import com.piotrek.myBlogApp.entity.Role;

public interface RoleDao {

    Role findRoleByName(String theRoleName);
}
