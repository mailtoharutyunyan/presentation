package com.auth.server.dao;

import com.auth.server.model.UserEntity;

public interface OAuthDaoService {
    UserEntity getUserDetails(String emailId);
}
