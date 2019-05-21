package com.piotrek.myBlogApp.dao;

import com.piotrek.myBlogApp.entity.Post;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PostDaoImplementation implements PostDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Post> getPosts() {

        Session session = sessionFactory.getCurrentSession();

        Query<Post> theQuery = session.createQuery("from Post order by editDate",Post.class);

        List<Post> posts =theQuery.getResultList();

        return posts;
    }
}
