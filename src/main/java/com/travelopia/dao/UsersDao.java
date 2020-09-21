/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.travelopia.dao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import com.travelopia.pojo.Users;
import java.util.*;

/**
 *
 * @author manja
 */
public class UsersDao {
    private Session session=null;
    private List<String> resultList = new ArrayList<String>();
    private static final SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();   
    private Session getSession(){
       if(session==null || !session.isOpen()){
           session = sf.openSession();
       }
       return session;
    }
    
    public int addUser(Users user)
    {
        int result = 0;
        try {
            getSession().beginTransaction();
            getSession().save(user);
            getSession().getTransaction().commit();
             result = 1;
        } catch (HibernateException e) {
            e.printStackTrace();
            getSession().getTransaction().rollback();
        } finally {
            getSession().close();
        }       
       return result;
    }

    public int verifyLogin(String username, String password)
    {     
        int result = 0;
       try{
            System.out.println("username:"+username);
           String searchQuery = "select password from Users where username =:username";
           getSession().beginTransaction();
           Query query = getSession().createQuery(searchQuery);
           query.setParameter("username",username);
            resultList = query.list();
            
           if(resultList.size() > 0)
           {    
                String registeredPassword = resultList.get(0);
                if(password.equals(resultList.get(0)))
                {
                  
                    //login verified
                    //if user is admin
                    if(username.equalsIgnoreCase("admin"))
                    {
                        result = 2;
                    }
                    else
                    {
                        //normal user
                        result = 1;
                    }
                    getSession().getTransaction().commit();  
                }
                else
                {
                result = 0;
                }
            }       
       }
       catch (HibernateException e) {
            result = 0;
            e.printStackTrace();
            getSession().getTransaction().rollback();
        } 
       finally {
            getSession().close();
        }   
        return result;
    }
    public int chechUsername(String username)
    {
        int result = 0;
        try 
        {
           String squery = "from Users where username =:username";
           getSession().beginTransaction();
           Query query = getSession().createQuery(squery);
           query.setParameter("username",username);
            resultList = query.list();
            if(resultList.isEmpty())
            {
                result = 1;
                //user doesnt exist
            }
            else
            {
                result = 2;
                //user exists
            }
        }
        catch (Exception e) {
            result = 0;
            e.printStackTrace();
            getSession().getTransaction().rollback();
        }
        finally {
            getSession().close();
        }
        return result;
    }
}
