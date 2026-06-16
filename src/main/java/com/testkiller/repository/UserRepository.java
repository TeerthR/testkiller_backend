package com.testkiller.repository;

import java.util.List;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.testkiller.entity.User;
import com.testkiller.entity.enums.Role;

public interface UserRepository extends JpaRepository<User,Long>{
	
	Optional<User> findByEmail(String email);
	
	boolean existsByEmail(String email);
	
	boolean existsByMobile(String mobile);

	List<User> findByRole(Role role);
	
}