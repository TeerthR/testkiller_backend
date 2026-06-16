package com.testkiller.dto;

import java.time.LocalDate;

import com.testkiller.entity.enums.Gender;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public class SignupRequest{
	
	@NotBlank(message="First name is required")
	@Size(max=80, message="Length can't exceed 80 characters")
	private String firstName;
	
	@NotBlank(message="Last name is required")
	@Size(max=80, message="Length can't exceed 80 characters")
	private String lastName;
	
	@NotBlank(message="Email is required")
	@Email
	@Size(max=255, message="Length can't exceed 255 characters")
	private String email;
	
	@NotBlank(message="Password is required")
	@Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$",message = "Password must be at least 8 characters with 1 uppercase, 1 lowercase, 1 digit, 1 special character")
	private String password;
	
	@Pattern(regexp = "^\\+?[0-9]{10,15}$", message = "Invalid mobile number")
	private String mobile;
	
	private Gender gender;
	
	@Past(message="Date must be in the past")
	private LocalDate dateOfBirth;
	
	@Size(max=500, message="URL length can't exceed 500 characters")
	private String profilePhotoUrl;

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
}