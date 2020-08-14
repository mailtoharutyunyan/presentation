package com.auth.server.business;

import com.auth.server.dao.OAuthDaoService;
import com.auth.server.model.CustomUser;
import com.auth.server.model.UserEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final OAuthDaoService oAuthDaoService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity userEntity = null;
        try {
            userEntity = oAuthDaoService.getUserDetails(username);
            if (userEntity != null && userEntity.getId() != null) {
                return new CustomUser(userEntity);
            } else {
                throw new UsernameNotFoundException("User " + username + " was not found in the database");
            }
        } catch (Exception e) {
            throw new UsernameNotFoundException("User " + username + " was not found in the database");
        }
    }
}
