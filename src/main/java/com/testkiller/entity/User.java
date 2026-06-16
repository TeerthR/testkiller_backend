package com.testkiller.entity;

import java.time.Instant;
import java.time.LocalDate;

import com.testkiller.entity.enums.Gender;
import com.testkiller.entity.enums.Role;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

@Entity
@Table(name = "users")
public class User{

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable=false)
	@Enumerated(EnumType.STRING)
	private Role role;
	
	@Column(nullable=false)
	private String firstName;
	
	@Column(nullable=false)
	private String lastName;
	
	@Column(nullable=false, unique=true)
	private String email;
	
	@Column(nullable=false)
	private String password;
	
	@Column(nullable=true, unique=true)
	private String mobile;
		
	@Column(nullable=true)
	@Enumerated(EnumType.STRING)
	private Gender gender;
	
	@Column(nullable=true)
	private LocalDate dateOfBirth;
	
	@Column(nullable=true)
	private String profilePhotoUrl;
	
	@Column(nullable=false)
	private Boolean isActive;
	
	@Column(nullable=false)
	private Boolean emailVerified;
	
	@Column(nullable=false)
	private Instant createdAt;
	
	@Column(nullable=true)
	private Instant updatedAt;
	
	
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getProfilePhotoUrl() {
		return profilePhotoUrl;
	}

	public void setProfilePhotoUrl(String profilePhotoUrl) {
		this.profilePhotoUrl = profilePhotoUrl;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Boolean getEmailVerified() {
		return emailVerified;
	}

	public void setEmailVerified(Boolean emailVerified) {
		this.emailVerified = emailVerified;
	}

	public Instant getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(Instant createdAt) {
		this.createdAt = createdAt;
	}

	public Instant getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Instant updatedAt) {
		this.updatedAt = updatedAt;
	}

	@PrePersist
	protected void onCreate() {
		if(this.createdAt==null) {
			this.createdAt=Instant.now();
		}
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt=Instant.now();
	}
}