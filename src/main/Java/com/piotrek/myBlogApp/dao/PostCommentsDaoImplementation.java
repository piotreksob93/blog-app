package com.piotrek.myBlogApp.dao;

import com.piotrek.myBlogApp.entity.PostComments;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PostCommentsDaoImplementation implements PostCommentsDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(PostComments tempPostComments) {

        Session session = sessionFactory.getCurrentSession();

        session.clear();

        session.saveOrUpdate(tempPostComments);

    }

    @Override
    public void delete(int theId) {
        Session session = sessionFactory.getCurrentSession();

        PostComments postComment = getComment(theId);

        postComment.getPost().getPostComments().remove(postComment);

        session.delete(postComment);
    }

    public PostComments getComment(int theId) {
        Session session = sessionFactory.getCurrentSession();

        PostComments tempPostComments = session.get(PostComments.class,theId);

        return tempPostComments;
    }
}
