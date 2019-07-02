package com.piotrek.myBlogApp.dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class PasswordDto {

    private String username;

    private String password;

    @NotNull(message = "pole wymagane")
    @Size(min = 1, message = "pole wymagane")
    private String oldPassword;

    @NotNull(message = "pole wymagane")
    @Size(min = 1, message = "pole wymagane")
    private String newPassword;

    public PasswordDto() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
