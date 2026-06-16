package com.testkiller.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public class ResetPasswordRequest {

	@NotBlank(message = "Token is required")
	private String token;

	@NotBlank
	@Size(min = 8, message = "Password must be at least 8 characters")
	@Pattern(
		regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$",
		message = "Password must have 1 uppercase, 1 lowercase, 1 digit, 1 special character"
	)
	private String newPassword;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
}
