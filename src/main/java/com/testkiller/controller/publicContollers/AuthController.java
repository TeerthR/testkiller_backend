package com.testkiller.controller.publicContollers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.testkiller.dto.ApiResponse;
import com.testkiller.dto.ForgotPasswordRequest;
import com.testkiller.dto.LoginRequest;
import com.testkiller.dto.ResetPasswordRequest;
import com.testkiller.dto.SignupRequest;
import com.testkiller.dto.UserResponse;
import com.testkiller.service.AuthService;

import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/v1/public/auth")
@Tag(name="Authentication", description="User authentication endpoints")
public class AuthController{
	
	private AuthService authService;
	
	public AuthController(AuthService authService) {
		this.authService=authService;
	}
	
	@PostMapping("/signup")
	public ResponseEntity<ApiResponse> signupUser(@Valid @RequestBody SignupRequest req){
		UserResponse userRes = authService.signupUser(req);
		ApiResponse apiRes = new ApiResponse(true, "User signed up successfully", userRes);
		return ResponseEntity.status(HttpStatus.CREATED).body(apiRes);
	}
	
	@PostMapping("/login")
	public ResponseEntity<ApiResponse> loginUser(@Valid @RequestBody LoginRequest req){
		UserResponse userRes = authService.loginUser(req);
		ApiResponse apiRes = new ApiResponse(true, "User logged in successfully", userRes);
		return ResponseEntity.ok().body(apiRes);
	}

	@PostMapping("/forgot-password")
	public ResponseEntity<ApiResponse> forgotPassword(@Valid @RequestBody ForgotPasswordRequest req) {
		authService.forgotPassword(req.getEmail());
		ApiResponse apiRes = new ApiResponse(true, "If this email exists, a reset link has been sent", null);
		return ResponseEntity.ok(apiRes);
	}

	@PostMapping("/reset-password")
	public ResponseEntity<ApiResponse> resetPassword(@Valid @RequestBody ResetPasswordRequest req) {
		authService.resetPassword(req);
		ApiResponse apiRes = new ApiResponse(true, "Password reset successfully", null);
		return ResponseEntity.ok(apiRes);
	}

}