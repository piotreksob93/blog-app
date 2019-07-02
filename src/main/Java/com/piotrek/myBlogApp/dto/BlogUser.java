package com.piotrek.myBlogApp.dto;

import com.piotrek.myBlogApp.entity.Post;
import com.piotrek.myBlogApp.entity.Role;
import com.piotrek.myBlogApp.validation.FieldMatch;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Base64;
import java.util.List;

@FieldMatch.List({
        @FieldMatch(first = "password", second = "matchingPassword", message = "The password fields must match")
})
public class BlogUser {

    private int id;

    @NotNull(message = "pole wymagane")
    @Size(min = 1, message = "pole wymagane")
    private String userName;

    @NotNull(message = "pole wymagane")
    @Size(min = 1, message = "pole wymagane")
    private String password;

    @NotNull(message = "pole wymagane")
    @Size(min = 1, message = "pole wymagane")
    private String matchingPassword;

    @NotNull(message = "pole wymagane")
    @Size(min = 1, message = "pole wymagane")
    private String firstName;

    @NotNull(message = "pole wymagane")
    @Size(min = 1, message = "pole wymagane")
    private String lastName;

    @Email
    @NotNull(message = "pole wymagane")
    @Size(min = 1, message = "pole wymagane")
    private String email;

    private List<Role> role;

    private List<Post> posts;

    private byte[]avatar;

    private String stringAvatar;

    public BlogUser() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMatchingPassword() {
        return matchingPassword;
    }

    public void setMatchingPassword(String matchingPassword) {
        this.matchingPassword = matchingPassword;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Role> getRole() {
        return role;
    }

    public void setRole(List<Role> role) {
        this.role = role;
    }

    public List<Post> getPosts() {
        return posts;
    }

    public void setPosts(List<Post> posts) {
        this.posts = posts;
    }

    public byte[] getAvatar() {
        return avatar;
    }

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
    }

    public String getStringAvatar() {
        return convertBinImageToString(avatar);
    }

    public void setStringAvatar(String stringAvatar) {
        this.stringAvatar = stringAvatar;
    }

    public static String convertBinImageToString(byte[] binImage) {
        if(binImage!=null && binImage.length>0) {
            return Base64.getEncoder().encodeToString(binImage);
        }
        else
            return "";
    }
}
