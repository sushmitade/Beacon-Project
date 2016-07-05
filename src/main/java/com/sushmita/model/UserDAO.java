package com.sushmita.model;

import java.util.List;

public interface UserDAO {

	User findById(int id);

	User findBySSO(String sso_id);

	void save(User user);

	void deleteBySSO(String sso_id);

	List<User> findAllUsers();
	
	void sendMail(User user);

}
