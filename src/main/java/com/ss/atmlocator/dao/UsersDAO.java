package com.ss.atmlocator.dao;

import com.ss.atmlocator.entity.Role;
import com.ss.atmlocator.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.math.BigInteger;

@Repository
public class UsersDAO implements IUsersDAO {

    private final String DEFAULT_USER_ROLE = "USER";

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public User getUserByName(String name) {
        TypedQuery<User> query = entityManager.createQuery("SELECT u FROM User AS u WHERE u.login=:name", User.class);
        query.setParameter("name", name);
        User user = query.getSingleResult();
        return user;
    }

    @Override
    public User getUserById(int id) {
        return entityManager.find(User.class, id);
    }


    @Override
    public User getUserByEmail(String email) {
        TypedQuery<User> query = entityManager.createQuery("SELECT u FROM User AS u WHERE u.email=:email", User.class);
        query.setParameter("email", email);
        User user = query.getSingleResult();
        return user;

    }

    @Override
    @Transactional
    public void deleteUser(int id) {
        User deletedUser = entityManager.find(User.class, id);
        entityManager.remove(deletedUser);
    }


    @Override
    @Transactional
    public void updateUser(User user) {
        entityManager.merge(user);
        //entityManager.flush();
    }

    @Override
    public Role getDefaultUserRole() {
        TypedQuery<Role> query = entityManager.createQuery("SELECT r FROM Role AS r WHERE r.name=:name", Role.class);
        query.setParameter("name", DEFAULT_USER_ROLE);
        Role role = query.getSingleResult();
        return role;
    }

    @Override
    @Transactional
    public void createUser(User user) {
        entityManager.persist(user);
    }

    @Override
    public boolean checkExistLoginName(String login) {
        String sqlQuery = "SELECT COUNT(*) FROM users WHERE login = :login";
        Query query = entityManager.createNativeQuery(sqlQuery);
        query.setParameter("login", login);
        int value =  ((BigInteger) query.getSingleResult()).intValue();
        if (value == 0 ) return false;
        return true;
    }
    @Override
    public boolean checkExistLoginName(User user) {
        String sqlQuery = "SELECT COUNT(*) FROM users WHERE login = :login and id != :id";
        Query query = entityManager.createNativeQuery(sqlQuery);
        query.setParameter("id", user.getId());
        query.setParameter("login", user.getLogin());
        int value =  ((BigInteger) query.getSingleResult()).intValue();
        if (value == 0 ) return false;
        return true;
    }

    @Override
    public boolean checkExistEmail(String email) {
        String sqlQuery = "SELECT COUNT(*) FROM users WHERE email = :email";
        Query query = entityManager.createNativeQuery(sqlQuery);
        query.setParameter("email", email);
        int value =  ((BigInteger) query.getSingleResult()).intValue();
        if (value == 0 ) return false;
        return true;
    }

    @Override
    public boolean checkExistEmail(User user) {
        String sqlQuery = "SELECT COUNT(*) FROM users WHERE email = :email and id != :id";
        Query query = entityManager.createNativeQuery(sqlQuery);
        query.setParameter("id", user.getId());
        query.setParameter("email", user.getEmail());
        int value =  ((BigInteger) query.getSingleResult()).intValue();
        if (value == 0 ) return false;
        return true;
    }



}
