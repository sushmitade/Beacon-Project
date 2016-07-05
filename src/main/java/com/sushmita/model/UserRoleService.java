package com.sushmita.model;

import java.util.List;

public interface UserRoleService {
	
	UserRole findById(int id);
	 
    UserRole findByRole(String role);
     
    List<UserRole> findAll();
     
}