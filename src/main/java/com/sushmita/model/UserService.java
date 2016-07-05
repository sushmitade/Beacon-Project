package com.sushmita.model;

import java.util.List;

public interface UserService {

 
    User findBySSO(String sso);
     
    boolean findBySSO(User user);
    
    void saveUser(User user);
     
    void updateUser(User user);
     
    void deleteUserBySSO(String sso);
 
    List<User> findAllUsers(); 
     
    boolean isUserSSOUnique(Integer id, String sso);
 
}
