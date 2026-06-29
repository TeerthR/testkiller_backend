package com.testkiller.service;

import java.time.Instant;
import java.util.UUID;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.testkiller.config.JwtUtil;
import com.testkiller.dto.LoginRequest;
import com.testkiller.dto.LoginResponse;
import com.testkiller.dto.ResetPasswordRequest;
import com.testkiller.dto.SignupRequest;
import com.testkiller.dto.UserResponse;
import com.testkiller.entity.PasswordResetToken;
import com.testkiller.entity.User;
import com.testkiller.entity.enums.Channel;
import com.testkiller.entity.enums.Role;
import com.testkiller.exception.EmailAlreadyRegisteredException;
import com.testkiller.exception.InvalidCredentialsException;
import com.testkiller.repository.PasswordResetTokenRepository;
import com.testkiller.repository.UserRepository;

@Service
public class AuthService {

	private final UserRepository userRepository;
	private final PasswordEncoder passwordEncoder;
	private final ModelMapper modelMapper;
	private final JavaMailSender javaMailSender;
	private final PasswordResetTokenRepository passwordResetTokenRepository;
	private final JwtUtil jwtUtil;

	@Value("${app.frontend.url}")
	private String baseUrl;

	public AuthService(UserRepository userRepository, PasswordEncoder passwordEncoder,
			ModelMapper modelMapper, JavaMailSender javaMailSender,
			PasswordResetTokenRepository passwordResetTokenRepository, JwtUtil jwtUtil) {
		this.userRepository = userRepository;
		this.passwordEncoder = passwordEncoder;
		this.modelMapper = modelMapper;
		this.javaMailSender = javaMailSender;
		this.passwordResetTokenRepository = passwordResetTokenRepository;
		this.jwtUtil = jwtUtil;
	}

	public UserResponse signupUser(SignupRequest req) {
		if (userRepository.existsByEmail(req.getEmail())) {
			throw new EmailAlreadyRegisteredException("Email is already registered");
		}
		User user = modelMapper.map(req, User.class);
		user.setRole(Role.STUDENT);
		user.setPassword(passwordEncoder.encode(req.getPassword()));
		user.setIsActive(true);
		user.setEmailVerified(false);
		User savedUser = userRepository.save(user);
		return modelMapper.map(savedUser, UserResponse.class);
	}

	public LoginResponse loginUser(LoginRequest req) {
		User user = userRepository.findByEmail(req.getEmail())
				.orElseThrow(() -> new InvalidCredentialsException("Invalid email or password"));
		if (!passwordEncoder.matches(req.getPassword(), user.getPassword())) {
			throw new InvalidCredentialsException("Invalid email or password");
		}
		String token = jwtUtil.generateToken(user.getEmail(), user.getRole().name());
		UserResponse userResponse = modelMapper.map(user, UserResponse.class);
		return new LoginResponse(token, userResponse);
	}

	public void forgotPassword(String email) {
		userRepository.findByEmail(email).ifPresent(user -> {
			String rawToken = UUID.randomUUID().toString();
			String tokenHash = passwordEncoder.encode(rawToken);

			PasswordResetToken resetToken = new PasswordResetToken();
			resetToken.setUser(user);
			resetToken.setTokenHash(tokenHash);
			resetToken.setChannel(Channel.EMAIL);
			resetToken.setIsUsed(false);
			resetToken.setExpiresAt(Instant.now().plusSeconds(15 * 60));
			passwordResetTokenRepository.save(resetToken);

			String resetLink = baseUrl + "/reset-password?token=" + rawToken + "&email=" + email;

			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(email);
			message.setSubject("Testkiller Password Reset");
			message.setText("Click to reset your Testkiller password (expires in 15 minutes):\n" + resetLink);
			javaMailSender.send(message);
		});
	}

	public void resetPassword(ResetPasswordRequest req) {
		String rawToken = req.getToken();

		PasswordResetToken validToken = passwordResetTokenRepository.findAll().stream()
				.filter(t -> !t.getIsUsed()
						&& t.getExpiresAt().isAfter(Instant.now())
						&& passwordEncoder.matches(rawToken, t.getTokenHash()))
				.findFirst()
				.orElseThrow(() -> new InvalidCredentialsException("Invalid or expired reset token"));

		User user = validToken.getUser();
		user.setPassword(passwordEncoder.encode(req.getNewPassword()));
		userRepository.save(user);

		validToken.setIsUsed(true);
		passwordResetTokenRepository.save(validToken);
	}
}