package com.sushmita.converter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.sushmita.model.UserRole;
import com.sushmita.model.UserRoleService;

@Component
public class RoleToUserRoleConverter implements Converter<Object, UserRole> {

	static final Logger logger = LoggerFactory.getLogger(RoleToUserRoleConverter.class);

	@Autowired
	UserRoleService userRoleService;

	public UserRole convert(Object element) {
		Integer id = Integer.parseInt((String) element);
		UserRole role = userRoleService.findById(id);
		logger.info("Role : {}", role);
		return role;
	}

}