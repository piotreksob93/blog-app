package com.piotrek.myBlogApp.dao;


import com.piotrek.myBlogApp.entity.PostComments;

public interface PostCommentsDao {
    void save(PostComments tempPostComments);

    void delete(int theId);

    PostComments getComment(int theId);
}
