package com.sushmita.model;

import java.util.List;

public interface UserRoleDAO {
	
	List<UserRole> findAll();
    
    UserRole findByRole(String role);
     
    UserRole findById(int id);
}