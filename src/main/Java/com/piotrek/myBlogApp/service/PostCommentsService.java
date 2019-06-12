package com.piotrek.myBlogApp.service;

import com.piotrek.myBlogApp.entity.PostComments;
import com.piotrek.myBlogApp.user.PostCommentDto;
import org.springframework.security.core.Authentication;

public interface PostCommentsService {

    void save(PostCommentDto theComment, Authentication authentication);

    void delete(int theId);

    PostComments getComment(int theId);
}
