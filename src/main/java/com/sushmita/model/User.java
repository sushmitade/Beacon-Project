package com.sushmita.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "PATIENTSBEACON")
public class User implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PATIENTSBEACON_ID_SEQ")
	@SequenceGenerator(name = "PATIENTSBEACON_ID_SEQ", sequenceName = "PATIENTSBEACON_ID_SEQ")
	private Integer id;

	@NotEmpty
	@Column(name = "SSO_ID", unique = true, nullable = false)
	private String sso_id;

	@NotEmpty
	@Column(name = "PATIENTFIRSTNAME", nullable = false)
	private String patientFirstName;

	@NotEmpty
	@Column(name = "PATIENTLASTNAME", nullable = false)
	private String patientLastName;

	@NotEmpty
	@Column(name = "PASSWORD", nullable = false)
	private String password;

	@NotEmpty
	@Column(name = "PATIENTEMAIL", nullable = false)
	private String patientEmail;

	@NotEmpty
	@Column(name = "PATIENTADDRESS1", nullable = false)
	private String patientAddress1;

	@Column(name = "PATIENTADDRESS2")
	private String patientAddress2;

	@NotEmpty
	@Column(name = "PATIENTCITY", nullable = false)
	private String patientCity;

	@NotEmpty
	@Column(name = "PATIENTSTATE", nullable = false)
	private String patientState;

	@NotEmpty
	@Column(name = "PATIENTZIPCODE", nullable = false)
	private String patientZipCode;

	@NotEmpty
	@Column(name = "PATIENTPHONE", nullable = false)
	private String patientPhone;

	@NotEmpty
	@Column(name = "DESCRIPTION", nullable = false)
	private String description;

	@NotEmpty
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "BEACON_PATIENTSBEACON_USERROLE", joinColumns = {
			@JoinColumn(name = "USER_ID") }, inverseJoinColumns = { @JoinColumn(name = "USER_ROLE_ID") })
	private Set<UserRole> userRoles = new HashSet<UserRole>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSso_id() {
		return sso_id;
	}

	public void setSso_id(String sso_id) {
		this.sso_id = sso_id;
	}

	public String getPatientFirstName() {
		return patientFirstName;
	}

	public void setPatientFirstName(String patientFirstName) {
		this.patientFirstName = patientFirstName;
	}

	public String getPatientLastName() {
		return patientLastName;
	}

	public void setPatientLastName(String patientLastName) {
		this.patientLastName = patientLastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPatientEmail() {
		return patientEmail;
	}

	public void setPatientEmail(String patientEmail) {
		this.patientEmail = patientEmail;
	}

	public String getPatientAddress1() {
		return patientAddress1;
	}

	public void setPatientAddress1(String patientAddress1) {
		this.patientAddress1 = patientAddress1;
	}

	public String getPatientAddress2() {
		return patientAddress2;
	}

	public void setPatientAddress2(String patientAddress2) {
		this.patientAddress2 = patientAddress2;
	}

	public String getPatientCity() {
		return patientCity;
	}

	public void setPatientCity(String patientCity) {
		this.patientCity = patientCity;
	}

	public String getPatientState() {
		return patientState;
	}

	public void setPatientState(String patientState) {
		this.patientState = patientState;
	}

	public String getPatientZipCode() {
		return patientZipCode;
	}

	public void setPatientZipCode(String patientZipCode) {
		this.patientZipCode = patientZipCode;
	}

	public String getPatientPhone() {
		return patientPhone;
	}

	public void setPatientPhone(String patientPhone) {
		this.patientPhone = patientPhone;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<UserRole> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(Set<UserRole> userRoles) {
		this.userRoles = userRoles;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((sso_id == null) ? 0 : sso_id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof User))
			return false;
		User other = (User) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (sso_id == null) {
			if (other.sso_id != null)
				return false;
		} else if (!sso_id.equals(other.sso_id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", sso_id=" + sso_id + ", patientFirstName=" + patientFirstName + ", patientLastName="
				+ patientLastName + ", password=" + password + ", patientEmail=" + patientEmail + ", patientAddress1="
				+ patientAddress1 + ", patientAddress2=" + patientAddress2 + ", patientCity=" + patientCity
				+ ", patientState=" + patientState + ", patientZipCode=" + patientZipCode + ", patientPhone="
				+ patientPhone + ", description=" + description + "]";
	}

}
