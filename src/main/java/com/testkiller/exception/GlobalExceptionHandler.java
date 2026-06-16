package com.testkiller.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.testkiller.dto.ApiResponse;

@ControllerAdvice
public class GlobalExceptionHandler{
	
	@ExceptionHandler(ResourceNotFoundException.class)
	public ResponseEntity<ApiResponse> handleResourceNotFoundException(ResourceNotFoundException ex){
		ApiResponse res = new ApiResponse(false, ex.getMessage(), null);
		return ResponseEntity.status(HttpStatus.NOT_FOUND).body(res);
	}

	@ExceptionHandler(UserNotFoundException.class)
	public ResponseEntity<ApiResponse> handleUserNotFoundException(UserNotFoundException ex){
		ApiResponse res = new ApiResponse(false, ex.getMessage(), null);
		return ResponseEntity.status(HttpStatus.NOT_FOUND).body(res);
	}
	
	@ExceptionHandler(EmailAlreadyRegisteredException.class)
	public ResponseEntity<ApiResponse> handleEmailAlreadyRegisteredException(EmailAlreadyRegisteredException ex){
		ApiResponse res = new ApiResponse(false, ex.getMessage(), null);
		return ResponseEntity.status(HttpStatus.CONFLICT).body(res);
	}

	
	@ExceptionHandler(InvalidCredentialsException.class)
	public ResponseEntity<ApiResponse> handleInvalidCredentialsException(InvalidCredentialsException ex){
		ApiResponse res = new ApiResponse(false, ex.getMessage(), null);
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(res);
	}
	
	@ExceptionHandler(IllegalArgumentException.class)
	public ResponseEntity<ApiResponse> handleIllegalArgumentException(IllegalArgumentException ex){
		ApiResponse res = new ApiResponse(false, ex.getMessage(), null);
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(res);
	}

	@ExceptionHandler(Exception.class)
	public ResponseEntity<ApiResponse> handleGeneralException(Exception ex){
		ApiResponse res = new ApiResponse(false, "Something went wrong", null);
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(res);
	}
}