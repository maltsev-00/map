package com.map.nast.service;

import com.map.nast.model.entity.UserRegistrationDto;
import com.map.nast.model.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User findByEmail(String email);

    User save(UserRegistrationDto registration);
}
