package com.piotrek.myBlogApp.dao;

import com.piotrek.myBlogApp.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImplementation implements UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public User findByUserName(String userName) {
        Session currentSession = sessionFactory.getCurrentSession();

        Query<User> theQuery = currentSession.createQuery("from User where userName=:uName", User.class);
        theQuery.setParameter("uName", userName);
        User theUser = null;
        try {
            theUser = theQuery.getSingleResult();
        } catch (Exception e) {
            theUser = null;
        }


        return theUser;
    }

    @Override
    public void save(User user) {
    Session session = sessionFactory.getCurrentSession();

    session.merge(user);
    session.flush();

    }

    @Override
    public void updatePassword(String password,String username) {
        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery("update User set password = :pass  where userName= :name");
        query.setParameter("pass",password);
        query.setParameter("name",username);
        query.executeUpdate();
    }

    @Override
    public List<User> getUsers() {
        Session session = sessionFactory.getCurrentSession();

        Query query =session.createQuery("from User ",User.class);
        List<User> users = query.getResultList();
        return users;
    }
}
