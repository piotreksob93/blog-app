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

        Query<Post> theQuery = session.createQuery("from Post order by id desc",Post.class);

        List<Post> posts =theQuery.getResultList();

        return posts;
    }

    @Override
    public void savePost(Post thePost) {
        Session session = sessionFactory.getCurrentSession();

        session.clear();

        session.saveOrUpdate(thePost);
    }

    @Override
    public void delete(int theId) {
        Session session = sessionFactory.getCurrentSession();

        Post tempPost = getPost(theId);

        tempPost.getUser().getPosts().remove(tempPost);

        session.delete(tempPost);
    }

    @Override
    public Post getPost(int theId) {
        Session session = sessionFactory.getCurrentSession();

        Post tempPost = session.get(Post.class,theId);
        return tempPost;
    }

    @Override
    public List<Post> getPosts(int pageId, int postByPage) {

        Session session = sessionFactory.getCurrentSession();
        Query<Post> query = session.createQuery("from Post order by id desc",Post.class);
        query.setFirstResult(pageId-1);
        query.setMaxResults(postByPage);

        List<Post> posts = query.getResultList();

        return posts;
    }

    @Override
    public long countPosts() {
        Session session = sessionFactory.getCurrentSession();

        Long result = (Long) session.createQuery("select count(p.id) from Post p").getSingleResult();

        return result;
    }
}
