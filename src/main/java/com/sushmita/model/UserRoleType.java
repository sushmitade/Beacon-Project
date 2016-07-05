package com.sushmita.model;

import java.io.Serializable;

public enum UserRoleType implements Serializable {
	USER("USER"),ADMIN("ADMIN");

	String userRoleType;

	private UserRoleType(String userRoleType) {
		this.userRoleType = userRoleType;
	}

	public String getUserRoleType() {
		return userRoleType;
	}

}