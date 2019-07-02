package com.piotrek.myBlogApp.service;

import com.piotrek.myBlogApp.dao.PostCommentsDao;
import com.piotrek.myBlogApp.entity.PostComments;
import com.piotrek.myBlogApp.entity.User;
import com.piotrek.myBlogApp.dto.PostCommentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Repository
public class PostCommentsServiceImplementation implements PostCommentsService {

    @Autowired
    private UserService userService;

    @Autowired
    private PostCommentsDao postCommentsDao;

    @Override
    @Transactional
    public void save(PostCommentDto theComment, Authentication authentication) {

        PostComments tempPostComments = new PostComments();

        tempPostComments.setId(theComment.getId());

        tempPostComments.setCommentContent(theComment.getCommentContent());

        Date data = new Date();
        tempPostComments.setEditDate(data);

        tempPostComments.setPost(theComment.getPost());

        User tempUser = userService.findByUserName(authentication.getName());
        tempPostComments.setUser(tempUser);
        postCommentsDao.save(tempPostComments);
    }

    @Override
    @Transactional
    public void delete(int theId) {
        postCommentsDao.delete(theId);
    }

    @Override
    @Transactional
    public PostComments getComment(int theId) {
        return postCommentsDao.getComment(theId);
    }
}
