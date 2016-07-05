package com.sushmita.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;

	public User findById(int id) {
		return dao.findById(id);
	}

	public User findBySSO(String sso) {
		User user = dao.findBySSO(sso);
		return user;
	}

	public void saveUser(User user) {
		user.setPassword(user.getPassword());
		dao.save(user);
	}

	public void updateUser(User user) {
		User entity = dao.findById(user.getId());
		if (entity != null) {
			entity.setSso_id(user.getSso_id());
			entity.setPatientFirstName(user.getPatientFirstName());
			entity.setPatientLastName(user.getPatientLastName());
			if (!user.getPassword().equals(entity.getPassword())) {
				entity.setPassword(user.getPassword());
			}
			entity.setPatientEmail(user.getPatientEmail());
			entity.setPatientAddress1(user.getPatientAddress1());
			entity.setPatientAddress2(user.getPatientAddress2());
			entity.setPatientCity(user.getPatientCity());
			entity.setPatientState(user.getPatientState());
			entity.setPatientZipCode(user.getPatientZipCode());
			entity.setPatientPhone(user.getPatientPhone());
			entity.setDescription(user.getDescription());
			entity.setUserRoles(user.getUserRoles());
		}
	}

	public void deleteUserBySSO(String sso) {
		dao.deleteBySSO(sso);
	}

	public List<User> findAllUsers() {
		return dao.findAllUsers();
	}

	public boolean isUserSSOUnique(Integer id, String sso) {
		User user = findBySSO(sso);
		return (user == null || ((id != null) && (user.getId() == id)));
	}

}