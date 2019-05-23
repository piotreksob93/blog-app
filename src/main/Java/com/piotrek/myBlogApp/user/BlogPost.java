package com.piotrek.myBlogApp.user;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

public class BlogPost {

    private int id;

    @NotNull(message = "Post musi miec tytul")
    @Size(min = 1,message = "Post musi miec tytul")
    private String postTitle;

    @NotNull(message = "Post musi miec tresc")
    @Size(min = 1,message = "Post musi miec tresc")
    private String postContent;

    private Date editDate;

    public BlogPost() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public Date getEditDate() {
        return editDate;
    }

    public void setEditDate(Date editDate) {
        this.editDate = editDate;
    }
}
