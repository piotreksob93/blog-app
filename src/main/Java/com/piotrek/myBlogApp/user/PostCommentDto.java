package com.piotrek.myBlogApp.user;

import com.piotrek.myBlogApp.entity.Post;
import com.piotrek.myBlogApp.entity.User;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

public class PostCommentDto {

    public int id;

    @NotNull(message = "pole wymagane")
    @Size(min = 1, message = "pole wymagane")
    private String commentContent;

    private Date editDate;

    private User user;

    private Post post;

    public PostCommentDto() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getEditDate() {
        return editDate;
    }

    public void setEditDate(Date editDate) {
        this.editDate = editDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }
}
