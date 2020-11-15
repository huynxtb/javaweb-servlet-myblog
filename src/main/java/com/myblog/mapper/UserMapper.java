package com.myblog.mapper;


import com.myblog.model.RoleModel;
import com.myblog.model.UserModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<UserModel> {

    @Override
    public UserModel mapRow(ResultSet resultSet) {
        try {
            UserModel user = new UserModel();
            user.setId(resultSet.getLong("id"));
            user.setUserName(resultSet.getString("username"));
            user.setFullName(resultSet.getString("fullname"));
            user.setEmail(resultSet.getString("email"));
            user.setPassword(resultSet.getString("password"));
            user.setRoleId(resultSet.getLong("roleid"));
            user.setStatus(resultSet.getInt("status"));
            user.setCreatedDate(resultSet.getTimestamp("createddate"));
            user.setCreatedBy(resultSet.getString("createdby"));
            if (resultSet.getTimestamp("modifieddate") != null) {
                user.setModifiedDate(resultSet.getTimestamp("modifieddate"));
            }
            if (resultSet.getString("modifiedby") != null) {
                user.setModifiedBy(resultSet.getString("modifiedby"));
            }
            try {
                RoleModel role = new RoleModel();
                role.setCode(resultSet.getString("code"));
                role.setName(resultSet.getString("name"));
                user.setRole(role);
            } catch (Exception e) {
                System.out.print(e.getMessage());
            }
            return user;
        } catch (SQLException e) {
            return null;
        }
    }
}
