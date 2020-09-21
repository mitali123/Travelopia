/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.travelopia.controller;
import com.mysql.cj.conf.PropertyKey;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import java.util.HashMap;
import java.util.Map;
import com.travelopia.pojo.Users;
import com.travelopia.dao.UsersDao;
import org.aspectj.apache.bcel.classfile.Utility;
import org.hibernate.Session;
/**
 *
 * @author manja
 */
public class UserController extends AbstractController{

protected ModelAndView handleRequestInternal(HttpServletRequest request,HttpServletResponse response) throws Exception
{
    ModelAndView mv = null;
    String url = request.getRequestURI();
    System.out.println("url:"+url);
    String[] split = url.split("/");
    String operation = null;
    int result = 0;
    operation = request.getRequestURI().substring(request.getRequestURI().lastIndexOf('/') + 1);
    UsersDao userdao = new UsersDao();
    System.out.println("operation: "+operation);
            if(operation!=null){
                switch(operation){
                case "login.htm":
                    mv =  new ModelAndView("login");
                    break;

                case "loginUser.htm":
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    
                  
                        result = userdao.verifyLogin(username,password);
                        if(result == 1)
                        {
                            //normal user
                            mv = new ModelAndView("successLogin","username",username);
                        }
                        else if(result == 2)
                        {
                            //admin user
                            mv = new ModelAndView("adminLogin");
                        }
                        else
                        {
                            mv =  new ModelAndView("errorLogin");
                        }
                    break;

                case "loginRegister.htm":
                    mv = new ModelAndView("registerUser");
                    break;

                case "registerNewUser.htm":
                    Users user = new Users();
                    String userName = request.getParameter("username");
                    String password1 = request.getParameter("password");
                    //password validation check
//                    1) Password must contain at least 8 characters
//                    2) Password must contain at least 1 number
//                    3) Password must contain at least 1 upper case letter
//                    4) Password must contain at least 1 lower case letter
//                    5) Password must contain at least 1 special character
//                    6) Password must not contain any spaces
                    String strRegEx = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])(?=\\S+$).{8,}$";
                    if(password1.matches(strRegEx))
                    {
                        //valid password
                         //check whether user with same username exists
                        result = userdao.chechUsername(userName);
                        if(result == 1)
                        {
                            //user doesnt exist
                            user.setUsername(userName);
                            user.setPassword(password1);
                            user.setEmail(request.getParameter("email"));
                            String usertype = null;
                            if(userName.equalsIgnoreCase("admin"))
                            {
                                usertype = "admin";
                            }
                            else
                            {
                                usertype = "user";
                            }
                            user.setUsertype(usertype);
                    
                            result = userdao.addUser(user);
                            if(result==1)
                                mv = new ModelAndView("successRegister");
                            else
                                mv = new ModelAndView("errorRegister");
                        }
                        else if(result == 2)
                        {
                            //user already exists
                            mv = new ModelAndView("userexistsRegister");
                        }
                        else
                        {
                            //error
                            mv = new ModelAndView("errorRegister");
                        }
                    }
                    else
                    {
                         //invalid password
                        mv = new ModelAndView("passwordincorrect");
                    }   
                    break;
                    
                
                    }
                    
                    
            }




return mv;
}
}
