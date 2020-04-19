package com.my.spring.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.my.spring.pojo.User;

public class UserDAO extends DAO{
	
	public UserDAO() {
	}
	
	public boolean checkUser(String name) throws Exception {
        Query q = getSession().createQuery("from User where userName = :username");
        q.setParameter("username", name);
        User user = (User) q.uniqueResult();
        if(user!=null)
        {
            return true;
        }
        return false;
    }
	public User get(String username, String password) throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("from User where username = :username and password = :password");
			q.setString("username", username);
			q.setString("password", password);			
			User user = (User) q.uniqueResult();
			commit();
			return user;
		} catch (HibernateException e) {
			rollback();
			throw e;
		}
	}
	
	public User register(User u)
			 {
		try {
			begin();
			System.out.println("inside DAO");		
			getSession().save(u);
			commit();
			return u;

		} catch (HibernateException e) {
			rollback();
			throw e;
		}
	}

}
