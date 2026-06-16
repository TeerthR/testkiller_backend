package com.testkiller.exception;

public class EmailAlreadyRegisteredException extends RuntimeException{
	public EmailAlreadyRegisteredException(String msg) {
		super(msg);
	}
}