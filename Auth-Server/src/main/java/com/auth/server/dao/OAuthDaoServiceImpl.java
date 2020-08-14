package com.auth.server.dao;

import com.auth.server.model.UserEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class OAuthDaoServiceImpl implements OAuthDaoService {

    private final JdbcTemplate jdbcTemplate;

    @Override
    public UserEntity getUserDetails(String emailId) {

        Collection<GrantedAuthority> grantedAuthorities = new ArrayList<>();
        List<UserEntity> list = jdbcTemplate.query("SELECT * FROM user WHERE email = ?", new String[]{emailId},
                (ResultSet rs, int row) -> {
                    UserEntity user = new UserEntity();
                    user.setEmailId(emailId);
                    user.setId(rs.getString("id"));
                    user.setName(rs.getString("name"));
                    user.setPassword(rs.getString("password"));
                    ;
                    return user;
                });
        if (!list.isEmpty()) {
            UserEntity userEntity = list.get(0);
            List<String> permissionList = jdbcTemplate.query("" +
                            "select distinct permission_name from permission p\n" +
                            "inner join assign_permission_to_role aptr on p.id = aptr.permission_id\n" +
                            "inner join role r on aptr.role_id = r.id\n" +
                            "inner join assign_user_to_role autr on r.id = autr.role_id\n" +
                            "inner join user u on autr.user_id = u.id\n" +
                            "where email = ?;" +
                            "", new String[]{userEntity.getEmailId()},
                    (ResultSet resultSet, int rowNum) -> "ROLE_" + resultSet.getString("permission_name"));

            if (!permissionList.isEmpty()) {
                for (String permission : permissionList) {
                    GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(permission);
                    grantedAuthorities.add(grantedAuthority);
                }
                userEntity.setGrantedAuthorityCollection(grantedAuthorities);
            }
            return userEntity;
        }
        return null;
    }
}
