package com.myblog.service.impl;

import com.myblog.dao.IUserDAO;
import com.myblog.model.UserModel;
import com.myblog.paging.Pageble;
import com.myblog.service.IUserService;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

public class UserService implements IUserService {

    @Inject
    private IUserDAO userDAO;

    @Override
    public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
        return userDAO.findByUserNameAndPasswordAndStatus(userName, password, status);
    }

    @Override
    public UserModel save(UserModel userModel) {
        userModel.setStatus(1);
        userModel.setRoleId(2L);
        userModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        userModel.setCreatedBy("SYSTEM");
        Long userId = userDAO.save(userModel);
        return userDAO.findOne(userId);
    }

    @Override
    public UserModel update(UserModel updateUser) {
        UserModel oldUser = userDAO.findOne(updateUser.getId());
        updateUser.setUserName(oldUser.getUserName());
        updateUser.setStatus(oldUser.getStatus());
        updateUser.setRoleId(oldUser.getRoleId());
        updateUser.setCreatedDate(oldUser.getCreatedDate());
        updateUser.setCreatedBy(oldUser.getCreatedBy());
        updateUser.setModifiedDate(new Timestamp(System.currentTimeMillis()));
        userDAO.update(updateUser);
        return userDAO.findOne(updateUser.getId());
    }

    @Override
    public UserModel delete(UserModel deleteUser) {
        UserModel oldUser = userDAO.findOne(deleteUser.getId());
        deleteUser.setUserName(oldUser.getUserName());
        deleteUser.setPassword(oldUser.getPassword());
        deleteUser.setFullName(oldUser.getFullName());
        deleteUser.setEmail(oldUser.getEmail());
        deleteUser.setRoleId(oldUser.getRoleId());
        deleteUser.setCreatedBy(oldUser.getCreatedBy());
        deleteUser.setCreatedDate(oldUser.getCreatedDate());
        deleteUser.setModifiedDate(new Timestamp(System.currentTimeMillis()));
        deleteUser.setStatus(0);
        userDAO.update(deleteUser);
        return userDAO.findOne(deleteUser.getId());

    }

    @Override
    public List<UserModel> findAll(Pageble pageble) {
        return userDAO.findAll(pageble);
    }

    @Override
    public int getTotalItem() {
        return userDAO.getTotalItem();
    }

    @Override
    public UserModel findByUserName(String userName) {
        return userDAO.findByUserName(userName);
    }

    @Override
    public UserModel findOne(Long id) {
        return userDAO.findOne(id);
    }

}
